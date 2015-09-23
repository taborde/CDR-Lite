package nci.bbrb.cdr.bps.history

import nci.bbrb.cdr.CDRBaseClass
import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.datarecords.CandidateRecord

class MedicationHistory extends CDRBaseClass{

    String medicationName
    Date dateofLastAdministration
    String source
    CandidateRecord candidateRecord
    
    Date dateSubmitted
    String submittedBy
    
    static mapping = {
        table 'med_history'
        id generator:'sequence', params:[sequence:'med_history_pk' ]
    }
    
    
    static constraints = {
        medicationName(nullable:true, blank:true)
        dateofLastAdministration(nullable:true, blank:true)
        source(nullable:true, blank:true)
        candidateRecord(nullable:true, blank:true)
         dateSubmitted(blank:true,nullable:true)
         submittedBy(blank:true,nullable:true)
    }
    
    
    
}
