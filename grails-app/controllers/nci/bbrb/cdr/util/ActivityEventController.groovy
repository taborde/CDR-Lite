package nci.bbrb.cdr.util

import nci.bbrb.cdr.datarecords.CaseRecord
import grails.converters.JSON
import org.springframework.security.access.annotation.Secured
    

class ActivityEventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def scaffold = ActivityEvent

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 25, 100)
        [activityEventInstanceList: ActivityEvent.list(params), activityEventInstanceTotal: ActivityEvent.count()]
    }

    def create = {
        def activityEventInstance = new ActivityEvent()
        activityEventInstance.properties = params
        return [activityEventInstance: activityEventInstance]
    }

    def save = {
        def activityEventInstance = new ActivityEvent(params)
        if (activityEventInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), activityEventInstance.id])}"
            redirect(action: "show", id: activityEventInstance.id)
        }
        else {
            render(view: "create", model: [activityEventInstance: activityEventInstance])
        }
    }

    def show = {
        def activityEventInstance = ActivityEvent.get(params.id)
        if (!activityEventInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), params.id])}"
            redirect(action: "list")
        }
        else {
            [activityEventInstance: activityEventInstance]
        }
    }

    def edit = {
        def activityEventInstance = ActivityEvent.get(params.id)
        if (!activityEventInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [activityEventInstance: activityEventInstance]
        }
    }

    def update = {
        def activityEventInstance = ActivityEvent.get(params.id)
        if (activityEventInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (activityEventInstance.version > version) {
                    
                    activityEventInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'activityEvent.label', default: 'ActivityEvent')] as Object[], "Another user has updated this ActivityEvent while you were editing")
                    render(view: "edit", model: [activityEventInstance: activityEventInstance])
                    return
                }
            }
            activityEventInstance.properties = params
            if (!activityEventInstance.hasErrors() && activityEventInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), activityEventInstance.id])}"
                redirect(action: "show", id: activityEventInstance.id)
            }
            else {
                render(view: "edit", model: [activityEventInstance: activityEventInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), params.id])}"
            redirect(action: "list")
        }
    }

   // @Secured('ROLE_ADMIN') 
    def delete = {
        def activityEventInstance = ActivityEvent.get(params.id)
        if (activityEventInstance) {
            try {
                activityEventInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activityEvent.label', default: 'ActivityEvent'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def retrieveEvent = {
        def c = ActivityEvent.createCriteria()
        def study = session.study?.code
        def org = session.org?.code
       
        def eventList = []
        def numResults = 250
        if (params.max) {
            numResults = params.max as int
        }
        
        eventList = c.list {
            if (study) {
                createAlias("study", "s")
                eq("s.code", study) 
            }
                       
            if (org == 'DCC') {
                //like("bssCode", org + "%")
           
                createAlias("activityType", "a")
                
                  //  'in'("a.code", ["CASECREATE", "CASEUPDATE","STATUSCHG"])
                 'in'("a.code", ["CASECREATE", "STATUSCHG", "QUERY"])
                    
                }
            
            order("dateCreated", "desc")
            maxResults(numResults)
        } 
        
        JSON.use("deep") {
            if (params.callback) {
                render "${params.callback.encodeAsURL()}(${eventList as JSON})"
            } else {
                render eventList as JSON
            }
        }
    }
}
