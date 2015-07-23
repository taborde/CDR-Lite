package nci.bbrb.cdr.datarecords

abstract class DataRecordBaseClass {

    
    Date dateCreated
    Date lastUpdated
    
    static auditable = true

    
    static constraints = {
        
    }
}