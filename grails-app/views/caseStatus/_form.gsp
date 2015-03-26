<%@ page import="nci.bbrb.cdr.staticmembers.CaseStatus" %>



<div class="fieldcontain ${hasErrors(bean: caseStatusInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="caseStatus.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${caseStatusInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseStatusInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="caseStatus.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${caseStatusInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: caseStatusInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="caseStatus.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${caseStatusInstance?.description}"/>

</div>

