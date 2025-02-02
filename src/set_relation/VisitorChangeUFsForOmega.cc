#include "VisitorChangeUFsForOmega.h"
namespace  iegenlib{
/* VisitorChangeUFsForOmega */

VisitorChangeUFsForOmega::VisitorChangeUFsForOmega() { reset(); }

VisitorChangeUFsForOmega::~VisitorChangeUFsForOmega() { reset(); }

void VisitorChangeUFsForOmega::reset() {
    ufCallDecls.clear();
    macros.clear();
    knownUFs.clear();
    nextFuncReplacementNumber = 0;
    currentTupleDecl = NULL;
    for(auto uf : ufMap) { delete uf.second;}
    ufMap.clear();
}

void VisitorChangeUFsForOmega::prepareForNext() {
    ufCallDecls.clear();
    currentTupleDecl = NULL;
    // known UFs are preserved for reference in next
    // macros are accumulated over Visitor lifetime
}

std::map<std::string, std::string>* VisitorChangeUFsForOmega::getUFMacros() {
    return &macros;
}

std::set<std::string> VisitorChangeUFsForOmega::getUFCallDecls() {
    return ufCallDecls;
}


std::map<int,std::string>& VisitorChangeUFsForOmega::getTupleAssignments(){
    return tupleAssignments;
}


std::map<std::string, UFCallTerm*>& VisitorChangeUFsForOmega::getUFMap()  {
    return ufMap;
}

void VisitorChangeUFsForOmega::preVisitConjunction(Conjunction* c){
    bool requireChange = false;
    std::string prefix = "__x";
    std::list<Exp*> newConstraints;
    TupleDecl decl = c->getTupleDecl();
    for(unsigned int i = 0; i <decl.getSize(); i++){
        if(decl.elemIsConst(i)){
	    requireChange = true;
	    decl.setTupleElem(i,prefix+std::to_string(i));
	    // Create constraint for replacement
	    TupleVarTerm* tupleTerm = new TupleVarTerm(i);
	    Term* constTerm = new Term(-decl.elemConstVal(i));
	    Exp * eqConstraint = new Exp();
	    eqConstraint->setEquality();
            eqConstraint->addTerm(tupleTerm);
            eqConstraint->addTerm(constTerm);
	    newConstraints.push_back(eqConstraint);
	}
    }

    // Change the conjunction at this point to the
    // new conjunction.
    if (requireChange){
        Conjunction* conj = new Conjunction(decl);
        conj->setInArity(c->inarity());
	for(auto it = newConstraints.begin();
		it!=newConstraints.end(); it++){
	    conj->addEquality(*it);
	}
        for (auto it = c->equalities().begin();
		it!=c->equalities().end(); it++){
	    conj->addEquality((*it)->clone());
	}

        for (auto it = c->inequalities().begin();
		it!=c->inequalities().end(); it++){
	    conj->addInequality((*it)->clone());
	}
	if(c->isUnsat()){
            conj->setUnsat();
	}
        // Copy contents of new conjunction to current
	// conjunction being visited.
	*c = *conj;
	delete conj;
    }
    currentTupleDecl = decl;
    currentConjunction = c;
    // Initilize all tuple variable to zero
    for (unsigned int i = 0; i < decl.size(); i++ ){
       tupleAssignments[i] = "0";
    }
}

void VisitorChangeUFsForOmega::preVisitExp(iegenlib::Exp * e){
    if(e->isEquality() && !e->hasUFCall()){
	std::list<Term*> terms = e->getTermList();
	// Count number of tuple variable terms in expression,
	// multiple tuple term in an expression is not considered
	// as a candidate for tuple initialization.
	TupleVarTerm* tupTerm = NULL;
	int tv_count = std::count_if(terms.begin(), terms.end(),
	    [&tupTerm](Term* t){
	        TupleVarTerm* tCopy = dynamic_cast<TupleVarTerm*>(t);
		if(tCopy==NULL) return false;
		else{
		   tupTerm = tCopy;
		   return true;
		}
	    });
	if (tv_count != 1){
	    return;
	}

	if (tupTerm == NULL)
	    return;

        Term* tClone = tupTerm->clone();
        tClone->setCoefficient(1);
	Exp* solveFor = e->solveForFactor(tClone);
	std::string solvedForString = solveFor->toString();
	tupleAssignments[tupTerm->tvloc()] =  solvedForString;
    }

}



void VisitorChangeUFsForOmega::postVisitSet(iegenlib::Set* s){
    s->mArity = currentTupleDecl.size();
}

void VisitorChangeUFsForOmega::preVisitRelation(iegenlib::Relation*){
    //throw assert_exception("VisitorChangeUFsForOmega: cannot be applied to "		    "a relation");
}

void VisitorChangeUFsForOmega::postVisitUFCallTerm(UFCallTerm* callTerm) {
    if (currentTupleDecl == NULL) {
        throw assert_exception(
            "No TupleDecl collected -- is this Visitor (incorrectly) being run "
            "on something other than a Set/Relation?");
    }

    //A check for inifinite nesting.. do not modify ufs 
    //that have already been made omega compliant
    auto itCall = ufMap.find(callTerm->name());
    // If call term is already been made ommega compliant
    // dont go any further.
    if (itCall != ufMap.end()) { return;}
    // determine which tuple variables are needed in the call (how large of a
    // prefix)
    int max_tvloc = -1;
    for (unsigned int i = 0; i < callTerm->numArgs(); ++i) {
        // loop through all terms, processing as needed
        for (const auto& term : callTerm->getParamExp(i)->getTermList()) {
            if (term->type() == "TupleVarTerm") {
                TupleVarTerm* termAsTupleVar = static_cast<TupleVarTerm*>(term);
                max_tvloc = std::max(termAsTupleVar->tvloc(), max_tvloc);
            } else if (term->type() == "TupleExpTerm") {
                throw assert_exception("TupleExpTerm unsupported");
            }
        }
    }
    // ensure presence of at least one tuple var (UF calls cannot be
    // constant-only)
    if (max_tvloc == -1) {
        throw assert_exception(
            "Cannot make UF calls with only constant arguments");
    }

    // save original coefficient, then temporarily modify for printing
    int originalCoefficient = callTerm->coefficient();
    callTerm->setCoefficient(1);
   
   
    // Original UFCall's to string will be used to 
    // uniquely identify a UFCallTerm. This is because
    // 2 uf calls can have the same name but different 
    // expressions inside of it. A good example is 
    // rowptr(i) and rowptr(i+1).

    std::string originalUFString = callTerm->toString();
    std::string originalCall = callTerm->toString();
    
    
    UFCallTerm* originalTerm =(UFCallTerm*) callTerm->clone(); 
    auto itArr = std::find(arrayAccessUFs.begin(),
		    arrayAccessUFs.end(),originalCall);
    
    // Check if UF Call is a replacement.
    auto itReplace= std::find_if(knownUFs.begin(),
		    knownUFs.end(), [originalCall](
			    std::pair<std::string,std::string> e){
		        return originalCall == e.second;   
		    });
    
    if (itArr == arrayAccessUFs.end() && itReplace == knownUFs.end()){
        // Create a ufMacro uf Array access
        std::string ufMacro = callTerm->name();
        std::string ufArrayAccess = callTerm->name();
        ufMacro+= "(";
        bool isFirst = true;
        for (int i = 0; i < callTerm->numArgs(); i++){

	    if(isFirst){
                ufMacro+= "t"+ std::to_string(i);
                isFirst = false;
	    }else{
	        ufMacro += ",t"+std::to_string(i);
	    }
            ufArrayAccess+="[t"+std::to_string(i)+"]";
        }
        ufMacro+=")";
        // Map ufs as macros to actual array aaccess.
        macros[ufMacro] = ufArrayAccess;
	arrayAccessUFs.push_back(originalCall);
    }
    
    // rewrite argument list as a prefix of input tuple
    callTerm->resetNumArgs(max_tvloc + 1);
    for (int i = 0; i < callTerm->numArgs(); ++i) {
        Exp* newParamExp = new Exp();
        TupleVarTerm* tupleVarParam = new TupleVarTerm(i);
        newParamExp->addTerm(tupleVarParam);
        callTerm->setParamExp(i, newParamExp);
    }
    


    std::string replacementName;
    auto it = knownUFs.find(originalUFString);
    // check if this particular UF invocation has already been encountered
    if (it != knownUFs.end()) {
        // use the function name from the already-existing definition
        replacementName = it->second;
        callTerm->setName(replacementName);
	// We dont need the clone we created at this point.
	delete originalTerm;
    } else {
        // assign a new name to this function and add it to our list
        replacementName =
            callTerm->name() + "_" + std::to_string(nextFuncReplacementNumber);
        nextFuncReplacementNumber++;
        knownUFs.emplace(originalUFString, replacementName);

        callTerm->setName(replacementName);
        // this is a new UF, so add a macro definition for it
        macros.emplace(callTerm->toString(), originalCall);

	ufMap.emplace(replacementName,originalTerm);
    }
    // add UF call to the list of declarations
    ufCallDecls.emplace(callTerm->name() + "(" 
		    + std::to_string(max_tvloc + 1) +
                        ")");

    // restore coefficient, which was changed temporarily for printing
    callTerm->setCoefficient(originalCoefficient);
}

void VisitorChangeOmegaUF::postVisitUFCallTerm(UFCallTerm* callTerm) {
    auto it = ufMap.find(callTerm->name());
    if (it != ufMap.end()){
        // Perform a copy to change the callTerm
        *callTerm = (*it->second);
    }
}

void FlattenUFNestingVisitor::postVisitConjunction(Conjunction* c){
    if(flatUfTupleMap.size()!= 0){
        
	for(int i = 0; i <  flatUfTupleMap.size() ; ++i){
	    //int tupleIndex = i + currentTupleDecl.size();
	    Exp * e = new Exp();
	    e->setEquality();
	    e->addTerm(flatUfTupleMap[i].first);
	    e->addTerm(new TupleVarTerm(-1,flatUfTupleMap[i].second));
	    // Visit expression to make expression 
	    // omega compliant beffore adding
	    // to conjunction
	    c->addEquality(e);
	}
	flatUfTupleMap.clear();
	// Recursively revisit the conjunction 
        // due to the addition of a new expression.
	c->acceptVisitor(this);

    } 
}

void FlattenUFNestingVisitor::preVisitConjunction(Conjunction* c){
    currentTupleDecl = c->getTupleDecl();
    currentConjunction = c;
}

void FlattenUFNestingVisitor::preVisitUFCallTerm(UFCallTerm* callTerm){
    
    if (currentTupleDecl == NULL) {
        throw assert_exception(
            "No TupleDecl collected -- is this Visitor (incorrectly) being run "
            "on something other than a Set/Relation?");
    }
   
    // Check for uf calls in param expression and 
    // replace with tuple variables.
    for (unsigned int i = 0; i < callTerm->numArgs(); ++i) {
        SubMap map;
	// loop through all terms, processing as needed
        for (const auto& term : callTerm->getParamExp(i)->getTermList()) {
            if (term->isUFCall()) {
		// If term is a ufcall, then replace occurence 
		// of such ufcall with a tuple variable.
                UFCallTerm * cTerm = dynamic_cast<UFCallTerm*>(term);
	        int coeff = cTerm->coefficient(); 	
		cTerm->setCoefficient(1);
		auto it = std::find_if(flatUfTupleMap.begin(),
				flatUfTupleMap.end(),
		     [cTerm](const std::pair<UFCallTerm*,int>& ct){
		         return *(ct.first) == *cTerm;
		     });
                TupleVarTerm* tupReplacement = NULL;
	        if (it != flatUfTupleMap.end()){
	            // call Term already has a tuple variable
	            int tupleVarIndex = it - flatUfTupleMap.end();
		    tupReplacement = new TupleVarTerm(coeff,it->second);
	        }else{
		    // Tuple index has to be placed just after 
		    // the maximum tv location in this
		    // expression, and the rest 
		    // of the tuple variables have to be remaped 
		    int maxDependence = 0;
		    for(int j =0;j < currentTupleDecl.size(); j++){
		       TupleVarTerm tv(1,j);
		       if (callTerm->getParamExp(i)->dependsOn(tv)){
		           maxDependence = std::max(maxDependence,j);
		       } 
		    }
		    int tupleVarLocation = maxDependence+1;
		    // Expand current tuple declaration
		    TupleDecl newTupleDecl(currentTupleDecl.size() + 1);
                    for(int i = 0 ; i < newTupleDecl.size(); i++){
                        if (i < currentTupleDecl.size()){
                            newTupleDecl.copyTupleElem(currentTupleDecl,i,i);
	                }else {
	                    newTupleDecl.setTupleElem(i,"_x"+std::to_string(i));
	                }
	            }
	            currentConjunction->setTupleDecl(newTupleDecl);
		   
		    int tupleVarLocTemp = tupleVarLocation;
	            // Check if there is already a tuplevariable
	            // on this location and put the new tupleIndex
	            // just after. 
	            for(auto& flatUfTuple : flatUfTupleMap){
		        if (flatUfTuple.second == tupleVarLocTemp){
		                tupleVarLocation++;
			}
		    }
		    // If new tuple location is not at the 
		    // last tuple location of the new tuple Decl
		    if (tupleVarLocation != newTupleDecl.size()-1){
                        // Shift tuple declaration
		        std::vector<int> shiftTupVars(currentTupleDecl.size());
                        for (int j = 0; j<currentTupleDecl.size(); j++) {
                             if(j >= tupleVarLocation)
			        shiftTupVars[j] = j + 1;
			     else
			        shiftTupVars[j] = j;
                        }
                        currentConjunction->remapTupleVars(shiftTupVars);

		    }
	            
		    
		    currentTupleDecl = currentConjunction->getTupleDecl();
		    auto cTermClone = dynamic_cast
			    <UFCallTerm*>(cTerm->clone());
		    cTermClone->setCoefficient(1);
	            tupReplacement = new TupleVarTerm(coeff,
				    tupleVarLocation);
		    flatUfTupleMap.push_back({cTermClone,tupleVarLocation});
	        }
		Exp* e = new Exp();
		e->addTerm(tupReplacement);
		// Replace uf term with tuple variable term
		map.insertPair(term->clone(),e);
            } 
	}
	// substitute all occurence of uf call term 
	// with tuple variable.
	callTerm->getParamExp(i)->substitute(map);
    }
}
void FlattenUFNestingVisitor::reset(){
    currentTupleDecl = NULL;
    currentConjunction = NULL;
    flatUfTupleMap.clear();
}
}//namespace igenlib end
