<%@ page import="nci.bbrb.cdr.datarecords.CandidateRecord" %>
<%@ page import="nci.bbrb.cdr.datarecords.CandidateRecord" %>


<div class="dialog">
    <table>
        <tbody>

            
        <tr class="prop">
            <td valign="top" class="name">
                <label for="bss"><g:message code="candidateRecord.bss.label" default="Bss" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: candidateRecordInstance, field: 'bss', 'error')}">
                <g:select id="bss" name="bss.id" from="${nci.bbrb.cdr.staticmembers.BSS.list()}" optionKey="id" required="" value="${candidateRecordInstance?.bss?.id}" class="many-to-one"/>

            </td>
        </tr>

        <g:if test="${params.action != 'create'}">
        <tr class="prop">
            <td valign="top" class="name">
                <label for="candidateId"><g:message code="candidateRecord.candidateId.label" default="Candidate Id" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: candidateRecordInstance, field: 'candidateId', 'error')}">
                <g:textField name="candidateId" required="" value="${candidateRecordInstance?.candidateId}"/>

            </td>
        </tr>
       
        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="caseList"><g:message code="candidateRecord.caseList.label" default="Case List" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: candidateRecordInstance, field: 'caseList', 'error')}">
                
<ul class="one-to-many">
<g:each in="${candidateRecordInstance?.caseList}" var="c">
    <li><g:link controller="caseRecord" action="show" id="${c.id}">${c?.caseId}</g:link></li>
</g:each>
<li class="add">
<g:if test="${candidateRecordInstance?.caseList}">
<g:link controller="caseRecord" action="create" params="['candidateRecord.id': candidateRecordInstance?.id]" onclick="return confirm('There are cases for this candidate, are you sure that you want to add another case?');">${message(code: 'default.add.label', args: [message(code: 'caseRecord.label', default: 'CaseRecord')])}</g:link>
</g:if>
<g:else>
    <g:link controller="caseRecord" action="create" params="['candidateRecord.id': candidateRecordInstance?.id]" >${message(code: 'default.add.label', args: [message(code: 'caseRecord.label', default: 'CaseRecord')])}</g:link>
</g:else>
</li>
</ul>


            </td>
        </tr>

       
        
        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="study"><g:message code="candidateRecord.study.label" default="Study" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: candidateRecordInstance, field: 'study', 'error')}">
                ${candidateRecordInstance?.study?.code}

            </td>
        </tr>

          </g:if>
        

        </tbody>
    </table>
</div>  
