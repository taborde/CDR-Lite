
<table>
    <thead>
        <tr><th colspan="10">Candidate List</th></tr>
        <tr>
           
                <th>QT</th>
            
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
                
                    <td><g:if test="${queryCountCandidate.get(candidateRecordInstance.id)}"><a href="/cdrlite/query/listByCandidate?candidateRecord.id=${candidateRecordInstance.id}"><span class="no">${queryCountCandidate.get(candidateRecordInstance.id)}</span></a></g:if><g:else><span class="yes">0</span></g:else></td>
                
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