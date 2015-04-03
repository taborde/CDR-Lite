package nci.bbrb.cdr

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
                 println "session service account is false"
                redirect(action: "choosehome", params: params)                
            }
        }
    
}
