
<%@ page import="nci.bbrb.cdr.datarecords.CaseRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'caseRecord.label', default: 'CaseRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-caseRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-caseRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="internalComments" title="${message(code: 'caseRecord.internalComments.label', default: 'Internal Comments')}" />
					
						<g:sortableColumn property="publicComments" title="${message(code: 'caseRecord.publicComments.label', default: 'Public Comments')}" />
					
						<th><g:message code="caseRecord.bss.label" default="Bss" /></th>
					
						<th><g:message code="caseRecord.candidateRecord.label" default="Candidate Record" /></th>
					
						<g:sortableColumn property="caseId" title="${message(code: 'caseRecord.caseId.label', default: 'Case Id')}" />
					
						<th><g:message code="caseRecord.caseStatus.label" default="Case Status" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${caseRecordInstanceList}" status="i" var="caseRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${caseRecordInstance.id}">${fieldValue(bean: caseRecordInstance, field: "internalComments")}</g:link></td>
					
						<td>${fieldValue(bean: caseRecordInstance, field: "publicComments")}</td>
					
						<td>${fieldValue(bean: caseRecordInstance, field: "bss")}</td>
					
						<td>${fieldValue(bean: caseRecordInstance, field: "candidateRecord")}</td>
					
						<td>${fieldValue(bean: caseRecordInstance, field: "caseId")}</td>
					
						<td>${fieldValue(bean: caseRecordInstance, field: "caseStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${caseRecordInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
