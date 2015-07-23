package nci.bbrb.cdr.staticmembers

class CaseCollectionType extends StaticMemberBaseClass{

    static constraints = {
    }
    
    
     static mapping = {
      table 'st_case_collection_type'
      id generator:'sequence', params:[sequence:'st_case_collection_type_pk']
    }
}
