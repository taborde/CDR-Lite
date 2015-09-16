package nci.bbrb.cdr.staticmembers

class TissueType extends StaticMemberBaseClass{
 
    static hasMany = [tissueLocations:TissueLocation]
    
    static mapping = {
        table 'st_tissue_type'
        id generator:'sequence', params:[sequence:'st_tissue_type_pk']
    }
    
    static searchable ={
        only= ['name', 'code']
        'name' name:'tissueName'
        'code' name:'tissueCode'
        root false
    }
    
}