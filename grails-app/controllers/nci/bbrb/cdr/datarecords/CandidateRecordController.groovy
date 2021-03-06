package nci.bbrb.cdr.datarecords



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import nci.bbrb.cdr.staticmembers.Study

@Transactional(readOnly = true)
class CandidateRecordController {
     def hubIdGenService
     def candidateService
     
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 25, 100)
        respond CandidateRecord.list(params), model:[candidateRecordInstanceCount: CandidateRecord.count()]
    }

    def show(CandidateRecord candidateRecordInstance) {
        respond candidateRecordInstance
    }

    def create() {
        respond new CandidateRecord(params)
    }

    @Transactional
    def save(CandidateRecord candidateRecordInstance) {
        if (candidateRecordInstance == null) {
            notFound()
            return
        }

        candidateRecordInstance.candidateId = hubIdGenService.genCandidateId(candidateRecordInstance.bss.code)
        candidateRecordInstance.study= Study.findByCode('BPS')
        
      /**  if (candidateRecordInstance.hasErrors()) {
            respond candidateRecordInstance.errors, view:'create'
            return
        }**/

        candidateRecordInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'candidateRecord.label', default: 'CandidateRecord'), candidateRecordInstance.id])
                redirect candidateRecordInstance
            }
            '*' { respond candidateRecordInstance, [status: CREATED] }
        }
    }

    def edit(CandidateRecord candidateRecordInstance) {
        respond candidateRecordInstance
    }

    @Transactional
    def update(CandidateRecord candidateRecordInstance) {
        if (candidateRecordInstance == null) {
            notFound()
            return
        }

        if (candidateRecordInstance.hasErrors()) {
            respond candidateRecordInstance.errors, view:'edit'
            return
        }

        
        //candidateRecordInstance.save flush:true
        
        candidateService.updateCandidate(candidateRecordInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CandidateRecord.label', default: 'CandidateRecord'), candidateRecordInstance.id])
                redirect candidateRecordInstance
            }
            '*'{ respond candidateRecordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CandidateRecord candidateRecordInstance) {

        if (candidateRecordInstance == null) {
            notFound()
            return
        }

        candidateRecordInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CandidateRecord.label', default: 'CandidateRecord'), candidateRecordInstance.id])
                redirect action:"index"
				
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'candidateRecord.label', default: 'CandidateRecord'), params.id])
                redirect action:"index"
				
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
