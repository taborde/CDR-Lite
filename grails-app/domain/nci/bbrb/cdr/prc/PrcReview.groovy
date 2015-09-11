package nci.bbrb.cdr.prc

import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.staticmembers.*


class PrcReview extends DataRecordBaseClass {
    
    SlideRecord slideRecord
    String autolysis
    String comments
    PrcAcceptability acceptability
    TissueCategory tissueCategory
    Integer numPieces
    String confirmTissueType
    String issueDesc
    String issueStatus
    
    static mapping = {
      table 'prc_review'
      id generator:'sequence', params:[sequence:'prc_review_pk']
    }
    

    static constraints = {
         autolysis(blank:true,nullable:true)
         comments(blank:true,nullable:true)
         acceptability(blank:true,nullable:true)
         tissueCategory(blank:true,nullable:true)
         numPieces(blank:true,nullable:true)
         confirmTissueType(blank:true,nullable:true)
         issueDesc(blank:true,nullable:true)
         issueStatus(blank:true,nullable:true)
    }
}
