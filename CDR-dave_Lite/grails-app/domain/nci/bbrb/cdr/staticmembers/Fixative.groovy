package nci.bbrb.cdr.staticmembers

class Fixative extends StaticMemberBaseClass{
    
      static constraints = {
      }
    
     static mapping = {
      table 'st_fixative'
      id generator:'identity', params:[sequence:'Fixative_pk']
    }

}
