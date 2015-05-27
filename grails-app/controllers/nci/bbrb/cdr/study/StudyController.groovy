package nci.bbrb.cdr.study
import nci.bbrb.cdr.staticmembers.*

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StudyController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Study.list(params), model:[studyInstanceCount: Study.count()]
    }
    
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Study.list(params), model:[studyInstanceCount: Study.count()]
    }

    def show(Study studyInstance) {
        
        respond studyInstance
    }

    def create() {
        respond new Study(params)
    }

 
    
    def save = {
        //println "coming here to save"
        def studyInstance = new Study(params)
        // params.each{k,v->
        //   println k+" in save -->"+v           
        // }
        def isDuplicate =false
        def objExists =Study.findByName(params.name.trim())
        if(objExists) isDuplicate =true
        
        def errorMap = checkError(studyInstance)
        errorMap.each() {key, value ->
            studyInstance.errors.rejectValue(key, value)
        }
        
        if (!isDuplicate && !studyInstance.hasErrors() &&  studyInstance.save(flush: true)) {
            // flash.message = "${message(code: 'default.created.message', args: [message(code: 'bpvSixMonthFollowUp.label', default: 'Bpv 6 Month Follow up for'), studyInstance.caseRecord.caseId])}"
            flash.message = "Saved Study successfully"
            //redirect(action: "show", id: studyInstance.id)
            redirect(action: "editWithValidation", id: studyInstance.id)
        }
        else {
            if(isDuplicate){
                flash.message =" Name already exists. Please enter a valid Name"
                flash.default =" Name already exists. Please enter a valid Name" 
                studyInstance.errors.rejectValue('name', 'Name already exists. Please enter a valid Name')
            }
            else if(studyInstance.hasErrors()){
                flash.message =" Please check the errors. Enter all fields required"
                flash.default =" Please check the errors. Enter all fields required" 
            }
            else{
                flash.message =" Failed creating Study"
                flash.default =" Failed creating Study" 
            }
            render(view: "create", model: [studyInstance: studyInstance])
        }
    }

    def edit(Study studyInstance) {
        // println "coming here to edit"
        respond studyInstance
    }
    
    
    def editWithValidation = {
        println "coming here to editwithvalidation"
        def canSubmit = 'No'
        def studyInstance = Study.get(params.id)
        if (!studyInstance) {
            //flash.message = "study instance not found"
            redirect(action: "list")
        }
        else {
            /*             
            def errorMap = checkError(studyInstance)
            errorMap.each() {key, value ->
            studyInstance.errors.rejectValue(key, value)
            }
            if (errorMap.size() == 0) {
            canSubmit = 'Yes'
            }
             */
            canSubmit = 'Yes'
            render(view: "edit", model: [studyInstance: studyInstance, canSubmit: canSubmit])
        }
    }
  

    def update = {
        println "coming here to update"+params.id
        def studyInstance = Study.get(params.id)
        if (studyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (studyInstance.version > version) {
                    
                    studyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [studyInstance?.formMetadata?.cdrFormName] as Object[], "Another user has updated this Study while you were editing")
                    render(view: "edit", model: [studyInstance: studyInstance])
                    return
                }
            }
            
            studyInstance.properties = params
            
            if (!studyInstance.hasErrors() && studyInstance.save(flush: true)) {
                flash.message = "study data has been updated"
                redirect(action: "editWithValidation", id: studyInstance.id)
            }
            else {
                render(view: "edit", model: [studyInstance: studyInstance])
            }
        }
        else {
            flash.message = "study not found in update action"
            redirect(action: "list")
        }
    }
    
    def delete= {
        println " in delete"
        def studyInstance = Study.get(params.id)
        if (studyInstance == null) {
            notFound()
            return
        }

        studyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Study.label', default: 'Study'), studyInstance.id])
                redirect(controller: "home", action: "studyHome")
				
            }
            redirect(controller: "home", action: "studyHome")
        }
    }

        
    
    
    def resumeEditing = {
        def studyInstance = Study.get(params.id)
        studyInstance.dateCreated = null
        studyInstance.createdBy = null
        // studyInstance.datelastUpdated = null
        // studyInstance.updatedBy = null
      
        if (studyInstance.save(flush: true)) {
            redirect(action: "edit", id: studyInstance.id)
        }
        else {
            render(view: "show", model: [studyInstance: studyInstance])
        }
    }
    
    
    def submit = {
        println "coming here to submit"
        def studyInstance = Study.get(params.id)
        if (studyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (studyInstance.version > version) {
                    
                    studyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [studyInstance?.formMetadata?.cdrFormName] as Object[], "Another user has updated this Study while you were editing")
                    render(view: "edit", model: [studyInstance: studyInstance])
                    return
                }
            }
            
            studyInstance.properties = params
            
            //def errorMap = checkError(studyInstance)
            //errorMap.each() {key, value ->
            //     studyInstance.errors.rejectValue(key, value)
            // }
            if (!studyInstance.hasErrors() && studyInstance.save(flush: true)) {
                
                //studyInstance.dateSubmitted = new Date()
                // studyInstance.submittedBy = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
                flash.message = "submitted form successfully here"
                
                                           
                redirect(controller: "home", action: "studyHome")
                
                
            }
            else {
                studyInstance.discard()
                render(view: "edit", model: [studyInstance: studyInstance])
            }
        }
        else {
            flash.message = "not found message here"
            redirect(action: "list")
        }
    }
    Map checkError(studyInstance){
        def retMap =[:]
        println " i am validating entries"
        if (!studyInstance?.name ) {
            retMap.put('name', 'Please enter Study Name')
        }else{
            if(studyInstance?.name.length() > 50 ){
                retMap.put('name', "The length of study name can't be greater than 50") 
            }
        }
        
        if (!studyInstance?.studyType ) {
            retMap.put('studyType', 'Please select Study Type')
        }
        
        if (!studyInstance?.biospecimenType ) {
            retMap.put('biospecimenType', 'Please select Biospecimen Type')
        }
              
        return retMap
    }
    
}
