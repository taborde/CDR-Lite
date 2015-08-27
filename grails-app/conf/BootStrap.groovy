import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.authservice.*
import nci.bbrb.cdr.util.AppSetting

class BootStrap {

    def init = { servletContext ->
    def adminRole = new nci.bbrb.cdr.authservice.CdrRole(authority: 'ROLE_ADMIN').save(failOnError: false, flush: true)
    def userRole  = new nci.bbrb.cdr.authservice.CdrRole(authority: 'ROLE_USERS').save(failOnError: false, flush: true)
    def prcRole   = new nci.bbrb.cdr.authservice.CdrRole(authority:   'ROLE_PRC').save(failOnError: false, flush: true)

    def adminUser = new nci.bbrb.cdr.authservice.CdrUser(username: 'admin', enabled: true, password: 'admin')
    adminUser.save(failOnError: false, flush: true)
    
    CdrUserRole.create(adminUser, adminRole, true)
        
    def testUser = new nci.bbrb.cdr.authservice.CdrUser(username: 'testUser', enabled: true, password: 'pmhtest')
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
        /**   new StudyType(code: "DISEASE", name: "Disease", description:  "DISEASE").save(failOnError: false, flush: true)
        new StudyType(code: "NORMAL", name: "Normal", description:  "NORMAL").save(failOnError: false, flush: true)
         
        new BiospecimenType(code: "TAB", name: "Tissue And Blood", description:  "Tissue And Blood collected").save(failOnError: false, flush: true)
        new BiospecimenType(code: "BO", name: "Blood Only", description:  "Blood Only collected").save(failOnError: false, flush: true)
        new BiospecimenType(code: "TO", name: "Tissue Only", description:  "Tissue Only collected").save(failOnError: false, flush: true)**/
          
        new AppSetting(code: "HELP_EMAIL", name: "HELP_EMAIL", , value: "pushpa.hariharan@nih.gov", bigValue: "").save(failOnError: false, flush: true)
        new AppSetting(code: "loginbulletin", name: "loginbulletin", , value: "see big value", bigValue: "this is the login bulletin message").save(failOnError: false, flush: true)
         
        new Study(code: 'BPVLIKE', name:'BPVLIKE').save(failOnError: false, flush: true)
        
        new BSS(code:'BSS_1', name:'CDRLite sample BSS 1').save(failOnError: false, flush: true)
        new BSS(code:'BSS_2', name:'CDRLite sample BSS 2').save(failOnError: false, flush: true)
        
        new CaseCollectionType(code: 'POSTM', name:'Postmortem').save(failOnError: false, flush: true)
        new CaseCollectionType(code: 'OPO', name:'Organ Donor (OPO)').save(failOnError: false, flush: true)
        new CaseCollectionType(code: 'SURGI', name:'Surgical').save(failOnError: false, flush: true)
        
        new CaseStatus(code:'COLL', name:'Collected', description: 'Tissue collection complete').save(failOnError: false, flush: true)
        new CaseStatus(code:'DATA', name:'Data Entry Underway', description: 'Data entry underway at BSS.').save(failOnError: false, flush: true)
        new CaseStatus(code:'DATACOMP', name:'Data Entry Complete', description: 'Data Entry Complete').save(failOnError: false, flush: true)
        new CaseStatus(code:'QA', name:'QA Review', description: 'Case under QA review.').save(failOnError: false, flush: true)
        new CaseStatus(code:'COMP', name:'Complete', description: 'Case is done processing.').save(failOnError: false, flush: true)
        new CaseStatus(code:'RELE', name:'Released', description: 'Case has been validated and released to data warehouse.').save(failOnError: false, flush: true)
        new CaseStatus(code:'REMED', name:'Remediation', description: 'Issues exist, case under remediation, data entry screens unlocked for BSS.').save(failOnError: false, flush: true)
        new CaseStatus(code:'INVA', name:'Invalidated', description: 'Case is Invalidated.').save(failOnError: false, flush: true)
        new CaseStatus(code:'WITHDR', name:'Case Recalled', description: 'Case is Invalidated.').save(failOnError: false, flush: true)
        new CaseStatus(code:'BSSQACOMP', name:'BSS QA Review Complete', description: 'QA review at BSS is complete. Case is locked from further data entry.').save(failOnError: false, flush: true)
        new CaseStatus(code:'INIT', name:'Initialized', description: '').save(failOnError: false, flush: true)
        new CaseStatus(code:'WDCPROG', name:'Case Recall in Progress', description: 'Case Recall in Progress').save(failOnError: false, flush: true)
        
        new TissueType(code:'KIDNEY', name:'Kidney' ).save(failOnError: false, flush: true)
        new TissueType(code:'COLON', name:'Colon' ).save(failOnError: false, flush: true)
        new TissueType(code:'LUNG', name:'Lung' ).save(failOnError: false, flush: true)
        new TissueType(code:'OVARY', name:'Ovary' ).save(failOnError: false, flush: true)
        
        new ContainerType(code:'SST',       name:'SST Vacutainer' ).save(failOnError: false, flush: true)
        new ContainerType(code:'LAVEDTA',   name:'Lavender EDTA' ).save(failOnError: false, flush: true)
        new ContainerType(code:'CRYOV',     name:'Cryovial' ).save(failOnError: false, flush: true)
        new ContainerType(code:'CONCENT',   name:'Concentric Tube' ).save(failOnError: false, flush: true)
        new ContainerType(code:'CASSETTE',  name:'Tissue Cassette' ).save(failOnError: false, flush: true)
        new ContainerType(code:'TRAY',      name:'Tray' ).save(failOnError: false, flush: true)
        new ContainerType(code:'CONICT',    name:'Conical Tube' ).save(failOnError: false, flush: true)
        new ContainerType(code:'CRYOSETTE', name:'Cryosette' ).save(failOnError: false, flush: true)
        new ContainerType(code:'DNAPAX',    name:'PAXgene DNA Vacutainer').save(failOnError: false, flush: true)
        new ContainerType(code:'RNAPAX',    name:'PAXgene RNA Vacutainer').save(failOnError: false, flush: true)
        new ContainerType(code:'MODULE',    name:'Module' ).save(failOnError: false, flush: true)
        new ContainerType(code:'ACD',       name:'ACD Vacutainer' ).save(failOnError: false, flush: true)
        new ContainerType(code:'BUCKET',    name:'Bucket' ).save(failOnError: false, flush: true)
        new ContainerType(code:'ENVELOPE',  name:'Envelope' ).save(failOnError: false, flush: true)
        
        new Fixative(code:"OCT", name:"OCT Embedded").save(failOnError: false, flush: true)
        
        /* Tabor: Add generic Data Coordinating Center and University */
        new Organization(code:'DCC', name:'Data Coordinating Center').save(failOnError: false, flush: true)
        new Organization(code:'UUU', name:'Some University').save(failOnError: false, flush: true)
        /*
        def  orgUUU = new CdrRole(authority: 'ROLE_ORG_UUU').save(failOnError: false, flush: true)
        def  orgDCC = new CdrRole(authority: 'ROLE_ORG_DCC').save(failOnError: false, flush: true)
        
        CdrUserRole.create(testUser, orgUUU, true)            
        CdrUserRole.create(adminUser, orgDCC, true)   
        */
       
        //pmh added this on 08/26/15 for alert service activiy type
        new ActivityType(code:'CASECREATE', name:'NEW CASE' ).save(failOnError: false, flush: true)
        new ActivityType(code:'CASEUPDATE', name:'CASE UPDATED' ).save(failOnError: false, flush: true)
    }
    def destroy = {
    }
}