
<%@ page import="nci.bbrb.cdr.datarecords.SpecimenRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'specimenRecord.label', default: 'SpecimenRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-specimenRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-specimenRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="internalComments" title="${message(code: 'specimenRecord.internalComments.label', default: 'Internal Comments')}" />
					
						<g:sortableColumn property="publicComments" title="${message(code: 'specimenRecord.publicComments.label', default: 'Public Comments')}" />
					
						<th><g:message code="specimenRecord.caseRecord.label" default="Case Record" /></th>
					
						<th><g:message code="specimenRecord.containerType.label" default="Container Type" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'specimenRecord.dateCreated.label', default: 'Date Created')}" />
					
						<th><g:message code="specimenRecord.fixative.label" default="Fixative" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${specimenRecordInstanceList}" status="i" var="specimenRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${specimenRecordInstance.id}">${fieldValue(bean: specimenRecordInstance, field: "internalComments")}</g:link></td>
					
						<td>${fieldValue(bean: specimenRecordInstance, field: "publicComments")}</td>
					
						<td>${fieldValue(bean: specimenRecordInstance, field: "caseRecord")}</td>
					
						<td>${fieldValue(bean: specimenRecordInstance, field: "containerType")}</td>
					
						<td><g:formatDate date="${specimenRecordInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: specimenRecordInstance, field: "fixative")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${specimenRecordInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
