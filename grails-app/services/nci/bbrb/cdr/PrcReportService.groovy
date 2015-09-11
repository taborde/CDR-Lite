package nci.bbrb.cdr

import grails.transaction.Transactional
import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.prc.*
import nci.bbrb.cdr.staticmembers.*

@Transactional
class PrcReportService {
    
    
     def getPrcCaseMaps(caseList){
         
        def result=[]
        def status_map=[:]
        def gender_map=[:]
        def bod_map=[:]
        def cross_clamp_map=[:]
        def death_map=[:]
        def specimen_count_map=[:]
        def specimen_fzn_count_map=[:]
        def issue_count_map=[:]
        def unr_issue_count_map=[:]
        def unr_issue_qc_count_map=[:]
        def matched_seq_map=[:]
        def hasqc_map=[:]
        def prc_report_map=[:]
        def prc_report_fzn_map=[:]
        def cod_map=[:]
        def has_fzn_map=[:]
        def req_map=[:]
        def feedback_map=[:]
        def feedback_fzn_map=[:]
        def to_be_shipped_map=[:]
        def received_map=[:]
           
        def status_result=CaseRecord.executeQuery("select c.id, caseStatus from CaseRecord c where c in (:list)", [list: caseList])
        status_result.each(){
            status_map.put(it[0], it[1])             
        }
           
      /**  def gender_result=CaseReportForm.executeQuery("select crf.caseRecord.id, crf.demographics.gender, crf.demographics.otherGender, crf.demographics.dateOfBirth from CaseReportForm crf  where  crf.caseRecord in (:list)", [list: caseList])
           
           
        gender_result.each(){
            if(it[1]== 'Other'){
                gender_map.put(it[0], it[2])
            }else{
                gender_map.put(it[0], it[1]) 
            }
            bod_map.put(it[0], it[3])
  
        }
           
        def  cross_clamp_result=TissueRecoveryGtex.executeQuery("select trf.caseRecord.id, trf.collectionDate, trf.collectionStartTime, trf.crossClampTime from TissueRecoveryGtex trf  where trf.caseRecord in (:list)", [list: caseList])
        cross_clamp_result.each(){
            def collectionDate = it[1]
            def startTime=it[2]
            def collectionStartTime = ldaccService.calculateDateWithTime(collectionDate,startTime)
            def cross_clamp_time = it[3]
            def crossClampDateTime = ldaccService.getDateTimeComp(collectionStartTime, cross_clamp_time)
            cross_clamp_map.put(it[0], crossClampDateTime)              
        }
           
        def death_result=  CaseReportForm.executeQuery("select crf.caseRecord.id, crf.deathCircumstances.dateTimeActualDeath, crf.deathCircumstances.dateTimePresumedDeath, crf.deathCircumstances.immediateCause, crf.deathCircumstances.otherImmediate from CaseReportForm crf  where crf.caseRecord.caseCollectionType.code in ('POSTM', 'OPO') and crf.caseRecord in (:list)", [list: caseList])
          
        death_result.each(){
            if(it[1]){
                death_map.put(it[0], it[1])
            }else{
                death_map.put(it[0], it[2])
            }
               
            if(it[3]=='Other'){
                cod_map.put(it[0], it[4])
            }else{
                cod_map.put(it[0], it[3])
            }
        }
 
        def surgi_result= CaseRecord.executeQuery("select c.id  from CaseRecord c where c.caseCollectionType.code= 'SURGI' and c in (:list)", [list: caseList])  
        surgi_result.each(){
            def cc = cross_clamp_map.get(it)
            if(cc){
                death_map.put(it, cc)
            }
        }**/
    
          
        
        def specimen_count_result = SpecimenRecord.executeQuery("select s.caseRecord.id, count(distinct s) from SpecimenRecord s inner join s.slides sl inner join sl.imageRecord i  where  s.caseRecord in (:list)  group by s.caseRecord.id", [list: caseList])
        specimen_count_result.each{
            specimen_count_map.put(it[0], it[1])
        } 
           
      /**  def specimen_fzn_count_result = SpecimenRecord.executeQuery("select s.caseRecord.id, count(distinct s) from SpecimenRecord s inner join s.slides sl inner join sl.imageRecord i  where s.caseRecord in (:list) and s.fixative.code='DICE' group by s.caseRecord.id", [list: caseList])
        specimen_fzn_count_result.each{
            specimen_fzn_count_map.put(it[0], it[1])
        }      
        
        
        def issue_count_result= PrcIssue.executeQuery("select caseRecord.id, count(*) from PrcIssue  where caseRecord  in (:list) and (forQc is null or forQc = false) and (forFzn is null or forFzn = false) group by caseRecord.id", [list: caseList])
        issue_count_result.each{
            issue_count_map.put(it[0], it[1])
        }
        
        def unr_issue_count_result=PrcIssue.executeQuery("select caseRecord.id, count(*) from PrcIssue  where caseRecord  in (:list) and (forQc is null or forQc = false)  and (forFzn is null or forFzn = false)  and (resolved is null or resolved='P' or  resolved='N') group by caseRecord.id", [list: caseList])
        unr_issue_count_result.each(){
            unr_issue_count_map.put(it[0], it[1])
        }
           
        def unr_issue_qc_count_result=PrcIssue.executeQuery("select caseRecord.id, count(*) from PrcIssue pi where caseRecord in (:list) and forQc = true and (pi.resolved is null or pi.resolved='P' or  pi.resolved='N') group by caseRecord.id", [list: caseList])
        unr_issue_qc_count_result.each(){
            unr_issue_qc_count_map.put(it[0], it[1])
        }**/
        
        def prc_report_result = PrcReport.executeQuery("select p.caseRecord.id, p from PrcReport p where p.caseRecord in (:list)", [list: caseList])
        prc_report_result.each(){
            prc_report_map.put(it[0], it[1])
        }
           
       /** def prc_report_fzn_result = PrcReport.executeQuery("select p.caseRecord.id, p from PrcReportFzn p where p.caseRecord in (:list)", [list: caseList])
        prc_report_fzn_result.each(){
            prc_report_fzn_map.put(it[0], it[1])
        }
           
        def has_fzn_result= SpecimenRecord.executeQuery("select s.caseRecord.id, count(*) from SpecimenRecord s  where s.caseRecord in (:list)  and s.fixative.code='DICE' group by s.caseRecord.id ", [list: caseList])
        has_fzn_result.each(){
            has_fzn_map.put(it[0], it[1])
        }
          
        def req_result= Query.executeQuery("select q.caseRecord.id, count(*) from Query q  where q.caseRecord  in (:list) and task = 'FZN' group by q.caseRecord.id", [list: caseList])
        req_result.each(){
            req_map.put(it[0], it[1])
        }
          
        def feedback_reuslt = Feedback.executeQuery("select f.caseRecord.id, f from Feedback f where f.caseRecord in (:list)", [list: caseList])
        feedback_reuslt.each(){
            feedback_map.put(it[0], it[1])
        }
        def feedback_fzn_reuslt = Feedback.executeQuery("select f.caseRecord.id, f from FeedbackFzn f where f.caseRecord in (:list)", [list: caseList])
        feedback_fzn_reuslt.each(){
            feedback_fzn_map.put(it[0], it[1])
        }
        
        def to_be_shipped_result= SpecimenRecord.executeQuery("select s.caseRecord.id,  count(distinct s.id) from SpecimenRecord s  where s.caseRecord in (:list) and s.fixative.code='DICE'  group by s.caseRecord.id", [list: caseList])
        to_be_shipped_result.each(){
            to_be_shipped_map.put(it[0], it[1])
        }
        def received_result = ShippingEvent.executeQuery("select s.caseRecord.id, count(distinct s.id) from ShippingEvent sh inner join sh.specimens s where s.caseRecord in (:list) and s.fixative.code='DICE' and sh.recipient='VARI' and sh.shippingContentType.code='TISSUE' and sh.shippingEventType.code='USED' and sh.receiptDateTime is not null and sh.receivingUser is not null group by s.caseRecord.id", [list: caseList])
        received_result.each(){
            received_map.put(it[0], it[1])
        }  **/
        
        caseList.each{
            def map = [:]
            
            def id = it.id
            map.put("id", id)
            map.put("caseId", it.caseId)
            def caseStatus =  status_map.get(id)
            
            map.put("status", caseStatus)
            map.put("statusdesc", caseStatus.description)
           /** def gender=gender_map.get(id) 
            map.put("gender", gender?gender:'&nbsp;')
           
            
          
                               
            def deathDate = death_map.get(id)
            def birthDate = bod_map.get(id)
            def age =ldaccService.calculateAge(deathDate, birthDate)
            map.put("age", age?age:'&nbsp;') 
            def causeOfDeath= cod_map.get(id)
            map.put("causeOfDeath", causeOfDeath?causeOfDeath:'&nbsp;')**/
            def specimenCount =   specimen_count_map.get(id)
            if(!specimenCount)
            map.put("specimenCount", "--")
            else
            map.put("specimenCount", specimenCount)
            
            def prcReport = prc_report_map.get(id) 
            def issueTotal="&nbsp;"
            int unresolvedCount
            int unresolvedCount4Qc=0
            String qcFlag = 'white'
           /** if(prcReport){
                if (issue_count_map?.get(id)) issueTotal = issue_count_map.get(id)
                else issueTotal = 0
                 
                if (unr_issue_count_map?.get(id)) unresolvedCount=unr_issue_count_map.get(id) 
                else unresolvedCount = 0
                 
                if (unr_issue_qc_count_map?.get(id)) unresolvedCount4Qc = unr_issue_qc_count_map.get(id)
                else unresolvedCount4Qc = 0
                 
                if(prcReport.hasQcIssue=='Yes'){
                    if(unresolvedCount4Qc > 0){
                        qcFlag='red'
                    }else{
                        qcFlag='green'
                    }
                }else if(prcReport.matchedSeq !=null  && !prcReport.hasQcIssue){
                    qcFlag='black'
                }else if(prcReport.hasQcIssue=='No'){
                    qcFlag='green'
                }else{
                         
                }
            }
               
             
              
            def status="&nbsp;"
            if(unresolvedCount == 1){
                status = '1 issue'
            }
            if(unresolvedCount > 1){
                status = Integer.toString(unresolvedCount) + " issues"
            }
            map.put("issueTotal", issueTotal)
            map.put("unresolvedCount", status)
            map.put("prcReport", prcReport)
            map.put("qcFlag", qcFlag)**/
             
          
             
           
             map.put("prcReport", prcReport)
           
             result.add(map)
        
        }
         
        return result
    }

    
    
