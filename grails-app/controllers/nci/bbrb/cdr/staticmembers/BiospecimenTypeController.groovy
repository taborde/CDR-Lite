package nci.bbrb.cdr.staticmembers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BiospecimenTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BiospecimenType.list(params), model:[biospecimenTypeInstanceCount: BiospecimenType.count()]
    }

    def show(BiospecimenType biospecimenTypeInstance) {
        respond biospecimenTypeInstance
    }

    def create() {
        respond new BiospecimenType(params)
    }

    @Transactional
    def save(BiospecimenType biospecimenTypeInstance) {
        if (biospecimenTypeInstance == null) {
            notFound()
            return
        }

        if (biospecimenTypeInstance.hasErrors()) {
            respond biospecimenTypeInstance.errors, view:'create'
            return
        }

        biospecimenTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'biospecimenType.label', default: 'BiospecimenType'), biospecimenTypeInstance.id])
                redirect biospecimenTypeInstance
            }
            '*' { respond biospecimenTypeInstance, [status: CREATED] }
        }
    }

    def edit(BiospecimenType biospecimenTypeInstance) {
        respond biospecimenTypeInstance
    }

    @Transactional
    def update(BiospecimenType biospecimenTypeInstance) {
        if (biospecimenTypeInstance == null) {
            notFound()
            return
        }

        if (biospecimenTypeInstance.hasErrors()) {
            respond biospecimenTypeInstance.errors, view:'edit'
            return
        }

        biospecimenTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BiospecimenType.label', default: 'BiospecimenType'), biospecimenTypeInstance.id])
                redirect biospecimenTypeInstance
            }
            '*'{ respond biospecimenTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BiospecimenType biospecimenTypeInstance) {

        if (biospecimenTypeInstance == null) {
            notFound()
            return
        }

        biospecimenTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BiospecimenType.label', default: 'BiospecimenType'), biospecimenTypeInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'biospecimenType.label', default: 'BiospecimenType'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
