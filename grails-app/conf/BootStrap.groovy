import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.authservice.*

class BootStrap {

    def init = { servletContext ->
    def adminRole = new nci.bbrb.cdr.authservice.CdrRole(authority: 'ROLE_ADMIN').save(failOnError: false, flush: true)
    def userRole  = new nci.bbrb.cdr.authservice.CdrRole(authority: 'ROLE_USER').save(failOnError: false, flush: true)

    def testUser = new nci.bbrb.cdr.authservice.CdrUser(username: 'admin', enabled: true, password: 'admin')
    testUser.save(failOnError: false, flush: true)

    CdrUserRole.create(testUser, adminRole, true)

    assert CdrUser.count() == 1
    assert CdrRole.count() == 2
    assert CdrUserRole.count() == 1
        
    }
    def destroy = {
    }
}