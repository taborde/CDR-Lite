package nci.bbrb.cdr.datarecords

import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.study.Study

class CandidateRecord extends DataRecordBaseClass{
    
    String candidateId
    CaseRecord caseRecord
    BSS bss 
    Study study
    BiospecimenType biospecimenType
    boolean isConsented = false
    boolean isEligible = false

    static constraints = {
    }
}
