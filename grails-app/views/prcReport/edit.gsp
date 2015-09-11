<%@ page import="nci.bbrb.cdr.prc.PrcReport" %>
<%@ page import="nci.bbrb.cdr.util.AppSetting" %>
<!DOCTYPE html>
<html>
	 <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'prcReport.label', default: 'PrcReport')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript>
           $(document).ready(function(){
           $(":input").change(function(){
                  document.getElementById("changed").value = "Y"
                  //alert("Changed!")
                });
                
            $(".check_int").change(function(){
            var value= this.value
             if(!isNaN(value) && parseInt(Number(value)) == value){
               return true
             }else{
             
               alert ("number of pieces must be an integer")
               this.focus()
               return false
               }
                });  
        
            });
            
           function sub(){
            var changed = document.getElementById("changed").value
            if(changed == "Y"){
               alert("Please save the change!")
               return false
               }
            
          }
          
         
          function checkSave(){
           var result=true
          
            $('.check_int').each(function() { 
              var value=this.value
               if(!isNaN(value) && parseInt(Number(value)) == value){
               
             }else{
             
               alert ("number of pieces must be an integer")
               result= false
               }
            });
            
            return result
         }

         
          
          
            function openImageWin(image_id){
             // var w2=window.open('https://microscopy.vai.org/imageserver/@@/@'+image_id + '/view.apml', 'hub_aperio', 'location=1,status=1,scrollbars=1,resizable=1,width=965,height=700');
              var w2=window.open('${AppSetting.findByCode("APERIO_URL")?.value}'+image_id, 'hub_aperio', 'location=1,status=1,scrollbars=1,resizable=1,width=965,height=700');
              w2.focus();
           }
          
        </g:javascript>
    </head>
	<body>
		<div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                       </div>
                       </div>

		 <div id="container" class="clearfix">
			<h1>PRC Case Summary Report</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			 
                        <g:hasErrors bean="${prcReportInstance}">
                        <div class="errors">
                           <g:renderErrors bean="${prcReportInstance}" as="list" />
                          </div>
                         </g:hasErrors>
                        
			<g:form url="[resource:prcReportInstance, action:'update']" method="POST" >
                             <input type="hidden" name="changed" value="N" id="changed"/>
                             <g:each in="${prcReviewList}" status="i" var="pr">
                              <input type="hidden" name ="is_pr_id_${pr.id}" value="${pr.id}" />
                           </g:each>
		  <h3>Specimens</h3>
                  <table>
                 
                    
                       <tr>
                           <th  style="border-bottom: 1px solid #ccc" colspan="2">
                          Case ID
                           </th>
                         <th  style="border-bottom: 1px solid #ccc" colspan="5">
                          <g:link controller="caseRecord" action="display" id="${prcReportInstance.caseRecord.id}">${prcReportInstance.caseRecord.caseId}</g:link>
                           </th>
                       </tr>
                   
                   
                  
                  <g:each in="${prcReviewList}" status="i" var="pr">
                  
                       <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                           <td style="border-top: 1px solid #ccc" ><b>Specimen ID</b></td>
                           <td style="border-top: 1px solid #ccc" ><b>Slide ID</b></td>
                           <td style="border-top: 1px solid #ccc" ><b>Image ID</b></td>
                           <td style="border-top: 1px solid #ccc" ><b>Tissue</b></td>
                           <td style="border-top: 1px solid #ccc" ><b>Confirm Tissue</b></td>
                           <td style="border-top: 1px solid #ccc" ><b>Tissue Category</b></td>
                           <td style="border-top: 1px solid #ccc" ><b>Autolysis</b></td>
                     
                    </tr>
                      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                     
                       
                        <td  nowrap="nowrap">${pr.slideRecord.specimenRecord.specimenId}</td>
                         <td  nowrap="nowrap">${pr.slideRecord.slideId}</td>
                         <td ><a href="javascript:openImageWin('${pr.slideRecord.imageRecord?.imageId}')">${pr.slideRecord.imageRecord?.imageId}</a></td>
                        <td >${pr.slideRecord.specimenRecord?.tissueType?.name}</td>
                         <td> <g:textField name="${pr.id}_ctype"  value="${pr.confirmTissueType}"/></td>
                         <td  ><g:select name="${pr.id}_tcat" from="${nci.bbrb.cdr.staticmembers.TissueCategory.list(sort:'id')}" optionKey="name" value="${pr?.tissueCategory?.name}"   class="inv_status" id="tcat_${pr.id}" />
                        <td  nowrap="nowrap">
                          <div>
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a0"  value="0" checked="${pr.autolysis =='0'}"/><label for="${pr.id}_a0">0</label>&nbsp;&nbsp;&nbsp;
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a1"  value="1" checked="${pr.autolysis =='1'}"/><label for="${pr.id}_a1">1</label>&nbsp;&nbsp;&nbsp;
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a2"  value="2" checked="${pr.autolysis =='2'}"/><label for="${pr.id}_a2">2</label>&nbsp;&nbsp;&nbsp;
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a3"  value="3" checked="${pr.autolysis =='3'}"/><label for="${pr.id}_a3">3</label>
                          </div>         
                                    
                        </td>
                     
                        </tr>
                          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                              <td style="border-top: 1px solid #ccc"> <b>Number of Pieces</b></td>
                              <td style="border-top: 1px solid #ccc" colspan="2"><b>Comments</b></td>
                              <td style="border-top: 1px solid #ccc"  colspan="1"><b>Acceptability</b></td>
                              <td style="border-top: 1px solid #ccc"  colspan="2"><b>Issue Description</b></td>
                              <td style="border-top: 1px solid #ccc" colspan="2"><b>Issue Status</b></td>
                    </tr>
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td> <g:textField name="${pr.id}_piece"  value="${pr.numPieces}" size="4" class="check_int" /></td>
                        <td colspan="2" class="value ${errorMap.get(pr.id +'_comments')}" >
                          <g:textArea style="height:38px;width:220px;" name="${pr.id}_comments" value="${pr.comments}" />
                         </td>
                        <td colspan="1" ><g:select name="${pr.id}_accp" from="${nci.bbrb.cdr.staticmembers.PrcAcceptability.list(sort:'id')}" optionKey="name" value="${pr?.acceptability?.name}"   class="inv_status" id="accp_${pr.id}" />
                          
                          </td>
                         
                         <td colspan="2" class="value ${errorMap.get(pr.id +'_issue_desc')}" >
                          <g:textArea style="height:38px;width:220px;" name="${pr.id}_issue_desc" value="${pr.issueDesc}" />
                         </td>
                        <td colspan="2" class="value ${errorMap.get(pr.id +'_issue_status')}" >
                          <g:select name="${pr.id}_issue_status" from="${['Open', 'Pending', 'Resolved']}"  value="${pr?.issueStatus}" noSelection="['': '']"    class="inv_status" id="issue_status_${pr.id}" />
                         </td>
                     
                      </tr>
                      
                        
                    </g:each>
                     <tr>
                      <td colspan="7" style="border-top: 1px solid #ccc"> *Autolysis key: 0 = none &nbsp;&nbsp;  1 = mild &nbsp;&nbsp;  2 = moderate  &nbsp;&nbsp; 3 = severe</td>
                    </tr>
                   
                   </table>
                   
                    <h3>General Information</h3>
                  <table>
                    
                    <tr>
                    
                      <th colspan="2">Any additional comments from PRC</th>
                    </tr>
                     <tr>
                     
                      <td colspan="2"><g:textArea class="textwide" name="comments" value="${prcReportInstance.comments}" /></td>
                    </tr>
                    
                     
                    <g:if test="${prcReportInstance.submittedBy}">
                        <tr>
                      <th>Report Submitted By</th><th>Date Summary Report Submitted</th>
                    </tr>
                    <tr>
                      <td class="value">${prcReportInstance.submittedBy}</td>
                     
                      <td class="value"><g:formatDate format="MM/dd/yyyy" date="${prcReportInstance.dateSubmitted}"/></td>
                    </tr>
                    <tr>
                     </g:if>
                  </table>
                  
                   <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Save" onclick="return checkSave()" /></span>
                    
                    <g:if test="${canSub}">
                         <span class="button"><g:actionSubmit class="delete" action="submit" value="Submit"  onclick="return sub()" /></span>
                    </g:if>            
                </div>
                  
			</g:form>
		</div>
	</body>
</html>
