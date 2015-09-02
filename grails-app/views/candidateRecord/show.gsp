
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
                       </div>
                       </div>

                   <div id="container" class="clearfix">
                   <h1>View Candidate Record Details for ${candidateRecordInstance.candidateId}</h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <div class="dialog">
                        <table>
                            <tbody>
                        
                       <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.candidateId.label" default="Candidate Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: candidateRecordInstance, field: "candidateId")}</td>
                            
                        </tr>
                       
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.bss.label" default="Bss" /></td>
                            
                            <td valign="top" class="value">${candidateRecordInstance?.bss.name} (${candidateRecordInstance?.bss?.code})</td>
                            
                        </tr>
                    
                      
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.caseList.label" default="Linked Case IDs" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${candidateRecordInstance.caseList}" var="c">
                                    <li><g:link controller="caseRecord" action="show" id="${c.id}">${c?.caseId}</g:link></li>
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
                            <td valign="top" class="name"><g:message code="candidateRecord.comments.label" default="Comments" /></td>
                            
                            <td valign="top" class="value">${candidateRecordInstance?.comments}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="candidateRecord.study.label" default="Study" /></td>
                            
                            <td valign="top" class="value">${candidateRecordInstance?.study?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <g:form url="[resource:candidateRecordInstance, action:'edit']" method="POST" >
                            <g:hiddenField name="id" value="${candidateRecordInstance?.id}" />
                            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                        </g:form>
                    </div>
            </div>
    </body>
</html>
