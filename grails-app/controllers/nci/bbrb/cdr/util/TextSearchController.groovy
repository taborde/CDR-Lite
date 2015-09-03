package nci.bbrb.cdr.util

import nci.bbrb.cdr.datarecords.*

import nci.bbrb.cdr.staticmembers.*


import org.apache.commons.logging.LogFactory


class TextSearchController {
    def textSearchService
    
    private static final log = LogFactory.getLog(this)

    
    def searchhome={
        
    }
    
   
    def search = {
        if(params.query){
          
            def query = params.query
            def offset = params.offset
            // println("offset: " + offset)
            if(!offset)
            offset=0
                 
            //def q="+" + params.query
            def q= "(" + params.query + ")"
            def q2='';
            def q3=' (studyCode:BPS)'
            // println("code: " + session.org.code)
          
              def bss = BSS.findByCode(session.org.code)
              if(bss){
                  q2="(BSSCode:" + bss.code + ")"
              }

            // println("query string: " + q + q2)
           
            def size=0
            def count = 0
            def caseRecordInstanceList=[]
            
            try{
                def map  = CaseRecord.search(
                    q + q2 + q3,
                    [offset:offset, max:25, sort:"CaseRecord.caseId", order:"desc"]
         
                )
              
          
               
               
                count = map.total
                // println "There are ${count} hits for query ${params.query}" 
                 
                
           
              
                caseRecordInstanceList = map.results
          
            
                if( caseRecordInstanceList){
                    size=caseRecordInstanceList.size()
                }
            
                
                  caseRecordInstanceList = map.results
            
            
                if( caseRecordInstanceList){
                    size=caseRecordInstanceList.size()
                }
            
       
            
                def list = []
                for(cd in caseRecordInstanceList){
                    list.add(cd.id)
                }
        
            
                def listDB =[]
                if(list){
                    listDB=CaseRecord.getAll(list)
                }
            
                    
                def specimenCount=[:]
                if(listDB){
                    def count_result = SpecimenRecord.executeQuery("select c.id, count(*) from SpecimenRecord s inner join s.caseRecord c where c in (:list) group by c.id",  [list: listDB])

                    count_result.each(){
                        specimenCount.put(it[0], it[1])

                    }
                }
         
                // [caseRecordInstanceList:listDB, total:count, query:query, size:size]*/
            
                
               //  println("size:  " + size)
                [caseRecordInstanceList:listDB, specimenCount:specimenCount, total:count, query:query, size:size, msg:""]
                
                
             //  
               // [caseRecordInstanceList:caseRecordInstanceList, total:count, query:query, size:size, msg:""]    
            }catch (Exception e){
                //def msg=e.toString()
                def msg="Wrong Search Criteria."
                log.error((new Date()).toString() + " " + e.toString())
                [caseRecordInstanceList:caseRecordInstanceList, total:count, query:query, size:size, msg:msg]
            }
            
        //  render "done"
            
           
         
        }
    }
    
    
    
      def index_all = {
        textSearchService.index_all()
        render("bulk index started in a background thread.")
    } 

    
   
}
