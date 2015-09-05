package nci.bbrb.cdr.datarecords

class SlideRecord extends DataRecordBaseClass{
    SpecimenRecord specimenRecord
    String slideId
    
    static hasMany = [processEvents:ProcessingEvent]

    String toString(){"$slideId"}
    
    static constraints = {
    }
    
    static mapping = {
        table 'dr_slide'
        id generator:'sequence', params:[sequence:'dr_slide_pk']
    }
}
