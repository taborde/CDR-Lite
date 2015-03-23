package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers

class SpecimenRecord extends DataRecordBaseClass{
    
    CaseRecord caseRecord
    SpecimenRecord parentSpecimen
    String specimenId
    Fixative fixative
    ContainerType containerType

    static constraints = {
    }
}
