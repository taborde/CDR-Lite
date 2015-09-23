<%@ page import="nci.bbrb.cdr.bps.history.HealthHistory" %>


<div class="dialog">
    <table>
        <tbody>

       
        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="source"><g:message code="healthHistory.source.label" default="Source" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: healthHistoryInstance, field: 'source', 'error')}">
                <g:select name="source" from="${nci.bbrb.cdr.bps.history.HealthHistory$SourceType?.values()}" keys="${nci.bbrb.cdr.bps.history.HealthHistory$SourceType.values()*.name()}" value="${healthHistoryInstance?.source?.name()}"  noSelection="['': '']"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="historyOfCancer"><g:message code="healthHistory.historyOfCancer.label" default="History Of Cancer" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: healthHistoryInstance, field: 'historyOfCancer', 'error')}">
                <g:select name="historyOfCancer" from="${nci.bbrb.cdr.bps.history.HealthHistory$YesNo?.values()}" keys="${nci.bbrb.cdr.bps.history.HealthHistory$YesNo.values()*.name()}" value="${healthHistoryInstance?.historyOfCancer?.name()}"  noSelection="['': '']"/>

            </td>
        </tr>

        
      
        

        </tbody>
    </table>
</div>  
