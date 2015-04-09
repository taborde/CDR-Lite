package nci.bbrb.cdr.staticmembers

class CollectionType extends StaticMemberBaseClass{
    
     def static searchable ={
         only= ['name', 'code']
        'name' name:'collectionTypeName'
        'code' name:'collectionTypeCode'
         root false
     }
    
      static mapping = {
      table 'st_collection_type'
      id generator:'identity', params:[sequence:'st_collection_type_pk']
    }

}