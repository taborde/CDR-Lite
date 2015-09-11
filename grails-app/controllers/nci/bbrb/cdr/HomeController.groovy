package nci.bbrb.cdr
import nci.bbrb.cdr.staticmembers.*
import nci.bbrb.cdr.datarecords.*
import nci.bbrb.cdr.util.*
import nci.bbrb.cdr.study.*
import nci.bbrb.cdr.util.querytracker.Query

/* created by: pmh 05/12/15*/


class HomeController {
 
    def prcReportService

 String maxView ='10'
    
     def choosehome = {
        
     
    }
    
    def homedispatcher = {      
     
        def bss = BSS.findByCode(session.org?.code)
        
        if(bss){
            redirect(action: "bsshome")
        }else if(session.chosenHome=="projecthome"){
            
              redirect(action: "projecthome")
         
        }else if(session.chosenHome=="prchome"){
              redirect(action: "prchome")
        }else {
            redirect(action: "choosehome")
        }
    }
   
    def projecthome={
        session.chosenHome="projecthome"
        def candidateList = CandidateRecord.findAllByStudy(Study.findByCode('BPS'), [max:maxView])
  
       // def caseList = CaseRecord.findAllByStudy(Study.findByCode('BPVLIKE'), [max:maxView])
       
        def caseList = CaseRecord.executeQuery("from CaseRecord c where c.candidateRecord.study.code= 'BPS'", [max:maxView])
        
        def specimenCount=[:]
        if(caseList){
             def count_result = SpecimenRecord.executeQuery("select c.id, count(*) from SpecimenRecord s inner join s.caseRecord c where c in (:list) group by c.id",  [list: caseList])
            count_result.each(){
                specimenCount.put(it[0], it[1])
             
            }
        }
        
        def queryCount = getQueryCountMap(caseList)
        def queryCountCandidate = getQueryCountMapCandidate(candidateList)
        
        return [caseRecordInstanceList:caseList, candidateRecordInstanceList:candidateList, specimenCount:specimenCount, queryCount:queryCount, queryCountCandidate:queryCountCandidate]
    }
    
    
    def prchome={
       session.chosenHome="prchome" 
        def caseList=[]
        def all = CaseRecord.findAllByStudyAndCaseStatusNotEqual(Study.findByCode('BPS'),CaseStatus.findByCode('WITHDR'),[max:25])
        
        caseList = prcReportService.getPrcCaseMaps(all)
        return [caseList:caseList]
     
    }
    
    def generic={
        def  title = "Activity Center"
        def    bodyclass = "recentactivity"
        def   navigation = "/cdrlite;home;Home"
        def   divs = "recentactivity"
        def   h1studysession = true
        return[title:title,bodyclass:bodyclass,navigation:navigation,divs:divs,h1studysession:h1studysession]
    }
    
    def opshome = {
        
        session.setAttribute("chosenHome", new String("OPS"))
        
    }
    
    
    def bsshome={
        
        def bss = BSS.findByCode(session.org?.code)
        def candidateList = CandidateRecord.findAllByStudyAndBss(Study.findByCode('BPS'), bss, [max:maxView])
  
       // def caseList = CaseRecord.findAllByStudy(Study.findByCode('BPVLIKE'), [max:maxView])
       
        def caseList = CaseRecord.findAllByStudyAndBss(Study.findByCode('BPS'), bss, [max:maxView])
        
        def specimenCount=[:]
        if(caseList){
             def count_result = SpecimenRecord.executeQuery("select c.id, count(*) from SpecimenRecord s inner join s.caseRecord c where c in (:list) group by c.id",  [list: caseList])
            count_result.each(){
                specimenCount.put(it[0], it[1])
             
            }
        }
        
        def queryCount = getQueryCountMap(caseList)
        def queryCountCandidate = getQueryCountMapCandidate(candidateList)
        
        return [caseRecordInstanceList:caseList, candidateRecordInstanceList:candidateList, specimenCount:specimenCount, queryCount:queryCount, queryCountCandidate: queryCountCandidate]
        
      
    }
    
    def getQueryCountMap(caseRecordInstanceList) {
        def queryCount = [:]
        if (caseRecordInstanceList) {
            
            def activeStatus = QueryStatus.findByCode("ACTIVE")
            def countResult
            if (session.org?.code == 'DCC') {
//                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.caseRecord c inner join i.queryStatus s where c in (:list) and s.id = :activeStatus group by c.id",  [list:caseRecordInstanceList, activeStatus:activeStatus.id])
                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.caseRecord c inner join i.queryStatus s where c in (:list) group by c.id",  [list:caseRecordInstanceList])
            } else {
//                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.caseRecord c inner join i.queryStatus s inner join i.organization o where c in (:list) and s.id = :activeStatus and o.code like :org group by c.id",  [list:caseRecordInstanceList, activeStatus:activeStatus.id, org:session.org?.code + "%"])
                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.caseRecord c inner join i.queryStatus s inner join i.organization o where c in (:list) and o.code like :org group by c.id",  [list:caseRecordInstanceList, org:session.org?.code + "%"])
            }
            countResult.each() {
                queryCount.put(it[0], it[1]) 
            }
        }
            
        return queryCount
    }
    
    def getQueryCountMapCandidate(candidateRecordInstanceList) {
        def queryCountCandidate = [:]
        if (candidateRecordInstanceList) {
            def activeStatus = QueryStatus.findByCode("ACTIVE")
            def countResult
            if (session.org?.code == 'DCC') {
//                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.candidateRecord c inner join i.queryStatus s where c in (:list) and s.id = :activeStatus group by c.id",  [list:candidateRecordInstanceList, activeStatus:activeStatus.id])
                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.candidateRecord c inner join i.queryStatus s where c in (:list) group by c.id",  [list:candidateRecordInstanceList])
            } else {
//                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.candidateRecord c inner join i.queryStatus s inner join i.organization o where c in (:list) and s.id = :activeStatus and o.code like :org group by c.id",  [list:candidateRecordInstanceList, activeStatus:activeStatus.id, org:session.org?.code + "%"])
                countResult= Query.executeQuery("select c.id, count(*) from Query i inner join i.candidateRecord c inner join i.queryStatus s inner join i.organization o where c in (:list) and o.code like :org group by c.id",  [list:candidateRecordInstanceList, org:session.org?.code + "%"])
            }
            countResult.each() {
                queryCountCandidate.put(it[0], it[1]) 
            }
        }

        return queryCountCandidate
    }
}
