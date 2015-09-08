package nci.bbrb.cdr.prc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrcReportController {

    def prcReportService
    
    static allowedMethods = [ update: "PUT", delete: "DELETE"]

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
        
        println("in edit???????????????????????????????????????????????????")
        
          def prcReviewList
        def prcIssueList
        def prcReportSubList
        def specimenList
        def errorMap=[:]
        def canSub=false
        
        
        try{
            
            println("before call????????????????????")
            prcReviewList=prcReportService.getPrcReviewList4Edit(prcReportInstance)
            
            println("size: " + prcReviewList.size())
          
             
           /** if(isStarted(prcReportInstance, prcReviewList)){
               
                def result= checkError(prcReportInstance, prcSpecimenList, prcIssueList)
                
                if(result){
                    result.each(){key,value->
                  
                        prcReportInstance.errors.reject(value, value)
                        errorMap.put(key, "errors")
                    }
                }else{
                    
                    canSub=true
                }
              
            }**/
            
           
            
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

        prcReportInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PrcReport.label', default: 'PrcReport'), prcReportInstance.id])
                redirect prcReportInstance
            }
            '*'{ respond prcReportInstance, [status: OK] }
        }
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
}
