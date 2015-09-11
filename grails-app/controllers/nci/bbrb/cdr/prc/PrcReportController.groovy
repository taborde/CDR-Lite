package nci.bbrb.cdr.prc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrcReportController {

    def prcReportService
    
    static allowedMethods = [ update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PrcReport.list(params), model:[prcReportInstanceCount: PrcReport.count()]
    }

    def show(PrcReport prcReportInstance) {
        respond prcReportInstance
    }

    def create() {
        respond new PrcReport(params)
    }

    def save ={
        println("here????")
        def prcReportInstance = new PrcReport(params)
        
        if (prcReportInstance == null) {
            println("null")
            notFound()
            return
        }

        if (prcReportInstance.hasErrors()) {
            println("has error")
            respond prcReportInstance.errors, view:'create'
            return
        }

        
         try{
            
           println("before call service")
            prcReportService.createReport(prcReportInstance)
             
            
             
          
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'caseReportForm.label', default: 'PRC Report For'), prcReportInstance?.caseRecord?.caseId])}"
         
            redirect(action: "edit", id:prcReportInstance.id)
        }catch(Exception e){
            flash.message="Failed: " + e.toString()  
        
            redirect(action:"edit", params:[id:prcReportInstance.id])
         
        }
        
        
      /**  prcReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prcReport.label', default: 'PrcReport'), prcReportInstance.id])
                redirect prcReportInstance
            }
            '*' { respond prcReportInstance, [status: CREATED] }
        }**/
    }

    def edit(PrcReport prcReportInstance) {
        
     
        
          def prcReviewList
        def prcIssueList
        def prcReportSubList
        def specimenList
        def errorMap=[:]
        def canSub=false
        
        
        try{
            
          
            prcReviewList=prcReportService.getPrcReviewList4Edit(prcReportInstance)
            
          
          
             
            if(isStarted(prcReportInstance, prcReviewList)){
               
                def result= checkError(prcReportInstance, prcReviewList)
                
                if(result){
                    result.each(){key,value->
                  
                        prcReportInstance.errors.reject(value, value)
                        errorMap.put(key, "errors")
                    }
                }else{
                    
                    canSub=true
                }
              
            }
            
           
            
            return [prcReportInstance: prcReportInstance, prcReviewList:prcReviewList,  errorMap:errorMap, canSub:canSub ]
        }catch(Exception e){
            flash.message="Failed: " + e.toString()  
         
           return [prcReportInstance: prcReportInstance, prcReviewList:prcReviewList,  errorMap:errorMap, canSub:canSub ]
            
        }
        
        
       
    }
    
    
    
    

    @Transactional
    def update(PrcReport prcReportInstance) {
        
    
        
        if (prcReportInstance == null) {
            notFound()
            return
        }

        if (prcReportInstance.hasErrors()) {
            respond prcReportInstance.errors, view:'edit'
            return
        }

      
        
        
          
         prcReportService.saveReport(prcReportInstance, params, request)
            
         redirect(action:"edit", params:[id:prcReportInstance.id])
           
            
    }

    @Transactional
    def delete(PrcReport prcReportInstance) {

        if (prcReportInstance == null) {
            notFound()
            return
        }

        prcReportInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PrcReport.label', default: 'PrcReport'), prcReportInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prcReport.label', default: 'PrcReport'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    
     static boolean isStarted(prcReportInstance, prcReviewList){
        def result=false
        if(prcReportInstance.version > 0)
        return true;
          
        prcReviewList.each() {
            if(it.version > 0){
                result=true
            }
               
        }
       
         
      
           
        return result
        
    }
    static Map checkError(prcReportInstance, prcReviewList){
        def studyCode = prcReportInstance.caseRecord.study.code
        def result = [:]
        def releaseMap=[:]
       
        prcReviewList.each() {
            def specimenId =it.slideRecord.specimenRecord.specimenId
            println("specimenId: " + specimenId)
            def autolysis = it.autolysis
            def fixativeCode= it.slideRecord.specimenRecord.fixative.code
            /**if(studyCode=='GTEX' || (studyCode=='BMS' && fixativeCode=='XG')){
                if(!autolysis){
                    result.put("${it.id}_autolysis".trim(), "The Autolysis for specimen ${specimenId} is a required field.")
                }
            }**/
             
          
          /**  def inventoryStatus=it.inventoryStatus
            if(inventoryStatus?.name=='Unacceptable'){
                def reasons = it.unaccReasons
                boolean selected = false
                reasons.each(){it2->
                    if(it2.selected){
                        selected = true
                    }
                    
                }
                if(!selected)
                  result.put("${it.id}_inventoryStatus".trim(), "Please specify at least one unacceptable reason for specimen ${specimenId}.")
            }**/
            
            
            def comments=it.comments
            if(!comments){
                result.put("${it.id}_comments".trim(), "The comments for specimen ${specimenId} is a required field.")
            }
            
        }
        
      
        println("before return")
        return result
    }

    
    def submit = {
        def prcReportInstance = PrcReport.get(params.id)
        def prcReviewList
        
        def errorMap=[:]
        def canSub=false
      
        try{
            prcReviewList=prcReportService.getPrcReviewList(prcReportInstance)
           
      
            def result= checkError(prcReportInstance, prcReviewList)
            if(result){
                result.each(){key,value->
                    
                    prcReportInstance.errors.reject(value, value)
                    errorMap.put(key, "errors")
                }//each
                flash.message="failed to submit"
                     
                   
                render(view: "edit", model: [prcReportInstance: prcReportInstance, prcReviewList:prcReviewList,  errorMap:errorMap, canSub:canSub ] )
  
            }else{
                //prcReportService.submitReport(prcReportInstance)
                def username= session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
                
                prcReportService.submitReport(prcReportInstance, username)
                 
               
                render(view: "view", model: [prcReportInstance: prcReportInstance, prcReviewList:prcReviewList] )
                
            }
              
        }catch(Exception e){
            flash.message="Failed: " + e.toString()  
            // redirect(action:"edit", params:[id:prcReportInstance.id])        
            def studyCode = prcReportInstance.caseRecord.study.code
            if(studyCode =='GTEX')
            redirect(action:"edit", params:[id:prcReportInstance.id])
            else
            redirect(action:"editBms", params:[id:prcReportInstance.id])
            
        }
        
    }
    
    
     def view = {
       
        def prcReportInstance = PrcReport.get(params.id)
        
       
        
      
        def prcReviewList=prcReportService.getPrcReviewList(prcReportInstance)
      
      
        
        return [prcReportInstance: prcReportInstance, prcReviewList:prcReviewList]
       
        
        
    }
    
     def startnew ={
        
        def prcReportInstance = PrcReport.get(params.id)
        
             
        try{
           
            prcReportService.startNew(prcReportInstance)
          
            
          
            redirect(action:"edit", params:[id:prcReportInstance.id])
           
            // redirect(action:"edit", params:[id:prcReportInstance.id])
        }catch(Exception e){
            flash.message="Failed: " + e.toString() 
           
            redirect(action:"view", params:[id:prcReportInstance.id])
         
        }
        
        
    }
   
}
