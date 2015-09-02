package nci.bbrb.cdr
import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.util.*
import nci.bbrb.cdr.study.*

/* created by: pmh 05/12/15*/


class HomeController {

 String maxView ='10'
    
     def choosehome = {
        
     
    }
    
    def homedispatcher = {      
     
         if(session.chosenHome=="projecthome"){
            
              redirect(action: "projecthome")
         
        }else {
            redirect(action: "choosehome")
        }
    }
   
    def projecthome={
        session.chosenHome="projecthome"
        def candidateList = CandidateRecord.findAllByStudy(Study.findByCode('BPVLIKE'), [max:maxView])
  
       // def caseList = CaseRecord.findAllByStudy(Study.findByCode('BPVLIKE'), [max:maxView])
       
        def caseList = CaseRecord.executeQuery("from CaseRecord c where c.candidateRecord.study.code= 'BPVLIKE'", [max:maxView])
        
        def specimenCount=[:]
        if(caseList){
             def count_result = SpecimenRecord.executeQuery("select c.id, count(*) from SpecimenRecord s inner join s.caseRecord c where c in (:list) group by c.id",  [list: caseList])
            count_result.each(){
                specimenCount.put(it[0], it[1])
             
            }
        }
        
        return [caseRecordInstanceList:caseList, candidateRecordInstanceList:candidateList, specimenCount:specimenCount]
    }
    
    
    def generic={
       def  title = "Activity Center"
        def    bodyclass = "recentactivity"
         def   navigation = "/cdrlite;home;Home"
         def   divs = "recentactivity"
         def   h1studysession = true
         return[title:title,bodyclass:bodyclass,navigation:navigation,divs:divs,h1studysession:h1studysession]
    }
    
    def opshome = {
        
        session.setAttribute("chosenHome", new String("OPS"))
        
    }
}
