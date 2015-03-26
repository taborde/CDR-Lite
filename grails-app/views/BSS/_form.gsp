<%@ page import="nci.bbrb.cdr.staticmembers.BSS" %>



<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="BSS.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${BSSInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="BSS.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${BSSInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="BSS.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${BSSInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'parentBss', 'error')} ">
	<label for="parentBss">
		<g:message code="BSS.parentBss.label" default="Parent Bss" />
		
	</label>
	<g:select id="parentBss" name="parentBss.id" from="${nci.bbrb.cdr.staticmembers.BSS.list()}" optionKey="id" value="${BSSInstance?.parentBss?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'study', 'error')} required">
	<label for="study">
		<g:message code="BSS.study.label" default="Study" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="study" name="study.id" from="${nci.bbrb.cdr.staticmembers.Study.list()}" optionKey="id" required="" value="${BSSInstance?.study?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'IRBprotocol', 'error')} ">
	<label for="IRBprotocol">
		<g:message code="BSS.IRBprotocol.label" default="IRB protocol" />
		
	</label>
	<g:textField name="IRBprotocol" value="${BSSInstance?.IRBprotocol}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'shippingAddress', 'error')} ">
	<label for="shippingAddress">
		<g:message code="BSS.shippingAddress.label" default="Shipping Address" />
		
	</label>
	<g:textArea name="shippingAddress" cols="40" rows="5" value="${BSSInstance?.shippingAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: BSSInstance, field: 'timeZone', 'error')} ">
	<label for="timeZone">
		<g:message code="BSS.timeZone.label" default="Time Zone" />
		
	</label>
	<g:textField name="timeZone" value="${BSSInstance?.timeZone}"/>

</div>

