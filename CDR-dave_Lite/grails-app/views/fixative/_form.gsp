<%@ page import="nci.bbrb.cdr.staticmembers.Fixative" %>



<div class="fieldcontain ${hasErrors(bean: fixativeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="fixative.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${fixativeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fixativeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="fixative.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${fixativeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: fixativeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="fixative.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${fixativeInstance?.description}"/>

</div>

