
<%@ page import="nci.bbrb.cdr.datarecords.CandidateRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'candidateRecord.label', default: 'CandidateRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-candidateRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-candidateRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="internalComments" title="${message(code: 'candidateRecord.internalComments.label', default: 'Internal Comments')}" />
					
						<g:sortableColumn property="publicComments" title="${message(code: 'candidateRecord.publicComments.label', default: 'Public Comments')}" />
					
						<th><g:message code="candidateRecord.bss.label" default="Bss" /></th>
					
						<g:sortableColumn property="candidateId" title="${message(code: 'candidateRecord.candidateId.label', default: 'Candidate Id')}" />
					
						<th><g:message code="candidateRecord.caseRecord.label" default="Case Record" /></th>
					
						<th><g:message code="candidateRecord.collectionType.label" default="Collection Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${candidateRecordInstanceList}" status="i" var="candidateRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${candidateRecordInstance.id}">${fieldValue(bean: candidateRecordInstance, field: "internalComments")}</g:link></td>
					
						<td>${fieldValue(bean: candidateRecordInstance, field: "publicComments")}</td>
					
						<td>${fieldValue(bean: candidateRecordInstance, field: "bss")}</td>
					
						<td>${fieldValue(bean: candidateRecordInstance, field: "candidateId")}</td>
					
						<td>${fieldValue(bean: candidateRecordInstance, field: "caseRecord")}</td>
					
						<td>${fieldValue(bean: candidateRecordInstance, field: "collectionType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${candidateRecordInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
