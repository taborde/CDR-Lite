package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers.*

class CandidateRecord extends DataRecordBaseClass{
    
    String candidateId
    BSS bss 
    Study study
    boolean isConsented = false
    boolean isEligible = false
    
    static hasMany = [caseList:CaseRecord]

    static constraints = {
        
    }
    
    
      static mapping = {
      table 'dr_candidate'
      id generator:'sequence', params:[sequence:'dr_candidate_pk']
      
      sort dateCreated:"desc"  
        
    }
   
    
    
      static searchable = {
         only=['candidateId', 'id', 'dateCreated']
          'dateCreated'  name:'candidateDateCreated', format: "yyyy-MM-dd HH:mm"
         root false
       
    }
}
