package nci.bbrb.cdr.bps.history
import nci.bbrb.cdr.CDRBaseClass
import nci.bbrb.cdr.datarecords.CandidateRecord


class HealthHistory extends CDRBaseClass  {
    String source // Medical Record, Self-Report, Family Report
    String  historyOfCancer // Y/N
    // YesNo histOtherDisease
    CandidateRecord candidateRecord
    // static hasMany = [cancerHistories:CancerHistory, generalMedicalHistories:GeneralMedicalHistory,medicationHistory:MedicationHistory]
  
    Date dateSubmitted
    String submittedBy
    
    static mapping = {
        table 'health_history'
        id generator:'sequence', params:[sequence:'health_history_pk']
    }
    static constraints = {
        candidateRecord(nullable:true, blank:true)
        source(nullable:true, blank:true)
        historyOfCancer(nullable:true, blank:true)
        dateSubmitted(blank:true,nullable:true)
        submittedBy(blank:true,nullable:true)
      
    }
    
     
    
     
}
