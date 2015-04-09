<%@ page import="nci.bbrb.cdr.staticmembers.Study" %>



<div class="fieldcontain ${hasErrors(bean: studyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="study.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${studyInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studyInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="study.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${studyInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studyInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="study.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${studyInstance?.description}"/>

</div>

