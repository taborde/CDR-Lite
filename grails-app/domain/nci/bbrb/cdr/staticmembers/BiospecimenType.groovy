package nci.bbrb.cdr.staticmembers

class BiospecimenType extends StaticMemberBaseClass{
    
     def static searchable ={
         only= ['name', 'code']
        'name' name:'biospecimenTypeName'
        'code' name:'biospecimenTypeCode'
         root false
     }
    
      static mapping = {
      table 'st_biospecimen_type'
      id generator:'identity', params:[sequence:'st_biospecimen_type_pk']
    }

}