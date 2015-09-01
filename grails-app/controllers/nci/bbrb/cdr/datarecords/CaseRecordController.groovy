package nci.bbrb.cdr.datarecords
import nci.bbrb.cdr.staticmembers.ActivityType
import nci.bbrb.cdr.staticmembers.CaseStatus


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CaseRecordController {
    def ActivityEventService
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 25, 100)
        
        // println("max: " + max + " params.max: " + params.max)
        
        // params.max='3'
        def caseList = CaseRecord.list(params)
        
        def specimenCount=[:]
        if(caseList){
            def count_result = SpecimenRecord.executeQuery("select c.id, count(*) from SpecimenRecord s inner join s.caseRecord c where c in (:list) group by c.id",  [list: caseList])
            count_result.each(){
                specimenCount.put(it[0], it[1])
             
            }
        }
        
        
        respond CaseRecord.list(params), model:[caseRecordInstanceCount: CaseRecord.count(), specimenCount:specimenCount]
    }

    def show(CaseRecord caseRecordInstance) {
        respond caseRecordInstance
    }

    def create() {
        def caseRecord = new CaseRecord(params)
        caseRecord.bss=caseRecord.candidateRecord?.bss
        caseRecord.study=caseRecord.candidateRecord?.study
        // respond new CaseRecord(params)
        respond caseRecord
    }

    @Transactional
    def save(CaseRecord caseRecordInstance) {
        if (caseRecordInstance == null) {
            notFound()
            return
        }

        if (caseRecordInstance.hasErrors()) {
            respond caseRecordInstance.errors, view:'create'
            return
        }

        caseRecordInstance.save flush:true
        
        def activityType = ActivityType.findByCode("CASECREATE")
        def caseId = caseRecordInstance.caseId
        def study = caseRecordInstance.study
        def bssCode = caseRecordInstance.bss?.parentBss?.code
        def username = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
        def additionalInfo =caseId+ " created by "+username
        activityEventService.createEvent(activityType, caseId, study, bssCode, username, additionalInfo, null)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'caseRecord.label', default: 'CaseRecord'), caseRecordInstance.id])
                redirect caseRecordInstance
            }
            '*' { respond caseRecordInstance, [status: CREATED] }
        }
    }

    def edit(CaseRecord caseRecordInstance) {
        respond caseRecordInstance
    }

    @Transactional
    def update(CaseRecord caseRecordInstance) {
        boolean statusChanged = false
        def oldStatus
        def newStatus
        if (caseRecordInstance == null) {
            notFound()
            return
        }
        //pmh  09/01/15: check if case status has changed in this update. If so, send alert email
        if (caseRecordInstance.caseStatus.id != params.statusId) {
           
            statusChanged = true
            newStatus = caseRecordInstance.caseStatus?.name
            oldStatus =CaseStatus.get(params.statusId)?.name
        }
        
        
        if (caseRecordInstance.hasErrors()) {
            respond caseRecordInstance.errors, view:'edit'
            return
        }

        caseRecordInstance.save flush:true
        
        
        if(statusChanged) {
               
            def activityType = ActivityType.findByCode("STATUSCHG")
            def caseId = caseRecordInstance.caseId
            def study = caseRecordInstance.study
            def bssCode = caseRecordInstance.bss?.parentBss?.code
            def username = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
            activityEventService.createEvent(activityType, caseId, study, bssCode, username, oldStatus, newStatus)
        }
        else{
            def activityType = ActivityType.findByCode("CASEUPDATE")
            def caseId = caseRecordInstance.caseId
            def study = caseRecordInstance.study
            def bssCode = caseRecordInstance.bss?.parentBss?.code
            def username = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()
            def additionalInfo =caseId+ " updated by "+username 
            activityEventService.createEvent(activityType, caseId, study, bssCode, username,null , null)
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CaseRecord.label', default: 'CaseRecord'), caseRecordInstance.id])
                redirect caseRecordInstance
            }
            '*'{ respond caseRecordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CaseRecord caseRecordInstance) {

        if (caseRecordInstance == null) {
            notFound()
            return
        }

        caseRecordInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CaseRecord.label', default: 'CaseRecord'), caseRecordInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseRecord.label', default: 'CaseRecord'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    
    def display = {
        def caseRecordInstance
        try {
            Long.parseLong(params.id)
            caseRecordInstance = CaseRecord.get(params.id)    
        } catch (Exception e) {}

        if (!caseRecordInstance) {
            caseRecordInstance = CaseRecord.findByCaseId(params.id)
        }
        /*
        //dispatcher method to figure out who is requesting the caserecord details page
        flash.message = flash.message
        if (session.org?.code == 'OBBR') {
            redirect(action: "show", id: params.id)            
        } else if ((session.org?.code == 'VARI' || session.org?.code == 'BROAD') && caseRecordInstance.study?.code == 'BMS') {
            redirect(controller: "login", action: "denied")
        } else if (session.org?.code == 'VARI' && (caseRecordInstance.study?.code == 'BPV' || caseRecordInstance.study?.code == 'BRN')) {
            redirect(action: "showbpvdeident", id: params.id)
        } else {
            redirect(action: "view", id: params.id)            
        }
        */
       //pmh 09/01/15 for now just apply this without filters..
       redirect(action: "show", id: caseRecordInstance.id)
    }
}
