package nci.bbrb.cdr.datarecords



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CaseRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CaseRecord.list(params), model:[caseRecordInstanceCount: CaseRecord.count()]
    }

    def show(CaseRecord caseRecordInstance) {
        respond caseRecordInstance
    }

    def create() {
        respond new CaseRecord(params)
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
        if (caseRecordInstance == null) {
            notFound()
            return
        }

        if (caseRecordInstance.hasErrors()) {
            respond caseRecordInstance.errors, view:'edit'
            return
        }

        caseRecordInstance.save flush:true

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
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseRecord.label', default: 'CaseRecord'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
