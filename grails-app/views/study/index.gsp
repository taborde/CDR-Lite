
<%@ page import="nci.bbrb.cdr.study.Study" %>
<!DOCTYPE html>
<html>
	<head>
            
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'study.label', default: 'Study')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-study" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-study" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'study.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'study.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'study.description.label', default: 'Description')}" />
					
						<th><g:message code="study.caseRecord.label" default="Case Record" /></th>
					
						<th><g:message code="study.studyType.label" default="Study Type" /></th>
					
						<th><g:message code="study.biospecimenType.label" default="Biospecimen Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${studyInstanceList}" status="i" var="studyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${studyInstance.id}">${fieldValue(bean: studyInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: studyInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: studyInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: studyInstance, field: "caseRecord")}</td>
					
						<td>${fieldValue(bean: studyInstance, field: "studyType")}</td>
					
						<td>${fieldValue(bean: studyInstance, field: "biospecimenType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
