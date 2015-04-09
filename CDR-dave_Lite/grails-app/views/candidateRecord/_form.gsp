<%@ page import="nci.bbrb.cdr.datarecords.CandidateRecord" %>



<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'internalComments', 'error')} ">
	<label for="internalComments">
		<g:message code="candidateRecord.internalComments.label" default="Internal Comments" />
		
	</label>
	<g:textArea name="internalComments" cols="40" rows="5" maxlength="4000" value="${candidateRecordInstance?.internalComments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'publicComments', 'error')} ">
	<label for="publicComments">
		<g:message code="candidateRecord.publicComments.label" default="Public Comments" />
		
	</label>
	<g:textArea name="publicComments" cols="40" rows="5" maxlength="4000" value="${candidateRecordInstance?.publicComments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'bss', 'error')} required">
	<label for="bss">
		<g:message code="candidateRecord.bss.label" default="Bss" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bss" name="bss.id" from="${nci.bbrb.cdr.staticmembers.BSS.list()}" optionKey="id" required="" value="${candidateRecordInstance?.bss?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'candidateId', 'error')} required">
	<label for="candidateId">
		<g:message code="candidateRecord.candidateId.label" default="Candidate Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="candidateId" required="" value="${candidateRecordInstance?.candidateId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'caseRecord', 'error')} required">
	<label for="caseRecord">
		<g:message code="candidateRecord.caseRecord.label" default="Case Record" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="caseRecord" name="caseRecord.id" from="${nci.bbrb.cdr.datarecords.CaseRecord.list()}" optionKey="id" required="" value="${candidateRecordInstance?.caseRecord?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'collectionType', 'error')} required">
	<label for="collectionType">
		<g:message code="candidateRecord.collectionType.label" default="Collection Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="collectionType" name="collectionType.id" from="${nci.bbrb.cdr.staticmembers.CollectionType.list()}" optionKey="id" required="" value="${candidateRecordInstance?.collectionType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'internalGUID', 'error')} required">
	<label for="internalGUID">
		<g:message code="candidateRecord.internalGUID.label" default="Internal GUID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="internalGUID" required="" value="${candidateRecordInstance?.internalGUID}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'isConsented', 'error')} ">
	<label for="isConsented">
		<g:message code="candidateRecord.isConsented.label" default="Is Consented" />
		
	</label>
	<g:checkBox name="isConsented" value="${candidateRecordInstance?.isConsented}" />

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'isEligible', 'error')} ">
	<label for="isEligible">
		<g:message code="candidateRecord.isEligible.label" default="Is Eligible" />
		
	</label>
	<g:checkBox name="isEligible" value="${candidateRecordInstance?.isEligible}" />

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'publicVersion', 'error')} required">
	<label for="publicVersion">
		<g:message code="candidateRecord.publicVersion.label" default="Public Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="publicVersion" value="${fieldValue(bean: candidateRecordInstance, field: 'publicVersion')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: candidateRecordInstance, field: 'study', 'error')} required">
	<label for="study">
		<g:message code="candidateRecord.study.label" default="Study" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="study" name="study.id" from="${nci.bbrb.cdr.staticmembers.Study.list()}" optionKey="id" required="" value="${candidateRecordInstance?.study?.id}" class="many-to-one"/>

</div>

