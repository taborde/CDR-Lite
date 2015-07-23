package nci.bbrb.cdr.staticmembers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StudyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Study.list(params), model:[studyInstanceCount: Study.count()]
    }

    def show(Study studyInstance) {
        respond studyInstance
    }

    def create() {
        respond new Study(params)
    }

    @Transactional
    def save(Study studyInstance) {
        if (studyInstance == null) {
            notFound()
            return
        }

        if (studyInstance.hasErrors()) {
            respond studyInstance.errors, view:'create'
            return
        }

        studyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'study.label', default: 'Study'), studyInstance.id])
                redirect studyInstance
            }
            '*' { respond studyInstance, [status: CREATED] }
        }
    }

    def edit(Study studyInstance) {
        respond studyInstance
    }

    @Transactional
    def update(Study studyInstance) {
        if (studyInstance == null) {
            notFound()
            return
        }

        if (studyInstance.hasErrors()) {
            respond studyInstance.errors, view:'edit'
            return
        }

        studyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Study.label', default: 'Study'), studyInstance.id])
                redirect studyInstance
            }
            '*'{ respond studyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Study studyInstance) {

        if (studyInstance == null) {
            notFound()
            return
        }

        studyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Study.label', default: 'Study'), studyInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'study.label', default: 'Study'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