    def createReport(prcReportInstance) { 
        try{
            def caseRecord = prcReportInstance.caseRecord
            prcReportInstance.status='Editing'
            
            def  slides= SpecimenRecord.executeQuery("select distinct  sl from SpecimenRecord s inner join s.slides sl inner join sl.imageRecord i  where s.caseRecord.id=?   and sl not in (select pr.slideRecord from PrcReview pr)", [caseRecord.id])
            
            slides.each(){
                def prcReview = new PrcReview()
                prcReview.slideRecord = it
                prcReview.acceptability=PrcAcceptability.findByCode('ACCP')
              
                prcReview.save(failOnError:true)
              
            }

            prcReportInstance.save(failOnError:true)
        } catch(Exception e) {
            throw new RuntimeException(e.toString())
        }
    }
  
    
    def getPrcReviewList4Edit(prcReportInstance) { 
        try{
            def result=[]
            def caseRecord = prcReportInstance.caseRecord
           
            
            result = PrcReview.executeQuery("select pr from PrcReview pr inner join pr.slideRecord sl inner join sl.specimenRecord s where s.caseRecord.id=? order by s.specimenId", [caseRecord.id])
            // println("case record: " + caseRecord.caseId)
            //def speciments= SpecimenRecord.executeQuery("select distinct s from SpecimenRecord s inner join s.slides where s.caseRecord.id=? and s not in (select ps.specimenRecord from PrcSpecimen ps) order by s.specimenId", [caseRecord.id])
           
            
            //add new prcSpecimen in case vari loaded slide ship more than once
            def slides= SlideRecord.executeQuery("select sl from SlideRecord sl inner join sl.imageRecord i  where sl.specimenRecord.caseRecord.id=? and sl not in (select slideRecord from PrcReview)  order by sl.specimenRecord.specimenId", [caseRecord.id])
            
            slides.each(){
                def prcReview = new PrcReview()
                prcReview.slideRecord = it
                 prcReview.acceptability=PrcAcceptability.findByCode('ACCP')
                prcReview.save(failOnError:true)
                result.add(prcReview)
              
            }
                
         
            return result
       
        }catch(Exception e){
            e.printStackTrace()
           
            throw new RuntimeException(e.toString())
        }
        

    }
    
    
     def getPrcReviewList(prcReportInstance) { 
        try{
            def result=[]
            def caseRecord = prcReportInstance.caseRecord
           
            
            result = PrcReview.executeQuery("select pr from PrcReview pr inner join pr.slideRecord sl inner join sl.specimenRecord s where s.caseRecord.id=? order by s.specimenId", [caseRecord.id])
            
            return result
       
        }catch(Exception e){
            e.printStackTrace()
           
            throw new RuntimeException(e.toString())
        }
        

    }
    
    
    
