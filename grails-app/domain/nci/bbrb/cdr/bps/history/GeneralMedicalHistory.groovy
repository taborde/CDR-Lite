package nci.bbrb.cdr.bps.history
import nci.bbrb.cdr.CDRBaseClass
//import nci.bbrb.cdr.datarecords.vocab.*
import nci.bbrb.cdr.datarecords.CandidateRecord

class GeneralMedicalHistory extends CDRBaseClass{
    String  diseaseName
    
    Date monthYearOfFirstDiagnosis
   
    String treatments
    Date monthYearOfLastTreatment
    String source   // Medical Record, Self-Report, Family Report
   CandidateRecord candidateRecord
    Date dateSubmitted
    String submittedBy
    
    static mapping = {
        table 'general_medical_history'
        id generator:'sequence', params:[sequence:'general_medical_history_pk' ]
    }
    
    
    static constraints = {
        diseaseName(nullable:true, blank:true)
        monthYearOfFirstDiagnosis(nullable:true, blank:true)
        monthYearOfLastTreatment(nullable:true, blank:true)
        treatments(nullable:true, blank:true)
        source(nullable:true, blank:true)
       candidateRecord(nullable:true, blank:true)
        dateSubmitted(blank:true,nullable:true)
         submittedBy(blank:true,nullable:true)
    }
    
    
    
}

