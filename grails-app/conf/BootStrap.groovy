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
         new AppSetting(code: "CDRLITE_USER_DENY_DISEASE", name: "Deny user access for Disease study. ", value: "see big value", bigValue: "testDUser").save(failOnError: false, flush: true)
        
        
        //pmh 05/13/15 
         new StudyType(code: "DISEASE", name: "Disease", description:  "DISEASE").save(failOnError: false, flush: true)
         new StudyType(code: "NORMAL", name: "Normal", description:  "NORMAL").save(failOnError: false, flush: true)
         
        new BiospecimenType(code: "TAB", name: "Tissue And Blood", description:  "Tissue And Blood collected").save(failOnError: false, flush: true)
         new BiospecimenType(code: "BO", name: "Blood Only", description:  "Blood Only collected").save(failOnError: false, flush: true)
          new BiospecimenType(code: "TO", name: "Tissue Only", description:  "Tissue Only collected").save(failOnError: false, flush: true)
          
         new AppSetting(code: "HELP_EMAIL", name: "HELP_EMAIL", , value: "pushpa.hariharan@nih.gov", bigValue: "").save(failOnError: false, flush: true)
         new AppSetting(code: "loginbulletin", name: "loginbulletin", , value: "see big value", bigValue: "this is the login bulletin message").save(failOnError: false, flush: true)
        
    }
    def destroy = {
    }
}