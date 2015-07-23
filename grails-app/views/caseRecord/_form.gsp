<%@ page import="nci.bbrb.cdr.datarecords.CaseRecord" %>


<div class="dialog">
    <table>
        <tbody>

            
        <tr class="prop">
            <td valign="top" class="name">
                <label for="bss"><g:message code="caseRecord.bss.label" default="Bss" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'bss', 'error')}">
                ${caseRecordInstance?.bss?.name}
                <input type='hidden' name="bss.id" value="${caseRecordInstance?.bss?.id}" />
               <%-- <g:select id="bss" name="bss.id" from="${nci.bbrb.cdr.staticmembers.BSS.list()}" optionKey="id" required="" value="${caseRecordInstance?.bss?.id}" class="many-to-one"/>--%>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="candidateRecord"><g:message code="caseRecord.candidateRecord.label" default="Candidate Record" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'candidateRecord', 'error')}">
               ${ caseRecordInstance?.candidateRecord?.candidateId}
               <input type='hidden' name="candidateRecord.id" value="${caseRecordInstance?.candidateRecord?.id}" />
                <%--<g:select id="candidateRecord" name="candidateRecord.id" from="${nci.bbrb.cdr.datarecords.CandidateRecord.list()}" optionKey="id" required="" value="${caseRecordInstance?.candidateRecord?.id}" class="many-to-one"/> --%>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="caseCollectionType"><g:message code="caseRecord.caseCollectionType.label" default="Case Collection Type" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'caseCollectionType', 'error')}">
                <g:select id="caseCollectionType" name="caseCollectionType.id" from="${nci.bbrb.cdr.staticmembers.CaseCollectionType.list()}" optionKey="id" required="" value="${caseRecordInstance?.caseCollectionType?.id}" class="many-to-one"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="caseId"><g:message code="caseRecord.caseId.label" default="Case Id" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'caseId', 'error')}">
                <g:textField name="caseId" required="" value="${caseRecordInstance?.caseId}"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="caseStatus"><g:message code="caseRecord.caseStatus.label" default="Case Status" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'caseStatus', 'error')}">
                <g:select id="caseStatus" name="caseStatus.id" from="${nci.bbrb.cdr.staticmembers.CaseStatus.list()}" optionKey="id" required="" value="${caseRecordInstance?.caseStatus?.id}" class="many-to-one"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="primaryTissueType"><g:message code="caseRecord.primaryTissueType.label" default="Primary Tissue Type" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'primaryTissueType', 'error')}">
                <g:select id="primaryTissueType" name="primaryTissueType.id" from="${nci.bbrb.cdr.staticmembers.TissueType.list()}" optionKey="id" required="" value="${caseRecordInstance?.primaryTissueType?.id}" class="many-to-one"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="specimens"><g:message code="caseRecord.specimens.label" default="Specimens" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'specimens', 'error')}">
                
<ul class="one-to-many">
<g:each in="${caseRecordInstance?.specimens?}" var="s">
    <li><g:link controller="specimenRecord" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="specimenRecord" action="create" params="['caseRecord.id': caseRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'specimenRecord.label', default: 'SpecimenRecord')])}</g:link>
</li>
</ul>


            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="study"><g:message code="caseRecord.study.label" default="Study" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: caseRecordInstance, field: 'study', 'error')}">
                ${caseRecordInstance?.study?.code}
                <input type='hidden' name="study.id" value="${caseRecordInstance?.study?.id}" />
               <%-- <g:select id="study" name="study.id" from="${nci.bbrb.cdr.staticmembers.Study.list()}" optionKey="id" required="" value="${caseRecordInstance?.study?.id}" class="many-to-one"/> --%>

            </td>
        </tr>

        
        

        </tbody>
    </table>
</div>  
