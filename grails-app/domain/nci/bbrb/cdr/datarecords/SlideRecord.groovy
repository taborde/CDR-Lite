package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.prc.*

class SlideRecord extends DataRecordBaseClass{
    SpecimenRecord specimenRecord
    String slideId
    
    static hasMany = [processEvents:ProcessingEvent]
    static hasOne = [imageRecord:ImageRecord, prcReview:PrcReview]

    String toString(){"$slideId"}
    
    static constraints = {
        imageRecord(blank:true,nullable:true)
        prcReview(blank:true,nullable:true)
    }
    
    static mapping = {
        table 'dr_slide'
        id generator:'sequence', params:[sequence:'dr_slide_pk']
    }
}
