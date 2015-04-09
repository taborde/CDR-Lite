package nci.bbrb.cdr.staticmembers

class TissueLocation extends StaticMemberBaseClass{
    
      static mapping = {
      table 'st_tissue_loc'
      id generator:'identity', params:[sequence:'st_tissue_loc_pk']
    }
    
    static constraints = {
    }
}