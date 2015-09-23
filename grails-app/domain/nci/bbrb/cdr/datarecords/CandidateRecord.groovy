package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.bps.history.*

class CandidateRecord extends DataRecordBaseClass{
    
    String candidateId
    BSS bss 
    Study study
    boolean isConsented = false
    boolean isEligible = false
    String comments
    
    static hasMany = [caseList:CaseRecord]
    static hasOne = [healthHistory:HealthHistory]
    
    static constraints = {
        comments(nullable:true,blank:true, maxSize:4000)
        healthHistory(nullable:true,blank:true)
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
