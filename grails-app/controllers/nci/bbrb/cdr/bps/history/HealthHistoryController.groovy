package nci.bbrb.cdr.bps.history
import nci.bbrb.cdr.datarecords.CandidateRecord

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HealthHistoryController {
    def healthHistoryService
    //  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    

    def show(HealthHistory healthHistoryInstance) {
        respond healthHistoryInstance
    }

    def create() {
        def healthHistoryInstance = new HealthHistory(params)
        println "pmh hh candi= "+healthHistoryInstance?.candidateRecord?.id
      
        def chList // all cancer history entires so far
        chList=CancerHistory.findAllByCandidateRecord(CandidateRecord.findById(healthHistoryInstance?.candidateRecord?.id))
        
        def gmhList // all general medical entires so far
        gmhList=GeneralMedicalHistory.findAllByCandidateRecord(CandidateRecord.findById(healthHistoryInstance?.candidateRecord?.id))
        
        def medList // all medication entires so far
        medList=MedicationHistory.findAllByCandidateRecord(CandidateRecord.findById(healthHistoryInstance?.candidateRecord?.id))
        //respond healthHistory
        println chList.size()
        return [healthHistoryInstance: healthHistoryInstance,chList:chList,gmhList:gmhList,medList:medList]
    }

    @Transactional
    def save(HealthHistory healthHistoryInstance) {
        
        if (healthHistoryInstance == null) {
            notFound()
            return
        }
        if(params.candId){
            healthHistoryInstance.candidateRecord=CandidateRecord.get(params.candId)
                
        }
        if (healthHistoryInstance.hasErrors()) {
            respond healthHistoryInstance.errors, view:'create'
            return
        }
        //params.each{key,value->
        // println "from save key: ${key}   value:${value}"
        //  }
        healthHistoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'healthHistory.label', default: 'HealthHistory'), healthHistoryInstance.id])
                redirect healthHistoryInstance
            }
            '*' { respond healthHistoryInstance, [status: CREATED] }
        }
    }

    def edit= {
        println " in edit "+params.id
        def healthHistoryInstance = HealthHistory.get(params.id)
        def chList // all cancer history entires so far
        chList=CancerHistory.findAllByCandidateRecord(CandidateRecord.findById(healthHistoryInstance?.candidateRecord?.id))
        
        def gmhList // all general medical entires so far
        gmhList=GeneralMedicalHistory.findAllByCandidateRecord(CandidateRecord.findById(healthHistoryInstance?.candidateRecord?.id))
        
        def medList // all medication entires so far
        medList=MedicationHistory.findAllByCandidateRecord(CandidateRecord.findById(healthHistoryInstance?.candidateRecord?.id))
        return [healthHistoryInstance: healthHistoryInstance,chList:chList,gmhList:gmhList,medList:medList]
    }

    
    def update= {
        def healthHistoryInstance = HealthHistory.get(params.id)
        // println " in update  "+healthHistoryInstance.id
        
        //  params.each{key,value->
        //  println "from update key: ${key}   value:${value}"
        //  }
        if (healthHistoryInstance == null) {
            notFound()
            return
        }

        if (healthHistoryInstance.hasErrors()) {
            println " ???"
            respond healthHistoryInstance.errors, view:'edit'
            return
        }

        healthHistoryService.saveReport(healthHistoryInstance, params, request)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'HealthHistory.label', default: 'HealthHistory'), healthHistoryInstance.id])
                redirect(action:"edit", params:[id:healthHistoryInstance.id])
            }
            // println " end of update"
            redirect(action:"edit", params:[id:healthHistoryInstance.id])
        }
    }

    @Transactional
    def delete(HealthHistory healthHistoryInstance) {

        if (healthHistoryInstance == null) {
            notFound()
            return
        }

        healthHistoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'HealthHistory.label', default: 'HealthHistory'), healthHistoryInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'healthHistory.label', default: 'HealthHistory'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    
    def save_ch = {
        
       
        def cancerHistoryInstance = new CancerHistory()
        def cancerHistoryList
       
       // params.each{key,value->
       //     println "from save_ch key: ${key}   value:${value}"
       // }
         
        //def testdate = Date.parse( 'dd/MM/yyyy',params.monthYearOfFirstDiagnosis  )
        
         
        cancerHistoryInstance.primaryTumorSite=params.chprimaryTumorSite
        cancerHistoryInstance.source=params.chsource
        cancerHistoryInstance.treatments=params.chtreatments
        def testdate1 = Date.parse( 'mm/dd/yyyy',params.chmonthYearOfFirstDiagnosis  )
        // println "monthYearOfFirstDiagnosis"+testdate1 
        cancerHistoryInstance.monthYearOfFirstDiagnosis=testdate1
        testdate1 = Date.parse( 'mm/dd/yyyy',params.chmonthYearOfLastTreatment  )
        //println "monthYearOfLastTreatment"+testdate1 
        cancerHistoryInstance.monthYearOfLastTreatment=testdate1
        
        cancerHistoryInstance.candidateRecord=CandidateRecord.findById(params.candId)
        //cancerHistoryInstance.save flush:true
        def username= session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
        healthHistoryService.saveCancerHistory(cancerHistoryInstance,username)
        
        if(params.candId){
            cancerHistoryList=CancerHistory.findAllByCandidateRecord(CandidateRecord.findById(params.candId))
        }
        
       cancerHistoryList.each{
           println it.monthYearOfFirstDiagnosis
       }        
        def resultsMap = [:]
        def latestEntries = []
        latestEntries.add(cancerHistoryList?.sort{ it.id }.last())
        resultsMap.put("success",latestEntries)
           
        if(params.callback) {
            render "${params.callback.encodeAsURL()}(${resultsMap as JSON})"
        } else {
            render resultsMap as JSON
        }  
              
    }
    
    def removeCancerEntry = {
         
        //println " coming to delete "+params.id
        def resultsMap = [:]
        resultsMap.put("chDel", "fail")
        def cancerHistoryInstance = CancerHistory.get(params.id)
        
        
        try {
            
            cancerHistoryInstance?.delete()
            resultsMap.put("chDel", "yes")
            resultsMap.put("delid", params.id)
            
        } catch (Exception e) {
            e.printStackTrace()
            throw new RuntimeException(e.toString())
        }
        //redirect(controller: 'caseRecord', action: "display", params: [id:fileUploadInstance.caseRecord.id])
        //In case there is no caseRecord for old data
        // redirect(action: "edit", id:params.id)
       
        if(params.callback) {
            render "${params.callback.encodeAsURL()}(${resultsMap as JSON})"
        } else {
            render resultsMap as JSON
        }   
    }
    
    
    // general medical
    
    def save_gm = {
        //println " I am here in GM from js"
       
        def generalMedicalHistoryInstance = new GeneralMedicalHistory()
        def generalMedicalHistoryList
       
       // params.each{key,value->
       //     println "from save_GMH key: ${key}   value:${value}"
       // }
         
             
         
        generalMedicalHistoryInstance.diseaseName=params.gmh_diseaseName
        generalMedicalHistoryInstance.source=params.gmh_source
        generalMedicalHistoryInstance.treatments=params.gmh_treatments
        def testdate1 = Date.parse( 'mm/dd/yyyy',params.gmh_monthYearOfFirstDiagnosis  )
        medicationInstance.monthYearOfFirstDiagnosis=testdate1
       
        testdate1 = Date.parse( 'mm/dd/yyyy',params.gmh_monthYearOfLastTreatment  )
        medicationInstance.params.gmh_monthYearOfLastTreatment=testdate1
 
         
        generalMedicalHistoryInstance.candidateRecord=CandidateRecord.findById(params.candId)
       // generalMedicalHistoryInstance.save flush:true
       def username= session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
        healthHistoryService.saveGeneralMedicalHistory(generalMedicalHistoryInstance,username)
        
        
        if(params.candId){
            generalMedicalHistoryList=GeneralMedicalHistory.findAllByCandidateRecord(CandidateRecord.findById(params.candId))
        }
        
        def resultsMap = [:]
        def latestEntries = []
        latestEntries.add(generalMedicalHistoryList?.sort{ it.id }.last())
        resultsMap.put("success",latestEntries)
           
        if(params.callback) {
            render "${params.callback.encodeAsURL()}(${resultsMap as JSON})"
        } else {
            render resultsMap as JSON
        }  
              
    }
    
    def removeGMHEntry = {
         
        //  println " coming to delete GMH"+params.id
        def resultsMap = [:]
        resultsMap.put("chDel", "fail")
        def generalMedicalHistoryInstance = GeneralMedicalHistory.get(params.id)
        
        
        try {
            
            generalMedicalHistoryInstance?.delete()
            resultsMap.put("chDel", "yes")
            resultsMap.put("delid", params.id)
            
        } catch (Exception e) {
            e.printStackTrace()
            throw new RuntimeException(e.toString())
        }
        //redirect(controller: 'caseRecord', action: "display", params: [id:fileUploadInstance.caseRecord.id])
        //In case there is no caseRecord for old data
        // redirect(action: "edit", id:params.id)
       
        if(params.callback) {
            render "${params.callback.encodeAsURL()}(${resultsMap as JSON})"
        } else {
            render resultsMap as JSON
        }   
    }
    
    
    // medication entries
    
    def save_med = {
        // println " I am here in MED from js"
       
        def medicationInstance = new MedicationHistory()
        def medicationHistoryList
       
        // params.each{key,value->
        // println "from save_MED key: ${key}   value:${value}"
        // }
        
        medicationInstance.medicationName=params.med_medicationName
        medicationInstance.source=params.med_source
        
        def testdate1 = Date.parse( 'mm/dd/yyyy',params.med_dateofLastAdministration  )
        medicationInstance.dateofLastAdministration=testdate1
    
        medicationInstance.candidateRecord=CandidateRecord.findById(params.candId)
        //medicationInstance.save flush:true
        def username= session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
        healthHistoryService.saveMedicationHistory(medicationInstance,username)
        
        
        if(params.candId){
            medicationHistoryList=MedicationHistory.findAllByCandidateRecord(CandidateRecord.findById(params.candId))
        }
        
        def resultsMap = [:]
        def latestEntries = []
        latestEntries.add(medicationHistoryList?.sort{ it.id }.last())
        resultsMap.put("success",latestEntries)
           
        if(params.callback) {
            render "${params.callback.encodeAsURL()}(${resultsMap as JSON})"
        } else {
            render resultsMap as JSON
        }  
              
    }
    
    def removeMedEntry = {
         
        //println " coming to delete GMH"+params.id
        def resultsMap = [:]
        resultsMap.put("chDel", "fail")
        def medicationInstance = MedicationHistory.get(params.id)
        
        
        try {
            
            medicationInstance?.delete()
            resultsMap.put("chDel", "yes")
            resultsMap.put("delid", params.id)
            
        } catch (Exception e) {
            e.printStackTrace()
            throw new RuntimeException(e.toString())
        }
        
       
        if(params.callback) {
            render "${params.callback.encodeAsURL()}(${resultsMap as JSON})"
        } else {
            render resultsMap as JSON
        }   
    }
    
    
}
