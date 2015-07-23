
<%@ page import="nci.bbrb.cdr.datarecords.CandidateRecord" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'candidateRecord.label', default: 'CandidateRecord')}" />
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
                            <td valign="top" class="name"><g:message code="candidateRecord.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: candidateRecordInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.bss.label" default="Bss" /></td>
                            
                            <td valign="top" class="value"><g:link controller="BSS" action="show" id="${candidateRecordInstance?.bss?.id}">${candidateRecordInstance?.bss?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.candidateId.label" default="Candidate Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: candidateRecordInstance, field: "candidateId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.caseList.label" default="Case List" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${candidateRecordInstance.caseList}" var="c">
                                    <li><g:link controller="caseRecord" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${candidateRecordInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.isConsented.label" default="Is Consented" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${candidateRecordInstance?.isConsented}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.isEligible.label" default="Is Eligible" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${candidateRecordInstance?.isEligible}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${candidateRecordInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.study.label" default="Study" /></td>
                            
                            <td valign="top" class="value"><g:link controller="study" action="show" id="${candidateRecordInstance?.study?.id}">${candidateRecordInstance?.study?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <g:form url="[resource:candidateRecordInstance, action:'delete']" method="POST" >
                            <g:hiddenField name="id" value="${candidateRecordInstance?.id}" />
                            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                        </g:form>
                    </div>
            </div>
    </body>
</html>
