package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers.*

class CandidateRecord extends DataRecordBaseClass{
    
    String candidateId
    CaseRecord caseRecord
    BSS bss 
    Study study
    CollectionType collectionType
    boolean isConsented = false
    boolean isEligible = false

    static constraints = {
    }
}
