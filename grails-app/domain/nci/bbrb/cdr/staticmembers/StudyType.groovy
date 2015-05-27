package nci.bbrb.cdr.staticmembers

class StudyType extends StaticMemberBaseClass{
    static mapping = {
      table 'st_study_type'
      id generator:'identity', params:[sequence:'st_study_type_pk']
    }
    
     static searchable ={
        only= ['name', 'code']
        'name' name:'studyType'
        'code' name:'studyTypeCode'
        root false
    }
}