
<%@ page import="nci.bbrb.cdr.bps.history.CancerHistory" %>
<g:set var="bodyclass" value="gtexbsshome home" scope="request"/>
<!DOCTYPE html>
<html>
    <head>

        <meta name="layout" content="cahubTemplate">
        <g:set var="entityName" value="${message(code: 'cancerHistory.label', default: 'CancerHistory')}" />
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
                                    
                                       
                                        
                                        <g:sortableColumn property="primaryTumorSite" title="${message(code: 'cancerHistory.primaryTumorSite.label', default: 'Primary Tumor Site')}" />
                                        
                                        <g:sortableColumn property="monthYearOfFirstDiagnosis" title="${message(code: 'cancerHistory.monthYearOfFirstDiagnosis.label', default: 'Month Year Of First Diagnosis')}" />
                                        
                                        <g:sortableColumn property="treatments" title="${message(code: 'cancerHistory.treatments.label', default: 'Treatments')}" />
                                        
                                        <g:sortableColumn property="monthYearOfLastTreatment" title="${message(code: 'cancerHistory.monthYearOfLastTreatment.label', default: 'Month Year Of Last Treatment')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${cancerHistoryInstanceList}" status="i" var="cancerHistoryInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                                                              
                                        <td>${fieldValue(bean: cancerHistoryInstance, field: "primaryTumorSite")}</td>
                                        
                                        <td><g:formatDate date="${cancerHistoryInstance.monthYearOfFirstDiagnosis}" /></td>
                                        
                                        <td>${fieldValue(bean: cancerHistoryInstance, field: "treatments")}</td>
                                        
                                        <td><g:formatDate date="${cancerHistoryInstance.monthYearOfLastTreatment}" /></td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                    <div class="paginateButtons">
                        <g:paginate total="${cancerHistoryInstanceCount ?: 0}" />
                    </div>
            </div>
    </body>
</html>
