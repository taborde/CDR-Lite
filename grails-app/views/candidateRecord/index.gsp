
<%@ page import="nci.bbrb.cdr.datarecords.CandidateRecord" %>
<g:set var="bodyclass" value="gtexbsshome home" scope="request"/>
<!DOCTYPE html>
<html>
    <head>

        <meta name="layout" content="cahubTemplate">
        <g:set var="entityName" value="${message(code: 'candidateRecord.label', default: 'CandidateRecord')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                   <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                       </div>
                       </div>
                       <div id="container" class="clearfix"> 
                       <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>
                        <div class="list">
                       <table>
    <thead>
        <tr>
           
            <g:sortableColumn property="candidateId" title="${message(code: 'candidateRecord.candidateId.label', default: 'Candidate ID')}"/>
            <g:sortableColumn property="bss" title="${message(code: 'candidateRecord.BSS.label', default: 'BSS')}"/>
            <g:sortableColumn property="study.name" title="${message(code: 'candidateRecord.Study.label', default: 'Study')}"/>
           
            <th>Case ID</th>
            
            <th>Eligible?</th>
            <th>Consented?</th>
              
                 <g:sortableColumn property="dateCreated" class="dateentry" title="${message(code: 'candidateRecord.lastUpdated.label', default: 'Date Created')}"/>
                         
        </tr>
    </thead>
    <tbody>
      <g:if test="${candidateRecordInstanceList}">
        <g:each in="${candidateRecordInstanceList}" status="i" var="candidateRecordInstance">
          
          
           
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                
                <td class="candidate-id">
                    
                      <a href="/cdrlite/candidateRecord/show/${candidateRecordInstance.id}">${candidateRecordInstance.candidateId}</a> 
                    
                </td>
                <td><span class="ca-tooltip-nobg" data-msg="<b>${candidateRecordInstance.bss.name}</b>">${candidateRecordInstance.bss}</span></td>
                <td>${fieldValue(bean: candidateRecordInstance, field: "study.name")}</td>
                <td>
                   <g:if test="${candidateRecordInstance.caseList}">
                         <g:each in="${candidateRecordInstance.caseList}" status="j" var="caseRecord">
                            <g:if test="${j==0}"> 
                            <a href="/cdrlite/caseRecord/show/${caseRecord.id}"> ${caseRecord.caseId}</a>
                            </g:if>
                            <g:else>
                               <br/> <a href="/cdrlite/caseRecord/show/${caseRecord.id}"> ${caseRecord.caseId}</a>
                            </g:else>
                         </g:each>
                       
                   </g:if>
                </td>
               
               
                <td>
                    <g:if test="${candidateRecordInstance.isEligible}"><span class="yes">Yes</span></g:if>
                    <g:else><span class="no">No</span></g:else>
                </td>
                <td>
                    <g:if test="${candidateRecordInstance.isConsented}"><span class="yes">Yes</span></g:if>
                    <g:else><span class="no">No</span></g:else>
                </td>
                <td style="white-space:nowrap"><g:formatDate date="${candidateRecordInstance.dateCreated}" /></td>
            </tr>
        </g:each>
      </g:if>
      <g:else>
            <tr><td colspan="10">No candidates exist</td></tr>
      </g:else>
    </tbody>
</table>
                    </div>
                    <div class="paginateButtons">
                        <g:paginate total="${candidateRecordInstanceCount ?: 0}" /> | Total: ${candidateRecordInstanceCount}
                    </div>
            </div>
    </body>
</html>
