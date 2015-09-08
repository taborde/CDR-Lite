<%@ page import="nci.bbrb.cdr.prc.PrcReport" %>
<!DOCTYPE html>
<html>
	 <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'prcReport.label', default: 'PrcReport')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
			<ul class="errors" role="alert">
				<g:eachError bean="${prcReportInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:prcReportInstance, action:'update']" method="POST" >
		  <h3>Specimens</h3>
                  <table>
                 
                    
                       <tr>
                         <th  style="border-bottom: 1px solid #ccc" colspan="3">Case #</th>
                         <td style="border-bottom: 1px solid #ccc; border-right: 1px solid #ccc" colspan="5">
                           <g:link controller="caseRecord" action="display" id="${prcReportInstance.caseRecord.id}">${prcReportInstance.caseRecord.caseId}</g:link>
                         </td>
                       </tr>
                   
                    <tr>
                        <th>Specimen ID</th>
                        <th>Slide ID</th>
                        <th>Image ID</th>
                        <th>Tissue</th>
                        <th>Confirm Tissue</th>
                      <th>Autolysis</th>
                      <th>Comments</th>
                      <th style="border-right: 1px solid #ccc"></th>
                    </tr>
                  <g:each in="${prcReviewList}" status="i" var="pr">
                  
                      
                      <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                     
                       
                        <td  nowrap="nowrap">${pr.slideRecord.specimenRecord.specimenId}</td>
                         <td  nowrap="nowrap">${pr.slideRecord.slideId}</td>
                         <td ><a href="javascript:openImageWin('${pr.slideRecord.imageRecord?.imageId}')">${pr.slideRecord.imageRecord?.imageId}</a></td>
                        <td >${pr.slideRecord.specimenRecord?.tissueType?.name}</td>
                         <td> <g:textField name="confirmTissueType"  value="${pr.confirmTissueType}"/></td>
                        
                        <td  nowrap="nowrap">
                          <div>
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a0"  value="0" checked="${pr.autolysis =='0'}"/><label for="${pr.id}_a0">0</label>&nbsp;&nbsp;&nbsp;
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a1"  value="1" checked="${pr.autolysis =='1'}"/><label for="${pr.id}_a1">1</label>&nbsp;&nbsp;&nbsp;
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a2"  value="2" checked="${pr.autolysis =='2'}"/><label for="${pr.id}_a2">2</label>&nbsp;&nbsp;&nbsp;
                            <g:radio name="${pr.id}_autolysis" id="${pr.id}_a3"  value="3" checked="${pr.autolysis =='3'}"/><label for="${pr.id}_a3">3</label>
                          </div>         
                                    
                        </td>
                        <td >
                          <g:textArea style="height:38px;width:250px;" name="${pr.id}_comments" value="${pr.comments}" />
                         </td>
                        <td style="border-right: 1px solid #ccc" ><g:select name="${pr.id}_accp" from="${nci.bbrb.cdr.staticmembers.PrcAcceptability.list(sort:'id')}" optionKey="name" value="${pr?.acceptability?.name}"   class="inv_status" id="accp_${pr.id}" />
                          
                          </td>
                        
                       
                     
                      </tr>
                      
                        
                    </g:each>
                     <tr>
                      <td colspan="9" style="border-top: 1px solid #ccc; border-right: 1px solid #ccc"> *Autolysis key: 0 = none &nbsp;&nbsp;  1 = mild &nbsp;&nbsp;  2 = moderate  &nbsp;&nbsp; 3 = severe</td>
                    </tr>
                   
                   </table>
                  
			</g:form>
		</div>
	</body>
</html>
