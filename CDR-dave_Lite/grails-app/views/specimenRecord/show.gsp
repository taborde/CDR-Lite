
<%@ page import="nci.bbrb.cdr.datarecords.SpecimenRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'specimenRecord.label', default: 'SpecimenRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-specimenRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-specimenRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list specimenRecord">
			
				<g:if test="${specimenRecordInstance?.internalComments}">
				<li class="fieldcontain">
					<span id="internalComments-label" class="property-label"><g:message code="specimenRecord.internalComments.label" default="Internal Comments" /></span>
					
						<span class="property-value" aria-labelledby="internalComments-label"><g:fieldValue bean="${specimenRecordInstance}" field="internalComments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.publicComments}">
				<li class="fieldcontain">
					<span id="publicComments-label" class="property-label"><g:message code="specimenRecord.publicComments.label" default="Public Comments" /></span>
					
						<span class="property-value" aria-labelledby="publicComments-label"><g:fieldValue bean="${specimenRecordInstance}" field="publicComments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.caseRecord}">
				<li class="fieldcontain">
					<span id="caseRecord-label" class="property-label"><g:message code="specimenRecord.caseRecord.label" default="Case Record" /></span>
					
						<span class="property-value" aria-labelledby="caseRecord-label"><g:link controller="caseRecord" action="show" id="${specimenRecordInstance?.caseRecord?.id}">${specimenRecordInstance?.caseRecord?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.containerType}">
				<li class="fieldcontain">
					<span id="containerType-label" class="property-label"><g:message code="specimenRecord.containerType.label" default="Container Type" /></span>
					
						<span class="property-value" aria-labelledby="containerType-label"><g:link controller="containerType" action="show" id="${specimenRecordInstance?.containerType?.id}">${specimenRecordInstance?.containerType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="specimenRecord.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${specimenRecordInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.fixative}">
				<li class="fieldcontain">
					<span id="fixative-label" class="property-label"><g:message code="specimenRecord.fixative.label" default="Fixative" /></span>
					
						<span class="property-value" aria-labelledby="fixative-label"><g:link controller="fixative" action="show" id="${specimenRecordInstance?.fixative?.id}">${specimenRecordInstance?.fixative?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.internalGUID}">
				<li class="fieldcontain">
					<span id="internalGUID-label" class="property-label"><g:message code="specimenRecord.internalGUID.label" default="Internal GUID" /></span>
					
						<span class="property-value" aria-labelledby="internalGUID-label"><g:fieldValue bean="${specimenRecordInstance}" field="internalGUID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="specimenRecord.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${specimenRecordInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.parentSpecimen}">
				<li class="fieldcontain">
					<span id="parentSpecimen-label" class="property-label"><g:message code="specimenRecord.parentSpecimen.label" default="Parent Specimen" /></span>
					
						<span class="property-value" aria-labelledby="parentSpecimen-label"><g:link controller="specimenRecord" action="show" id="${specimenRecordInstance?.parentSpecimen?.id}">${specimenRecordInstance?.parentSpecimen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.publicVersion}">
				<li class="fieldcontain">
					<span id="publicVersion-label" class="property-label"><g:message code="specimenRecord.publicVersion.label" default="Public Version" /></span>
					
						<span class="property-value" aria-labelledby="publicVersion-label"><g:fieldValue bean="${specimenRecordInstance}" field="publicVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.specimenId}">
				<li class="fieldcontain">
					<span id="specimenId-label" class="property-label"><g:message code="specimenRecord.specimenId.label" default="Specimen Id" /></span>
					
						<span class="property-value" aria-labelledby="specimenId-label"><g:fieldValue bean="${specimenRecordInstance}" field="specimenId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.tissueLocation}">
				<li class="fieldcontain">
					<span id="tissueLocation-label" class="property-label"><g:message code="specimenRecord.tissueLocation.label" default="Tissue Location" /></span>
					
						<span class="property-value" aria-labelledby="tissueLocation-label"><g:link controller="tissueLocation" action="show" id="${specimenRecordInstance?.tissueLocation?.id}">${specimenRecordInstance?.tissueLocation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${specimenRecordInstance?.tissueType}">
				<li class="fieldcontain">
					<span id="tissueType-label" class="property-label"><g:message code="specimenRecord.tissueType.label" default="Tissue Type" /></span>
					
						<span class="property-value" aria-labelledby="tissueType-label"><g:link controller="tissueType" action="show" id="${specimenRecordInstance?.tissueType?.id}">${specimenRecordInstance?.tissueType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:specimenRecordInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${specimenRecordInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
