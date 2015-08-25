package nci.bbrb.cdr.datarecords



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SpecimenRecordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SpecimenRecord.list(params), model:[specimenRecordInstanceCount: SpecimenRecord.count()]
    }

    def show(SpecimenRecord specimenRecordInstance) {
        respond specimenRecordInstance
    }

    def create() {
        respond new SpecimenRecord(params)
    }

    @Transactional
    def save(SpecimenRecord specimenRecordInstance) {
        if (specimenRecordInstance == null) {
            notFound()
            return
        }

        if (specimenRecordInstance.hasErrors()) {
            respond specimenRecordInstance.errors, view:'create'
            return
        }

        specimenRecordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'specimenRecord.label', default: 'SpecimenRecord'), specimenRecordInstance.id])
                redirect specimenRecordInstance
            }
            '*' { respond specimenRecordInstance, [status: CREATED] }
        }
    }

    def edit(SpecimenRecord specimenRecordInstance) {
        respond specimenRecordInstance
    }

    @Transactional
    def update(SpecimenRecord specimenRecordInstance) {
        if (specimenRecordInstance == null) {
            notFound()
            return
        }

        if (specimenRecordInstance.hasErrors()) {
            respond specimenRecordInstance.errors, view:'edit'
            return
        }

        specimenRecordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SpecimenRecord.label', default: 'SpecimenRecord'), specimenRecordInstance.id])
                redirect specimenRecordInstance
            }
            '*'{ respond specimenRecordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SpecimenRecord specimenRecordInstance) {

        if (specimenRecordInstance == null) {
            notFound()
            return
        }

        specimenRecordInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SpecimenRecord.label', default: 'SpecimenRecord'), specimenRecordInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'specimenRecord.label', default: 'SpecimenRecord'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
