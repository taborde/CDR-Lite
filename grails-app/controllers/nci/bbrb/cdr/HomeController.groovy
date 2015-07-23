package nci.bbrb.cdr
import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.util.*
import nci.bbrb.cdr.study.*

/* created by: pmh 05/12/15*/


class HomeController {

 String maxView ='10'
    
     def choosehome = {
       // session.study = null 
       // session.chosenHome = null 
       // def blockedStudyList = nihUserStudyAccessCheck()
        def blockedStudyList=[]
        return [blockedStudyList:blockedStudyList]
      // render "choose home page"
    }
    
    def homedispatcher = {

        if(session.serviceAccount == true){
            redirect(controller:"login", action:"notauth")
            return //needed for Grails 2
        } 
              
        else if(!session.chosenHome || session.serviceAccount != true){
            //redirect(action: "studyHome", params: params) 
            redirect(action: "choosehome", params: params)
        }
    }
   
    def projecthome={
        def candidateList = CandidateRecord.findAllByStudy(Study.findByCode('BPVLIKE'), [max:maxView])
        println("size: " + candidateList.size())
  
       // def caseList = CaseRecord.findAllByStudy(Study.findByCode('BPVLIKE'), [max:maxView])
       
        def caseList = CaseRecord.executeQuery("from CaseRecord c where c.candidateRecord.study.code= 'BPVLIKE'", [max:maxView])
        return [caseRecordInstanceList:caseList, candidateRecordInstanceList:candidateList]
    }
}
