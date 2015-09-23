package nci.bbrb.cdr.bps.history
import nci.bbrb.cdr.CDRBaseClass
//import nci.bbrb.cdr.datarecords.vocab.*
import nci.bbrb.cdr.datarecords.CandidateRecord


class CancerHistory extends CDRBaseClass{
    String  primaryTumorSite
    
    
    Date monthYearOfFirstDiagnosis
    String treatments
    Date monthYearOfLastTreatment
    String source   // Medical Record, Self-Report, Family Report
    CandidateRecord candidateRecord
    Date dateSubmitted
    String submittedBy
   
    
    //boolean treatmentSurgery=false
    // boolean treatmentRadiation=false
    // boolean treatmentChemotherapy=false
    // boolean treatmentOther=false
    // boolean  treatmentNo =false
    // boolean treatmentUnknown=false
    
    // String otherTreatment
    
        
    static mapping = {
        table 'cancer_history'
        id generator:'sequence', params:[sequence:'cancer_history_pk' ]
    }
    
    
    static constraints = {
        primaryTumorSite(nullable:true, blank:true)
        monthYearOfFirstDiagnosis(nullable:true, blank:true)
        treatments(nullable:true, blank:true)
        monthYearOfLastTreatment(nullable:true, blank:true)
        source(nullable:true, blank:true)
        candidateRecord(nullable:true, blank:true)
        dateSubmitted(blank:true,nullable:true)
        submittedBy(blank:true,nullable:true)
    }
    
    
   
}
