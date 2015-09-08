package nci.bbrb.cdr.prc

import nci.bbrb.cdr.datarecords.*

class PrcReport extends DataRecordBaseClass{
    CaseRecord caseRecord
    String comments
    Date dateSubmitted
    String submittedBy
    String status

     static mapping = {
      table 'prc_report'
      id generator:'sequence', params:[sequence:'prc_report_pk']
    }
    
    static constraints = {
        caseRecord(unique:true, nullable:false, blank:false)
        comments(blank:true,nullable:true)
        dateSubmitted(blank:true,nullable:true)
        submittedBy(blank:true,nullable:true)
        status(blank:true,nullable:true)
    }
}
