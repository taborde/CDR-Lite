package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers.*

class CaseRecord extends DataRecordBaseClass {
    
    String caseId 
    CandidateRecord candidateRecord
    CaseStatus caseStatus
    CaseCollectionType caseCollectionType
    TissueType primaryTissueType
    BSS bss
    Study study
    
   
    
    static hasMany = [specimens:SpecimenRecord]
    
    static constraints = {
        caseId(unique:true, blank:false, nullable:false)
    }
    
    
    static mapping = {
        table 'dr_case'
        id generator:'sequence', params:[sequence:'dr_case_pk']
       
        sort dateCreated:"desc"  
    }
}
