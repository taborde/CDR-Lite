package nci.bbrb.cdr
import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.util.*
import nci.bbrb.cdr.study.*

/* created by: pmh 05/12/15*/


class HomeController {

    def studyHome = {
         def  studyInstanceList = Study.findAll()     
        return [studyInstanceList:studyInstanceList]
    }
    
    def homedispatcher = {

        if(session.serviceAccount == true){
            redirect(controller:"login", action:"notauth")
            return //needed for Grails 2
        } 
              
        else if(!session.chosenHome || session.serviceAccount != true){
            redirect(action: "studyHome", params: params)                
        }
    }
   
    
}
