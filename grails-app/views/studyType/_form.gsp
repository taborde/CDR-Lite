<%@ page import="nci.bbrb.cdr.staticmembers.StudyType" %>



<div class="fieldcontain ${hasErrors(bean: studyTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="studyType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${studyTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studyTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="studyType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${studyTypeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studyTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="studyType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${studyTypeInstance?.description}"/>

</div>

