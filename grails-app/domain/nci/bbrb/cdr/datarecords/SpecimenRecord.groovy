package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers.*

class SpecimenRecord extends DataRecordBaseClass{
    
    CaseRecord caseRecord
    SpecimenRecord parentSpecimen
    String specimenId
    Fixative fixative
    ContainerType containerType
    TissueType tissueType
    TissueLocation tissueLocation
    
    
    static mapping = {

        table 'dr_specimen'
        id generator:'sequence', params:[sequence:'dr_specimen_pk']
        //tissueLocations column:'dr_specimen_st_acquis_loc'
        
   
    }    

    static constraints = {
    }
}
