import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.authService.*

class BootStrap {

    def init = { servletContext ->
        
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
    def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

    def testUser = new User(username: 'admin', enabled: true, password: 'admin')
    testUser.save(flush: true)

    UserRole.create testUser, adminRole, true

    assert User.count() == 1
    assert Role.count() == 2
    assert UserRole.count() == 1
        
        new BSS(code:"UNM", study:2,name: "University of Mexico").save(failOnError: false, flush: true)
    }
    def destroy = {
    }
}