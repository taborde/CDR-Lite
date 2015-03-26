
<%@ page import="nci.bbrb.cdr.datarecords.CandidateRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'candidateRecord.label', default: 'CandidateRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-candidateRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-candidateRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list candidateRecord">
			
				<g:if test="${candidateRecordInstance?.internalComments}">
				<li class="fieldcontain">
					<span id="internalComments-label" class="property-label"><g:message code="candidateRecord.internalComments.label" default="Internal Comments" /></span>
					
						<span class="property-value" aria-labelledby="internalComments-label"><g:fieldValue bean="${candidateRecordInstance}" field="internalComments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.publicComments}">
				<li class="fieldcontain">
					<span id="publicComments-label" class="property-label"><g:message code="candidateRecord.publicComments.label" default="Public Comments" /></span>
					
						<span class="property-value" aria-labelledby="publicComments-label"><g:fieldValue bean="${candidateRecordInstance}" field="publicComments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.bss}">
				<li class="fieldcontain">
					<span id="bss-label" class="property-label"><g:message code="candidateRecord.bss.label" default="Bss" /></span>
					
						<span class="property-value" aria-labelledby="bss-label"><g:link controller="BSS" action="show" id="${candidateRecordInstance?.bss?.id}">${candidateRecordInstance?.bss?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.candidateId}">
				<li class="fieldcontain">
					<span id="candidateId-label" class="property-label"><g:message code="candidateRecord.candidateId.label" default="Candidate Id" /></span>
					
						<span class="property-value" aria-labelledby="candidateId-label"><g:fieldValue bean="${candidateRecordInstance}" field="candidateId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.caseRecord}">
				<li class="fieldcontain">
					<span id="caseRecord-label" class="property-label"><g:message code="candidateRecord.caseRecord.label" default="Case Record" /></span>
					
						<span class="property-value" aria-labelledby="caseRecord-label"><g:link controller="caseRecord" action="show" id="${candidateRecordInstance?.caseRecord?.id}">${candidateRecordInstance?.caseRecord?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.collectionType}">
				<li class="fieldcontain">
					<span id="collectionType-label" class="property-label"><g:message code="candidateRecord.collectionType.label" default="Collection Type" /></span>
					
						<span class="property-value" aria-labelledby="collectionType-label"><g:link controller="collectionType" action="show" id="${candidateRecordInstance?.collectionType?.id}">${candidateRecordInstance?.collectionType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="candidateRecord.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${candidateRecordInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.internalGUID}">
				<li class="fieldcontain">
					<span id="internalGUID-label" class="property-label"><g:message code="candidateRecord.internalGUID.label" default="Internal GUID" /></span>
					
						<span class="property-value" aria-labelledby="internalGUID-label"><g:fieldValue bean="${candidateRecordInstance}" field="internalGUID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.isConsented}">
				<li class="fieldcontain">
					<span id="isConsented-label" class="property-label"><g:message code="candidateRecord.isConsented.label" default="Is Consented" /></span>
					
						<span class="property-value" aria-labelledby="isConsented-label"><g:formatBoolean boolean="${candidateRecordInstance?.isConsented}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.isEligible}">
				<li class="fieldcontain">
					<span id="isEligible-label" class="property-label"><g:message code="candidateRecord.isEligible.label" default="Is Eligible" /></span>
					
						<span class="property-value" aria-labelledby="isEligible-label"><g:formatBoolean boolean="${candidateRecordInstance?.isEligible}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="candidateRecord.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${candidateRecordInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.publicVersion}">
				<li class="fieldcontain">
					<span id="publicVersion-label" class="property-label"><g:message code="candidateRecord.publicVersion.label" default="Public Version" /></span>
					
						<span class="property-value" aria-labelledby="publicVersion-label"><g:fieldValue bean="${candidateRecordInstance}" field="publicVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${candidateRecordInstance?.study}">
				<li class="fieldcontain">
					<span id="study-label" class="property-label"><g:message code="candidateRecord.study.label" default="Study" /></span>
					
						<span class="property-value" aria-labelledby="study-label"><g:link controller="study" action="show" id="${candidateRecordInstance?.study?.id}">${candidateRecordInstance?.study?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:candidateRecordInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${candidateRecordInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
