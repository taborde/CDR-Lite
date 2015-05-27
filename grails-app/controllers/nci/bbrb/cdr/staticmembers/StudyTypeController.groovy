package nci.bbrb.cdr.staticmembers



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StudyTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond StudyType.list(params), model:[studyTypeInstanceCount: StudyType.count()]
    }

    def show(StudyType studyTypeInstance) {
        respond studyTypeInstance
    }

    def create() {
        respond new StudyType(params)
    }

    @Transactional
    def save(StudyType studyTypeInstance) {
        if (studyTypeInstance == null) {
            notFound()
            return
        }

        if (studyTypeInstance.hasErrors()) {
            respond studyTypeInstance.errors, view:'create'
            return
        }

        studyTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'studyType.label', default: 'StudyType'), studyTypeInstance.id])
                redirect studyTypeInstance
            }
            '*' { respond studyTypeInstance, [status: CREATED] }
        }
    }

    def edit(StudyType studyTypeInstance) {
        respond studyTypeInstance
    }

    @Transactional
    def update(StudyType studyTypeInstance) {
        if (studyTypeInstance == null) {
            notFound()
            return
        }

        if (studyTypeInstance.hasErrors()) {
            respond studyTypeInstance.errors, view:'edit'
            return
        }

        studyTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StudyType.label', default: 'StudyType'), studyTypeInstance.id])
                redirect studyTypeInstance
            }
            '*'{ respond studyTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StudyType studyTypeInstance) {

        if (studyTypeInstance == null) {
            notFound()
            return
        }

        studyTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StudyType.label', default: 'StudyType'), studyTypeInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'studyType.label', default: 'StudyType'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
