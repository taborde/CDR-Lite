package nci.bbrb.cdr

import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.util.ActivityEvent
import nci.bbrb.cdr.util.AppSetting
import grails.util.GrailsUtil
import nci.bbrb.cdr.staticmembers.BSS
//import nci.bbrb.cdr.util.querytracker.Query 


class ActivityEventService {

    static transactional = true
    //def prcReportService1 = new PrcReportService()
    def env = "production".equalsIgnoreCase(GrailsUtil.environment) ? "" : " [${GrailsUtil.environment}]"
    def sendMailService
   // def AppUsersService

    //def createEvent(activityType, caseId, study, bssCode, restEventId, initiator, additionalInfo1, additionalInfo2) {
        def createEvent(activityType, caseId, study, bssCode, initiator, additionalInfo1, additionalInfo2) {
        new ActivityEvent(
            activityType: activityType, 
            caseId: caseId, 
            study: study,
            bssCode: bssCode,
            //restEventId: restEventId, 
            initiator: initiator,
            additionalInfo1: additionalInfo1,
            additionalInfo2: additionalInfo2
        ).save(failOnError: false, flush: true)
        //sendEmail(activityType, caseId, study, bssCode, restEventId, initiator, additionalInfo1, additionalInfo2)
        sendEmail(activityType, caseId, study, bssCode, initiator, additionalInfo1, additionalInfo2)
    }
    
    //def sendEmail(activityType, caseId, study, bssCode, restEventId, initiator, additionalInfo1, additionalInfo2) {
        def sendEmail(activityType, caseId, study, bssCode, initiator, additionalInfo1, additionalInfo2) {
        def recipient
        def emailSubject
        def emailBody

        switch(activityType.code) {
            case "CASECREATE": 
               // recipient = AppSetting.findByCode('GTEX_CORE_UNACC_DISTRO')?.bigValue
               recipient = "pushpa.hariharan@nih.gov"
                emailSubject = "CDR Alert: ${caseId} Created"
               // emailBody = additionalInfo1
               emailBody = "pmh test message"
                break
                       
        }
        
       sendMailService.sendActivityEventEmail(recipient, emailSubject, emailBody)
    }
    
    def getEmailList(orgCodePayload) {
        def orgCode = BSS.findByCode(orgCodePayload) ? BSS.findByCode(orgCodePayload).parentBss?.code : orgCodePayload
       // def emailList = AppUsersService.getEmailList(orgCode)
         def emailList = 'pushpa.hariharan@nih.gov'
        def result = ''
        
        for (i in emailList) {
            result = result + ',' + i    
        }
        if (result && result.length() > 0) {
            result = result.substring(1)
        }
        
        return result
    }
}
