package nci.bbrb.cdr.context

import nci.bbrb.cdr.util.UserLogin
import nci.bbrb.cdr.staticmembers.BSS
import nci.bbrb.cdr.staticmembers.Study
import nci.bbrb.cdr.staticmembers.Organization

import org.codehaus.groovy.grails.web.util.WebUtils

//import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import grails.plugin.springsecurity.ui.RegistrationCode
//import org.codehaus.groovy.grails.plugins.springsecurity.SecurityEventListener new for Grails 2.4.4:
import grails.plugin.springsecurity.SecurityEventListener
import org.springframework.context.ApplicationEvent
import org.springframework.security.web.WebAttributes
import org.springframework.security.authentication.InsufficientAuthenticationException

import org.springframework.security.authentication.event.AuthenticationSuccessEvent
import org.springframework.security.authentication.event.AuthenticationFailureCredentialsExpiredEvent
import nci.bbrb.cdr.util.*


class CDRApplicationEvent extends SecurityEventListener {
    def grailsApplication 

    
    @Override
    public void onApplicationEvent(final ApplicationEvent e) {
//        log.info("1. onApplicationEvent")
//        println ("2. onApplicationEvent: " + e )
        if(e instanceof AuthenticationSuccessEvent) {
            logUser(e.source)
            loadUserSession(e.source)
        } else if(e instanceof AuthenticationFailureCredentialsExpiredEvent) {
            def session = WebUtils.retrieveGrailsWebRequest().session
            String username = session[WebAttributes.LAST_USERNAME]

            if(username) {
                RegistrationCode.withTransaction { status ->
                    def registrationCode = RegistrationCode.findByUsername(username)
                    if(!registrationCode) {
                        registrationCode = new RegistrationCode(username: username)
                        registrationCode.save(flush: true)
                    }
                    session['EXPIRED_PASSWORD_TOKEN'] = registrationCode?.token
                }
            }
        }
    }

    protected void logUser(source) {
//        log.info("logUser")
//        println ("logUser")
//        println "source: " + source
//        println "grailsApplication: " + grailsApplication
        try {
            def username = source.principal.username
            def sessionId = source.details.sessionId

//            println "sessionId: " + sessionId
            if(sessionId) {
                UserLogin.withTransaction { status ->
//                    println "status: " + status
                    //if (username != 'ldaccservice')
                    //{
                    
                    def userLogin = new UserLogin()
                    userLogin.username = username
                    userLogin.loginDate = new Date()
                    userLogin.sessionId = sessionId
                    userLogin.application = grailsApplication.metadata.'app.name'
                    userLogin.save(failOnError:true, flush:true)
                    
                    //}
                }
            }
        } catch(Exception ex) {
            ex.printStackTrace()
            throw ex
        }
    }

    protected void loadUserSession(source) {
//        println "loadUserSession"
//        log.info("loadUserSession")
//        println "grailsApplication: " + grailsApplication
        try {
            def session = WebUtils.retrieveGrailsWebRequest().session
            session.appVer = grailsApplication.metadata.'app.version'

            //Get roles from Spring Security
            def authorities =  source.authorities*.authority
            session.authorities = authorities
            
            def bss
            def organization
            def role

            //This would be better if it wasn't hardcoded.  TODO: make a role list from a constants file
            //These are set from the original bootstrap.groovy and maintained in the Spring Security UI plugin
            //Test if incoming role is an outside organization or BSS:
            if(authorities.contains("ROLE_BSS_UUU") || authorities.contains("ROLE_BSS_CCC")) {

                //Get the current role.  

                
                authorities.each{

                    if(it.toString() != "ROLE_SERVICE"){ //exclude service accounts
                    
                        role = it.toString()
                        role = role.substring(9).toString()

                        //Try for a BSS
                        bss = BSS.findByCode(role)
                        //Try for an Organization
                        organization = Organization.findByCode(role)

                        if(bss || organization){ 
                            return true  //break
                        }
                    }
                }
       
                //Polymorphically assign either a BSS or Organization (Gosh I love Groovy)
                def org = bss ?: organization

                //Put a seperate user and org object into session.
                //session.user = user -- taking out because getting unexpected results with session timeout
                session.org = org
                 if(role in ['UUU', 'CCC']) {
                    //set session privilege flags
                    session.DM = true
                    session.PRC = false
                    session.LDS = true
                    def study = Study.findByCode("BPS")
                    session.study = study
                }
                
             
               
            }

            if(authorities.contains("ROLE_SERVICE")) {
                session.serviceAccount = true
            }

//            println "authorities: " + authorities

            if(authorities.contains('ROLE_ADMIN') ||
                authorities.contains('ROLE_STUDY_NAME') ||
                authorities.contains('ROLE_PRC') ||
                authorities.contains('ROLE_SUPER') ||
                authorities.contains('ROLE_DCC') ) {

                
                def org 
                Organization.withTransaction{ status ->
                    org = Organization.findByCode("DCC")
                    if (org) {
                        session.org = org
                    }
                }
                


                if(authorities.contains('ROLE_PRC')) {
                    session.PRC = true
                }
            }
            
            if(session.org){
                def sessionId = source.details.sessionId

                if(sessionId) {
                    UserLogin.withTransaction { status ->
                        def userLogin =  UserLogin.findBySessionId(sessionId)
                        if(userLogin){
                            userLogin.organization = session.org
                            userLogin.save(failOnError:true, flush:true)
                        }
                    }
                }
                
            }else {
                throw new InsufficientAuthenticationException("User [${source.principal.username}] has no associated organization.")
            }
        } catch(InsufficientAuthenticationException iae) {
            iae.printStackTrace()
            throw iae
        } catch(Exception ex) {
            ex.printStackTrace()
            throw ex
        }
    }
}
