
<%@ page import="nci.bbrb.cdr.bps.history.HealthHistory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'healthHistory.label', default: 'HealthHistory')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                   
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
                            <td valign="top" class="name"><g:message code="healthHistory.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: healthHistoryInstance, field: "id")}</td>
                            
                        </tr>
                    
                       
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="healthHistory.candidateRecord.label" default="Candidate Record" /></td>
                            
                            <td valign="top" class="value"><g:link controller="candidateRecord" action="show" id="${healthHistoryInstance?.candidateRecord?.id}">${healthHistoryInstance?.candidateRecord?.candidateId}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="healthHistory.source.label" default="Source" /></td>
                            
                            <td valign="top" class="value">${healthHistoryInstance?.source?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="healthHistory.historyOfCancer.label" default="History Of Cancer" /></td>
                            
                            <td valign="top" class="value">${healthHistoryInstance?.historyOfCancer?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="healthHistory.dateSubmitted.label" default="Date Submitted" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${healthHistoryInstance?.dateSubmitted}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="healthHistory.submittedBy.label" default="Submitted By" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: healthHistoryInstance, field: "submittedBy")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="healthHistory.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${healthHistoryInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                     
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="healthHistory.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${healthHistoryInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                      
                    
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <g:form url="[resource:healthHistoryInstance, action:'edit']" method="POST" >
                            <g:hiddenField name="id" value="${healthHistoryInstance?.id}" />
                            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                         <%--   <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span> --%>
                        </g:form>
                    </div>
            </div>
    </body>
</html>
