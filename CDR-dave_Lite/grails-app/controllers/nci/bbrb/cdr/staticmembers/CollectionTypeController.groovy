package nci.bbrb.cdr.staticmembers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CollectionTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CollectionType.list(params), model:[collectionTypeInstanceCount: CollectionType.count()]
    }

    def show(CollectionType collectionTypeInstance) {
        respond collectionTypeInstance
    }

    def create() {
        respond new CollectionType(params)
    }

    @Transactional
    def save(CollectionType collectionTypeInstance) {
        if (collectionTypeInstance == null) {
            notFound()
            return
        }

        if (collectionTypeInstance.hasErrors()) {
            respond collectionTypeInstance.errors, view:'create'
            return
        }

        collectionTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'collectionType.label', default: 'CollectionType'), collectionTypeInstance.id])
                redirect collectionTypeInstance
            }
            '*' { respond collectionTypeInstance, [status: CREATED] }
        }
    }

    def edit(CollectionType collectionTypeInstance) {
        respond collectionTypeInstance
    }

    @Transactional
    def update(CollectionType collectionTypeInstance) {
        if (collectionTypeInstance == null) {
            notFound()
            return
        }

        if (collectionTypeInstance.hasErrors()) {
            respond collectionTypeInstance.errors, view:'edit'
            return
        }

        collectionTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CollectionType.label', default: 'CollectionType'), collectionTypeInstance.id])
                redirect collectionTypeInstance
            }
            '*'{ respond collectionTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CollectionType collectionTypeInstance) {

        if (collectionTypeInstance == null) {
            notFound()
            return
        }

        collectionTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CollectionType.label', default: 'CollectionType'), collectionTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'collectionType.label', default: 'CollectionType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
