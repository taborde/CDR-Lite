

 

<table>
   <thead>
     <tr><th colspan="11">BPS Case List</th></tr>
        <tr>
          <th>Case ID</th>                     
          <th>Case Status</th>  
          <th>Gender</th>
          <th>Age</th>
          <th class="specimencount">Specimens</th>
          <th>PRC Report</th>
        </tr>
   </thead><tbody>
      <g:if test="${caseList}">
         <g:each in="${caseList}" status="i" var="c">
             <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
             
                <td><g:link controller="caseRecord" action="display" id="${c.id}">${c.caseId}</g:link></td>
                <td><span class="ca-tooltip-nobg home-case-status" data-msg="<b>${c.status}</b>. ${c.statusdesc}">${c.status}</span></td>
                <td>${c.gender}</td>
                <td>${c.age}</td>
                <td>${c.specimenCount}</td>
            <g:if test="${(session.authorities.contains('ROLE_PRC') || session.getAttribute('PRC'))}">
              <g:if test ="${c.prcReport!= null && c.prcReport.status=='Editing'}">
                 <td><g:link controller="prcReport" action="edit" id="${c.prcReport.id}"><img height="13" width="13" border="0" src="/cdrlite/images/prc_edit1.png" title="Edit PRC report"/></g:link>&nbsp;<g:link controller="prcReport" action="view" id="${c.prcReport.id}"><img height="13" width="13" border="0" src="/cdrlite/images/prc_view1.png" title="View PRC report" /></g:link></td>
              </g:if>
             
               
              <g:elseif test ="${c.prcReport!= null && c.prcReport.status=='Submitted'}">
                  <td><g:link controller="prcReport" action="view" id="${c.prcReport.id}"><img height="13" width="13" border="0" src="/cdrlite/images/prc_view1.png" title="View PRC report" /></g:link></td> 
              </g:elseif>
              
              <g:elseif test="${c.prcReport== null && c.specimenCount != '--'}">
                 <td><a href="/cdrlite/prcReport/save?caseRecord.id=${c.id}"><img height="13" width="13" border="0" src="/cdrlite/images/prc_add2.png" title="Create PRC report" /></a></td>
               </g:elseif>
               <g:elseif test="${c.prcReport== null && c.specimenCount == '--'}">
                 <td><img height="13" width="13" border="0" src="/cdrlite/images/prc_add1.png" title="Create PRC report" /></td>
               </g:elseif>
              <g:else>
                <td>report</td>
              </g:else>
              
              </g:if>
             <g:else>
               <g:if test ="${c.prcReport!= null}">
                  <td><g:link controller="prcReport" action="view" id="${c.prcReport.id}"><img height="13" width="13" border="0" src="/cdrlite/images/prc_view1.png" title="View PRC report" /></g:link></td>
               </g:if>
               
               <g:else>
               <td>&nbsp;</td>
               </g:else>
               
             </g:else>
            </tr>
        </g:each>
      </g:if>
    </tbody>
</table>

