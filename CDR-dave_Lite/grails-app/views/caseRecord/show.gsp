
<%@ page import="nci.bbrb.cdr.datarecords.CaseRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'caseRecord.label', default: 'CaseRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-caseRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-caseRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list caseRecord">
			
				<g:if test="${caseRecordInstance?.internalComments}">
				<li class="fieldcontain">
					<span id="internalComments-label" class="property-label"><g:message code="caseRecord.internalComments.label" default="Internal Comments" /></span>
					
						<span class="property-value" aria-labelledby="internalComments-label"><g:fieldValue bean="${caseRecordInstance}" field="internalComments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.publicComments}">
				<li class="fieldcontain">
					<span id="publicComments-label" class="property-label"><g:message code="caseRecord.publicComments.label" default="Public Comments" /></span>
					
						<span class="property-value" aria-labelledby="publicComments-label"><g:fieldValue bean="${caseRecordInstance}" field="publicComments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.bss}">
				<li class="fieldcontain">
					<span id="bss-label" class="property-label"><g:message code="caseRecord.bss.label" default="Bss" /></span>
					
						<span class="property-value" aria-labelledby="bss-label"><g:link controller="BSS" action="show" id="${caseRecordInstance?.bss?.id}">${caseRecordInstance?.bss?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.candidateRecord}">
				<li class="fieldcontain">
					<span id="candidateRecord-label" class="property-label"><g:message code="caseRecord.candidateRecord.label" default="Candidate Record" /></span>
					
						<span class="property-value" aria-labelledby="candidateRecord-label"><g:link controller="candidateRecord" action="show" id="${caseRecordInstance?.candidateRecord?.id}">${caseRecordInstance?.candidateRecord?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.caseId}">
				<li class="fieldcontain">
					<span id="caseId-label" class="property-label"><g:message code="caseRecord.caseId.label" default="Case Id" /></span>
					
						<span class="property-value" aria-labelledby="caseId-label"><g:fieldValue bean="${caseRecordInstance}" field="caseId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.caseStatus}">
				<li class="fieldcontain">
					<span id="caseStatus-label" class="property-label"><g:message code="caseRecord.caseStatus.label" default="Case Status" /></span>
					
						<span class="property-value" aria-labelledby="caseStatus-label"><g:link controller="caseStatus" action="show" id="${caseRecordInstance?.caseStatus?.id}">${caseRecordInstance?.caseStatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.collectionType}">
				<li class="fieldcontain">
					<span id="collectionType-label" class="property-label"><g:message code="caseRecord.collectionType.label" default="Collection Type" /></span>
					
						<span class="property-value" aria-labelledby="collectionType-label"><g:link controller="collectionType" action="show" id="${caseRecordInstance?.collectionType?.id}">${caseRecordInstance?.collectionType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="caseRecord.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${caseRecordInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.internalGUID}">
				<li class="fieldcontain">
					<span id="internalGUID-label" class="property-label"><g:message code="caseRecord.internalGUID.label" default="Internal GUID" /></span>
					
						<span class="property-value" aria-labelledby="internalGUID-label"><g:fieldValue bean="${caseRecordInstance}" field="internalGUID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="caseRecord.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${caseRecordInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.publicVersion}">
				<li class="fieldcontain">
					<span id="publicVersion-label" class="property-label"><g:message code="caseRecord.publicVersion.label" default="Public Version" /></span>
					
						<span class="property-value" aria-labelledby="publicVersion-label"><g:fieldValue bean="${caseRecordInstance}" field="publicVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.specimens}">
				<li class="fieldcontain">
					<span id="specimens-label" class="property-label"><g:message code="caseRecord.specimens.label" default="Specimens" /></span>
					
						<g:each in="${caseRecordInstance.specimens}" var="s">
						<span class="property-value" aria-labelledby="specimens-label"><g:link controller="specimenRecord" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${caseRecordInstance?.tissueBankId}">
				<li class="fieldcontain">
					<span id="tissueBankId-label" class="property-label"><g:message code="caseRecord.tissueBankId.label" default="Tissue Bank Id" /></span>
					
						<span class="property-value" aria-labelledby="tissueBankId-label"><g:fieldValue bean="${caseRecordInstance}" field="tissueBankId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:caseRecordInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${caseRecordInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
