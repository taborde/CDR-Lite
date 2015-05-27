
<%@ page import="nci.bbrb.cdr.staticmembers.BiospecimenType" %>
<!DOCTYPE html>
<html>
	<head>
            
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'biospecimenType.label', default: 'BiospecimenType')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-biospecimenType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-biospecimenType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'biospecimenType.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'biospecimenType.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'biospecimenType.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${biospecimenTypeInstanceList}" status="i" var="biospecimenTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${biospecimenTypeInstance.id}">${fieldValue(bean: biospecimenTypeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: biospecimenTypeInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: biospecimenTypeInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${biospecimenTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
