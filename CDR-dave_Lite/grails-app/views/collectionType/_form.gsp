<%@ page import="nci.bbrb.cdr.staticmembers.CollectionType" %>



<div class="fieldcontain ${hasErrors(bean: collectionTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="collectionType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${collectionTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: collectionTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="collectionType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${collectionTypeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: collectionTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="collectionType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${collectionTypeInstance?.description}"/>

</div>

