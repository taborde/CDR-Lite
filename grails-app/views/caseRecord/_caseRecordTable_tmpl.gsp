<table>
  <thead>
    <tr><th colspan="10">BPV Case List</th></tr>
    <tr>
  
  
  <g:sortableColumn property="caseId" title="${message(code: 'caseRecord.caseId.label', default: 'Case ID')}" />                          
  <g:sortableColumn property="primaryTissueType" title="${message(code: 'caseRecord.caseId.label', default: 'Primary Organ')}" />                                      
  <g:sortableColumn property="bss" title="${message(code: 'caseRecord.BSS.label', default: 'BSS')}" />
  <th>Candidate ID</th>
  <th class="specimencount">Specimens</th>                            
  <g:sortableColumn property="caseStatus" title="${message(code: 'caseRecord.dateCreated.label', default: 'Case Status')}" /> 
  <g:sortableColumn property="dateCreated" class="dateentry" title="${message(code: 'caseRecord.dateCreated.label', default: 'Date Created')}" />
   
</tr>
</thead>
<tbody>
<g:if test="${caseRecordInstanceList}">
  <g:each in="${caseRecordInstanceList}" status="i" var="caseRecordInstance">
    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
   
    <td>
    <a href="/cdrlite/caseRecord/show/${caseRecordInstance.id}">${caseRecordInstance.caseId}</a>
    </td>                    
    <td>${caseRecordInstance.primaryTissueType}</td>                    
    <td><span class="ca-tooltip-nobg" data-msg="<b>${caseRecordInstance.bss.name}</b>">${caseRecordInstance.bss}</span></td>
    <td><a href="/cahubdataservices/candidateRecord/view/${caseRecordInstance.candidateRecord?.id}">${caseRecordInstance.candidateRecord?.candidateId}</a></td>
    <td>
        
    </td>
    <td><span class="ca-tooltip-nobg home-case-status" data-msg="<b>${caseRecordInstance.caseStatus}</b>. ${caseRecordInstance.caseStatus.description}">${caseRecordInstance.caseStatus}</span>
    </td>
    
   
   
    <td><g:formatDate date="${caseRecordInstance.dateCreated}" /></td>
    </tr>
  </g:each></g:if>
<g:else><tr><td colspan="7">No cases exist</td></tr></g:else>
</tbody>
</table>

