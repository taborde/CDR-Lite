package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers.*

class CaseRecord extends DataRecordBaseClass {
    
    String caseId 
    CandidateRecord candidateRecord
    CaseStatus caseStatus
    CollectionType collectionType
    BSS bss
    String tissueBankId
    
    static belongsTo = [CandidateRecord]
    
    static hasMany = [specimens:SpecimenRecord]
    
    static constraints = {
    }
}
