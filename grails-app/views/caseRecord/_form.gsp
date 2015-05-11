<%@ page import="nci.bbrb.cdr.datarecords.CaseRecord" %>


<%--
<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'internalComments', 'error')} ">
	<label for="internalComments">
		<g:message code="caseRecord.internalComments.label" default="Internal Comments" />
		
	</label>
	<g:textArea name="internalComments" cols="40" rows="5" maxlength="4000" value="${caseRecordInstance?.internalComments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'publicComments', 'error')} ">
	<label for="publicComments">
		<g:message code="caseRecord.publicComments.label" default="Public Comments" />
		
	</label>
	<g:textArea name="publicComments" cols="40" rows="5" maxlength="4000" value="${caseRecordInstance?.publicComments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'internalGUID', 'error')} required">
	<label for="internalGUID">
		<g:message code="caseRecord.internalGUID.label" default="Internal GUID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="internalGUID" required="" value="${caseRecordInstance?.internalGUID}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'publicVersion', 'error')} required">
	<label for="publicVersion">
		<g:message code="caseRecord.publicVersion.label" default="Public Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="publicVersion" value="${fieldValue(bean: caseRecordInstance, field: 'publicVersion')}" required=""/>

</div>
--%>
<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'bss', 'error')} required">
	<label for="bss">
		<g:message code="caseRecord.bss.label" default="Bss" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bss" name="bss.id" from="${nci.bbrb.cdr.staticmembers.BSS.list()}" optionKey="id" required="" value="${caseRecordInstance?.bss?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'candidateRecord', 'error')} required">
	<label for="candidateRecord">
		<g:message code="caseRecord.candidateRecord.label" default="Candidate Record" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="candidateRecord" name="candidateRecord.id" from="${nci.bbrb.cdr.datarecords.CandidateRecord.list()}" optionKey="id" required="" value="${caseRecordInstance?.candidateRecord?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'caseId', 'error')} required">
	<label for="caseId">
		<g:message code="caseRecord.caseId.label" default="Case Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="caseId" required="" value="${caseRecordInstance?.caseId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'caseStatus', 'error')} required">
	<label for="caseStatus">
		<g:message code="caseRecord.caseStatus.label" default="Case Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="caseStatus" name="caseStatus.id" from="${nci.bbrb.cdr.staticmembers.CaseStatus.list()}" optionKey="id" required="" value="${caseRecordInstance?.caseStatus?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'collectionType', 'error')} required">
	<label for="collectionType">
		<g:message code="caseRecord.collectionType.label" default="Collection Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="collectionType" name="collectionType.id" from="${nci.bbrb.cdr.staticmembers.CollectionType.list()}" optionKey="id" required="" value="${caseRecordInstance?.collectionType?.id}" class="many-to-one"/>

</div>



<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'specimens', 'error')} ">
	<label for="specimens">
		<g:message code="caseRecord.specimens.label" default="Specimens" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${caseRecordInstance?.specimens?}" var="s">
    <li><g:link controller="specimenRecord" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="specimenRecord" action="create" params="['caseRecord.id': caseRecordInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'specimenRecord.label', default: 'SpecimenRecord')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: caseRecordInstance, field: 'tissueBankId', 'error')} required">
	<label for="tissueBankId">
		<g:message code="caseRecord.tissueBankId.label" default="Tissue Bank Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tissueBankId" required="" value="${caseRecordInstance?.tissueBankId}"/>

</div>