    def saveReport(prcReportInstance, params, request){
        try{
          
            
          
          
            prcReportInstance.save(failOnError:true)
            
          
          
            params.each(){key,value->
               
                def ps_id
                if(key.startsWith('is_pr_id')){
                   
                    def prcReview = PrcReview.get(value)
                    prcReview.autolysis=params["${value}_autolysis"]
                    prcReview.comments=params["${value}_comments"]
                    
                    def accpName =params["${value}_accp"]
                    //  println("inventoryStatusName: " + inventoryStatusName)
                    def prcAcceptability = PrcAcceptability.findByName(accpName)
                    prcReview.acceptability = prcAcceptability
   
                    prcReview.save(failOnError:true)
            
                }
            }
            
     
            
            
        }catch(Exception e){
            e.printStackTrace()
           
            throw new RuntimeException(e.toString())
        }
    }
    
    
                     
     def submitReport(prcReportInstance, username) {   
         
        println("in submit report")
        if(prcReportInstance)
          println("not null")
        try {
            prcReportInstance.submittedBy=username
            prcReportInstance.dateSubmitted= new Date()
             prcReportInstance.status = "Submitted"
            prcReportInstance.save(failOnError:true)
            
            
           //activityEventService.createEvent(activityType, caseId, study, bssCode, null, username, null, null)
        } catch (Exception e) {
            e.printStackTrace()    
            throw new RuntimeException(e.toString())
        }
    }
    
    def startNew(prcReportInstance){
        try{
            prcReportInstance.status = 'Editing'
            prcReportInstance.dateSubmitted=null
            prcReportInstance.submittedBy = null
           
        }catch(Exception e){
             
            throw new RuntimeException(e.toString())
        }
        
    }
    
}
