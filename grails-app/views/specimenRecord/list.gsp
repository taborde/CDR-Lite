
<%@ page import="nci.bbrb.cdr.datarecords.SpecimenRecord" %>
<g:set var="bodyclass" value="new_page_enter_lowercase_folder_name_here list" scope="request"/>
<!DOCTYPE html>
<html>
    <head>

        <meta name="layout" content="cahubTemplate">
        <g:set var="entityName" value="${message(code: 'specimenRecord.label', default: 'SpecimenRecord')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                   <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                       </div>
                       </div>
                       <div id="container" class="clearfix"> 
                       <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message">${flash.message}</div>
                    </g:if>
                        <div class="list">
                        <table>
                            <thead>
                                <tr>
                                    
                                    <th><g:message code="specimenRecord.fixative.label" default="Fixative" /></th>
                                        
                                    <th><g:message code="specimenRecord.containerType.label" default="Container Type" /></th>
                                        
                                    <th><g:message code="specimenRecord.tissueLocation.label" default="Tissue Location" /></th>
                                        
                                    <th><g:message code="specimenRecord.parentSpecimen.label" default="Parent Specimen" /></th>
                                        
                                    <th><g:message code="specimenRecord.caseRecord.label" default="Case Record" /></th>
                                        
                                        <g:sortableColumn property="dateCreated" title="${message(code: 'specimenRecord.dateCreated.label', default: 'Date Created')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${specimenRecordInstanceList}" status="i" var="specimenRecordInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${specimenRecordInstance.id}">${fieldValue(bean: specimenRecordInstance, field: "fixative")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: specimenRecordInstance, field: "containerType")}</td>
                                        
                                        <td>${fieldValue(bean: specimenRecordInstance, field: "tissueLocation")}</td>
                                        
                                        <td>${fieldValue(bean: specimenRecordInstance, field: "parentSpecimen")}</td>
                                        
                                        <td>${fieldValue(bean: specimenRecordInstance, field: "caseRecord")}</td>
                                        
                                        <td><g:formatDate date="${specimenRecordInstance.dateCreated}" /></td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                    <div class="paginateButtons">
                        <g:paginate total="${specimenRecordInstanceCount ?: 0}" />
                    </div>
            </div>
    </body>
</html>
