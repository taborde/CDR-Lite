package nci.bbrb.cdr.staticmembers

class Study  extends StaticMemberBaseClass{
    
    Date dateIRBApproved
    Date dateIRBExpires
    
    static mapping = {
      table 'st_study'
      id generator:'sequence', params:[sequence:'st_study_pk']
    }
    
     static searchable ={
        only= ['name', 'code']
        'name' name:'studyType'
        'code' name:'studyTypeCode'
        root false
    }

    static constraints = {
        dateIRBApproved(blank:true, nullable:true)
        dateIRBExpires(blank:true, nullable:true)
    }
}
