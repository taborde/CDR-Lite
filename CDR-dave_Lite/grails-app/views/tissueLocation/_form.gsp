<%@ page import="nci.bbrb.cdr.staticmembers.TissueLocation" %>



<div class="fieldcontain ${hasErrors(bean: tissueLocationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tissueLocation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tissueLocationInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tissueLocationInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="tissueLocation.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${tissueLocationInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tissueLocationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="tissueLocation.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${tissueLocationInstance?.description}"/>

</div>

