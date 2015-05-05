import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.authservice.*
import nci.bbrb.cdr.util.AppSetting

class BootStrap {

    def init = { servletContext ->
    def adminRole = new nci.bbrb.cdr.authservice.CdrRole(authority: 'ROLE_ADMIN').save(failOnError: false, flush: true)
    def userRole  = new nci.bbrb.cdr.authservice.CdrRole(authority: 'ROLE_USERS').save(failOnError: false, flush: true)

    def testUser = new nci.bbrb.cdr.authservice.CdrUser(username: 'admin', enabled: true, password: 'admin')
    testUser.save(failOnError: false, flush: true)

    CdrUserRole.create(testUser, adminRole, true)
    
       testUser = new nci.bbrb.cdr.authservice.CdrUser(username: 'testDUser', enabled: true, password: 'pmhtest')
    testUser.save(failOnError: false, flush: true)

     CdrUserRole.create(testUser, userRole, true)

    //assert CdrUser.count() == 2
    //assert CdrRole.count() == 2
    //assert CdrUserRole.count() == 2
    
       println "cdrUser count ="+CdrUser.count()
    println "cdrRole count ="+CdrRole.count()
    println "cdrUserRole count ="+CdrUserRole.count()
    
        //pmh 05/04/15 
         new AppSetting(code: "CDRLITE_USER_DENY_DISEASE", name: "Deny user access for Disease study. Enter usernames separated by commas.", value: "see big value", bigValue: "testDUser").save(failOnError: false, flush: true)
        
    }
    def destroy = {
    }
}