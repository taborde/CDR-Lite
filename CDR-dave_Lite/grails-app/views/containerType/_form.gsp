<%@ page import="nci.bbrb.cdr.staticmembers.ContainerType" %>



<div class="fieldcontain ${hasErrors(bean: containerTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="containerType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${containerTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: containerTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="containerType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${containerTypeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: containerTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="containerType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${containerTypeInstance?.description}"/>

</div>

