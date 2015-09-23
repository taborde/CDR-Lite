
<%@ page import="nci.bbrb.cdr.bps.history.HealthHistory" %>
<g:set var="bodyclass" value="gtexbsshome home" scope="request"/>
<!DOCTYPE html>
<html>
    <head>

        <meta name="layout" content="cahubTemplate">
        <g:set var="entityName" value="${message(code: 'healthHistory.label', default: 'HealthHistory')}" />
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
                                    
                                       
                                        
                                    <th><g:message code="healthHistory.candidateRecord.label" default="Candidate Record" /></th>
                                        
                                        <g:sortableColumn property="source" title="${message(code: 'healthHistory.source.label', default: 'Source')}" />
                                        
                                        <g:sortableColumn property="historyOfCancer" title="${message(code: 'healthHistory.historyOfCancer.label', default: 'History Of Cancer')}" />
                                        
                                        <g:sortableColumn property="dateSubmitted" title="${message(code: 'healthHistory.dateSubmitted.label', default: 'Date Submitted')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${healthHistoryInstanceList}" status="i" var="healthHistoryInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                       
                                        
                                        <td>${fieldValue(bean: healthHistoryInstance, field: "candidateRecord")}</td>
                                        
                                        <td>${fieldValue(bean: healthHistoryInstance, field: "source")}</td>
                                        
                                        <td>${fieldValue(bean: healthHistoryInstance, field: "historyOfCancer")}</td>
                                        
                                        <td><g:formatDate date="${healthHistoryInstance.dateSubmitted}" /></td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                    <div class="paginateButtons">
                        <g:paginate total="${healthHistoryInstanceCount ?: 0}" />
                    </div>
            </div>
    </body>
</html>
