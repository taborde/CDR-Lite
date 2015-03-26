<%@ page import="nci.bbrb.cdr.datarecords.SpecimenRecord" %>



<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'internalComments', 'error')} ">
	<label for="internalComments">
		<g:message code="specimenRecord.internalComments.label" default="Internal Comments" />
		
	</label>
	<g:textArea name="internalComments" cols="40" rows="5" maxlength="4000" value="${specimenRecordInstance?.internalComments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'publicComments', 'error')} ">
	<label for="publicComments">
		<g:message code="specimenRecord.publicComments.label" default="Public Comments" />
		
	</label>
	<g:textArea name="publicComments" cols="40" rows="5" maxlength="4000" value="${specimenRecordInstance?.publicComments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'caseRecord', 'error')} required">
	<label for="caseRecord">
		<g:message code="specimenRecord.caseRecord.label" default="Case Record" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="caseRecord" name="caseRecord.id" from="${nci.bbrb.cdr.datarecords.CaseRecord.list()}" optionKey="id" required="" value="${specimenRecordInstance?.caseRecord?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'containerType', 'error')} required">
	<label for="containerType">
		<g:message code="specimenRecord.containerType.label" default="Container Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="containerType" name="containerType.id" from="${nci.bbrb.cdr.staticmembers.ContainerType.list()}" optionKey="id" required="" value="${specimenRecordInstance?.containerType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'fixative', 'error')} required">
	<label for="fixative">
		<g:message code="specimenRecord.fixative.label" default="Fixative" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fixative" name="fixative.id" from="${nci.bbrb.cdr.staticmembers.Fixative.list()}" optionKey="id" required="" value="${specimenRecordInstance?.fixative?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'internalGUID', 'error')} required">
	<label for="internalGUID">
		<g:message code="specimenRecord.internalGUID.label" default="Internal GUID" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="internalGUID" required="" value="${specimenRecordInstance?.internalGUID}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'parentSpecimen', 'error')} required">
	<label for="parentSpecimen">
		<g:message code="specimenRecord.parentSpecimen.label" default="Parent Specimen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parentSpecimen" name="parentSpecimen.id" from="${nci.bbrb.cdr.datarecords.SpecimenRecord.list()}" optionKey="id" required="" value="${specimenRecordInstance?.parentSpecimen?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'publicVersion', 'error')} required">
	<label for="publicVersion">
		<g:message code="specimenRecord.publicVersion.label" default="Public Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="publicVersion" value="${fieldValue(bean: specimenRecordInstance, field: 'publicVersion')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'specimenId', 'error')} required">
	<label for="specimenId">
		<g:message code="specimenRecord.specimenId.label" default="Specimen Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="specimenId" required="" value="${specimenRecordInstance?.specimenId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'tissueLocation', 'error')} required">
	<label for="tissueLocation">
		<g:message code="specimenRecord.tissueLocation.label" default="Tissue Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tissueLocation" name="tissueLocation.id" from="${nci.bbrb.cdr.staticmembers.TissueLocation.list()}" optionKey="id" required="" value="${specimenRecordInstance?.tissueLocation?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specimenRecordInstance, field: 'tissueType', 'error')} required">
	<label for="tissueType">
		<g:message code="specimenRecord.tissueType.label" default="Tissue Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tissueType" name="tissueType.id" from="${nci.bbrb.cdr.staticmembers.TissueType.list()}" optionKey="id" required="" value="${specimenRecordInstance?.tissueType?.id}" class="many-to-one"/>

</div>

