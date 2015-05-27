<%@ page import="nci.bbrb.cdr.staticmembers.BiospecimenType" %>



<div class="fieldcontain ${hasErrors(bean: biospecimenTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="biospecimenType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${biospecimenTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: biospecimenTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="biospecimenType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${biospecimenTypeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: biospecimenTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="biospecimenType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${biospecimenTypeInstance?.description}"/>

</div>

