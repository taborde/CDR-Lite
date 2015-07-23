
<%@ page import="nci.bbrb.cdr.datarecords.CaseRecord" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'caseRecord.label', default: 'CaseRecord')}" />
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
                            <td valign="top" class="name"><g:message code="caseRecord.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseRecordInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.bss.label" default="Bss" /></td>
                            
                            <td valign="top" class="value"><g:link controller="BSS" action="show" id="${caseRecordInstance?.bss?.id}">${caseRecordInstance?.bss?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.candidateRecord.label" default="Candidate Record" /></td>
                            
                            <td valign="top" class="value"><g:link controller="candidateRecord" action="show" id="${caseRecordInstance?.candidateRecord?.id}">${caseRecordInstance?.candidateRecord?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.caseCollectionType.label" default="Case Collection Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="caseCollectionType" action="show" id="${caseRecordInstance?.caseCollectionType?.id}">${caseRecordInstance?.caseCollectionType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.caseId.label" default="Case Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseRecordInstance, field: "caseId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.caseStatus.label" default="Case Status" /></td>
                            
                            <td valign="top" class="value"><g:link controller="caseStatus" action="show" id="${caseRecordInstance?.caseStatus?.id}">${caseRecordInstance?.caseStatus?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${caseRecordInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${caseRecordInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.primaryTissueType.label" default="Primary Tissue Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="tissueType" action="show" id="${caseRecordInstance?.primaryTissueType?.id}">${caseRecordInstance?.primaryTissueType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.specimens.label" default="Specimens" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${caseRecordInstance.specimens}" var="s">
                                    <li><g:link controller="specimenRecord" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.study.label" default="Study" /></td>
                            
                            <td valign="top" class="value"><g:link controller="study" action="show" id="${caseRecordInstance?.study?.id}">${caseRecordInstance?.study?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <g:form url="[resource:caseRecordInstance, action:'delete']" method="POST" >
                            <g:hiddenField name="id" value="${caseRecordInstance?.id}" />
                            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                        </g:form>
                    </div>
            </div>
    </body>
</html>
