
<%@ page import="nci.bbrb.cdr.staticmembers.BSS" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'BSS.label', default: 'BSS')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-BSS" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-BSS" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'BSS.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'BSS.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'BSS.description.label', default: 'Description')}" />
					
						<th><g:message code="BSS.parentBss.label" default="Parent Bss" /></th>
					
						<th><g:message code="BSS.study.label" default="Study" /></th>
					
						<g:sortableColumn property="IRBprotocol" title="${message(code: 'BSS.IRBprotocol.label', default: 'IRB protocol')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${BSSInstanceList}" status="i" var="BSSInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${BSSInstance.id}">${fieldValue(bean: BSSInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: BSSInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: BSSInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: BSSInstance, field: "parentBss")}</td>
					
						<td>${fieldValue(bean: BSSInstance, field: "study")}</td>
					
						<td>${fieldValue(bean: BSSInstance, field: "IRBprotocol")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${BSSInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
