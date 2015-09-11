<%@ page import="nci.bbrb.cdr.prc.PrcReport" %>
<%@ page import="nci.bbrb.cdr.util.AppSetting" %>
<!DOCTYPE html>
<html>
	 <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'prcReport.label', default: 'PrcReport')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
         <g:javascript>
         
          
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
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			 
                        <g:hasErrors bean="${prcReportInstance}">
                        <div class="errors">
                           <g:renderErrors bean="${prcReportInstance}" as="list" />
                          </div>
                         </g:hasErrors>
                        
			<g:form url="[resource:prcReportInstance, action:'startnew']" method="POST" >
                           
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
                         <td> ${pr.confirmTissueType}</td>
                         <td  >${pr?.tissueCategory?.name}
                        <td  nowrap="nowrap">
                          <div>
                              ${pr.autolysis}
                           
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
                            <td> ${pr.numPieces}</td>
                        <td colspan="2" class="value ${errorMap.get(pr.id +'_comments')}" >
                          ${pr.comments}
                         </td>
                        <td colspan="1" >${pr?.acceptability?.name}
                          
                          </td>
                         
                         <td colspan="2" class="value ${errorMap.get(pr.id +'_issue_desc')}" >
                          ${pr.issueDesc}
                         </td>
                        <td colspan="2" class="value ${errorMap.get(pr.id +'_issue_status')}" >
                          ${pr?.issueStatus}
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
                  
                  
                   <g:if test="${prcReportInstance.status == 'Submitted'}">
                   <g:if test="${session.authorities.contains('ROLE_PRC') || session.getAttribute('PRC')}">
                      <div class="buttons">
                       
                        <span class="button"><g:actionSubmit class="save" action="startnew" value="Start Next Version"  onclick="return confirm('Are you sure you want to create a new version of the PRC Report?')" /></span>
                            

                      </div>
                     
                   </g:if>
                  </g:if>
                  
                   
                  
			</g:form>
		</div>
	</body>
</html>
