
<%@ page import="nci.bbrb.cdr.staticmembers.BSS" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'BSS.label', default: 'BSS')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-BSS" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-BSS" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list BSS">
			
				<g:if test="${BSSInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="BSS.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${BSSInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${BSSInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="BSS.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${BSSInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${BSSInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="BSS.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${BSSInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${BSSInstance?.parentBss}">
				<li class="fieldcontain">
					<span id="parentBss-label" class="property-label"><g:message code="BSS.parentBss.label" default="Parent Bss" /></span>
					
						<span class="property-value" aria-labelledby="parentBss-label"><g:link controller="BSS" action="show" id="${BSSInstance?.parentBss?.id}">${BSSInstance?.parentBss?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${BSSInstance?.study}">
				<li class="fieldcontain">
					<span id="study-label" class="property-label"><g:message code="BSS.study.label" default="Study" /></span>
					
						<span class="property-value" aria-labelledby="study-label"><g:link controller="study" action="show" id="${BSSInstance?.study?.id}">${BSSInstance?.study?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${BSSInstance?.IRBprotocol}">
				<li class="fieldcontain">
					<span id="IRBprotocol-label" class="property-label"><g:message code="BSS.IRBprotocol.label" default="IRB protocol" /></span>
					
						<span class="property-value" aria-labelledby="IRBprotocol-label"><g:fieldValue bean="${BSSInstance}" field="IRBprotocol"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${BSSInstance?.shippingAddress}">
				<li class="fieldcontain">
					<span id="shippingAddress-label" class="property-label"><g:message code="BSS.shippingAddress.label" default="Shipping Address" /></span>
					
						<span class="property-value" aria-labelledby="shippingAddress-label"><g:fieldValue bean="${BSSInstance}" field="shippingAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${BSSInstance?.timeZone}">
				<li class="fieldcontain">
					<span id="timeZone-label" class="property-label"><g:message code="BSS.timeZone.label" default="Time Zone" /></span>
					
						<span class="property-value" aria-labelledby="timeZone-label"><g:fieldValue bean="${BSSInstance}" field="timeZone"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:BSSInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${BSSInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
