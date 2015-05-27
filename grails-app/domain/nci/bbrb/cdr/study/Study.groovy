package nci.bbrb.cdr.study

import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.datarecords.*

class Study {
    
    //String studyId
    CaseRecord caseRecord
    StudyType studyType  // disease or normal? 
    BiospecimenType biospecimenType
    Date dateCreated
    String createdBy
    String name
    String description
   
   static belongsTo = CaseRecord
    static constraints = {
        caseRecord(blank:true, nullable:true) // create a study and later link to a case maybe?
        studyType(blank:true, nullable:true)
        biospecimenType(blank:true, nullable:true)
        dateCreated(blank:true, nullable:true)
        createdBy(blank:true, nullable:true)
        name(blank:true, nullable:true)
        description(blank:true, nullable:true)
    }
    
     static mapping = {
      table 'study'
      id generator:'sequence', params:[sequence:'cdr_lite_study_pk']
    }
}
