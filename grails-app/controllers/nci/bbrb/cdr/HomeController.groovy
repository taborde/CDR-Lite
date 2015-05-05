package nci.bbrb.cdr
import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.util.*

class HomeController {

    def choosehome = {
               
        return []
    }
    
     def homedispatcher = {

        if(session.serviceAccount == true){
            println "session service account is true"
            redirect(controller:"login", action:"notauth")
            return //needed for Grails 2
        } 
              
        else if(!session.chosenHome || session.serviceAccount != true){
                //redirect(action: "home", params: params)     
                 //println "pmh test session service account is false"
                redirect(action: "choosehome", params: params)                
            }
        }
        
    
    
    def diseaseHome = { 
        
        def blockedStudyList = cdrLiteStudyAccessCheck()
        
        if('DISEASE' in blockedStudyList){

            redirect(controller:"login", action:"denied")
        }
        
        else{

            params.max = Math.min(params.max ? params.int('max') : 25, 100)
        def caseList = CaseRecord.findAllByCaseId('disease123')
       return [caseRecordInstanceList:caseList ]
      }
    }   
    
    def cdrLiteStudyAccessCheck() {

        def username = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
        
        def blockedStudyList = []
        
        def normalDenyList = AppSetting.findByCode('CDRLITE_USER_DENY_NORMAL')?.bigValue?.split(',')
        def disDenyList = AppSetting.findByCode('CDRLITE_USER_DENY_DISEASE')?.bigValue?.split(',')
        def plasDenyList = AppSetting.findByCode('CDRLITE_USER_DENY_PLASMA')?.bigValue?.split(',')

        if(username in normalDenyList){
            blockedStudyList.add('NORMAL')
        }
        if(username in disDenyList){
            blockedStudyList.add('DISEASE')
        }
        if(username in plasDenyList){
            blockedStudyList.add('PLASMA')
        }
            
        return blockedStudyList        
    }
    
}
