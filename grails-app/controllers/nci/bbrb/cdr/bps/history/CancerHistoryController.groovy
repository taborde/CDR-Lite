package nci.bbrb.cdr.bps.history



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CancerHistoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CancerHistory.list(params), model:[cancerHistoryInstanceCount: CancerHistory.count()]
    }

    def show(CancerHistory cancerHistoryInstance) {
        respond cancerHistoryInstance
    }

    def create() {
        respond new CancerHistory(params)
    }

    @Transactional
    def save(CancerHistory cancerHistoryInstance) {
        if (cancerHistoryInstance == null) {
            notFound()
            return
        }

        if (cancerHistoryInstance.hasErrors()) {
            respond cancerHistoryInstance.errors, view:'create'
            return
        }

        cancerHistoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cancerHistory.label', default: 'CancerHistory'), cancerHistoryInstance.id])
                redirect cancerHistoryInstance
            }
            '*' { respond cancerHistoryInstance, [status: CREATED] }
        }
    }

    def edit(CancerHistory cancerHistoryInstance) {
        respond cancerHistoryInstance
    }

    @Transactional
    def update(CancerHistory cancerHistoryInstance) {
        if (cancerHistoryInstance == null) {
            notFound()
            return
        }

        if (cancerHistoryInstance.hasErrors()) {
            respond cancerHistoryInstance.errors, view:'edit'
            return
        }

        cancerHistoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CancerHistory.label', default: 'CancerHistory'), cancerHistoryInstance.id])
                redirect cancerHistoryInstance
            }
            '*'{ respond cancerHistoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CancerHistory cancerHistoryInstance) {

        if (cancerHistoryInstance == null) {
            notFound()
            return
        }

        cancerHistoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CancerHistory.label', default: 'CancerHistory'), cancerHistoryInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cancerHistory.label', default: 'CancerHistory'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
