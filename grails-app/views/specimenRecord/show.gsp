
<%@ page import="nci.bbrb.cdr.datarecords.SpecimenRecord" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'specimenRecord.label', default: 'SpecimenRecord')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                   <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
                   <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                       </div>
                       </div>

                   <div id="container" class="clearfix">
                   <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <div class="dialog">
                        <table>
                            <tbody>
                                
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: specimenRecordInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.fixative.label" default="Fixative" /></td>
                            
                            <td valign="top" class="value"><g:link controller="fixative" action="show" id="${specimenRecordInstance?.fixative?.id}">${specimenRecordInstance?.fixative?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.containerType.label" default="Container Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="containerType" action="show" id="${specimenRecordInstance?.containerType?.id}">${specimenRecordInstance?.containerType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.tissueLocation.label" default="Tissue Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="tissueLocation" action="show" id="${specimenRecordInstance?.tissueLocation?.id}">${specimenRecordInstance?.tissueLocation?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.parentSpecimen.label" default="Parent Specimen" /></td>
                            
                            <td valign="top" class="value"><g:link controller="specimenRecord" action="show" id="${specimenRecordInstance?.parentSpecimen?.id}">${specimenRecordInstance?.parentSpecimen?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.caseRecord.label" default="Case Record" /></td>
                            
                            <td valign="top" class="value"><g:link controller="caseRecord" action="show" id="${specimenRecordInstance?.caseRecord?.id}">${specimenRecordInstance?.caseRecord?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${specimenRecordInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${specimenRecordInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.specimenId.label" default="Specimen Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: specimenRecordInstance, field: "specimenId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="specimenRecord.tissueType.label" default="Tissue Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="tissueType" action="show" id="${specimenRecordInstance?.tissueType?.id}">${specimenRecordInstance?.tissueType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <g:form url="[resource:specimenRecordInstance, action:'delete']" method="POST" >
                            <g:hiddenField name="id" value="${specimenRecordInstance?.id}" />
                            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                        </g:form>
                    </div>
            </div>
    </body>
</html>
