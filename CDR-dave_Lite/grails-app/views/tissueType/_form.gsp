<%@ page import="nci.bbrb.cdr.staticmembers.TissueType" %>



<div class="fieldcontain ${hasErrors(bean: tissueTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tissueType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tissueTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tissueTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="tissueType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${tissueTypeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tissueTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="tissueType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${tissueTypeInstance?.description}"/>

</div>

