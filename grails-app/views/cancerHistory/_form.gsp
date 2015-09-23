<%@ page import="nci.bbrb.cdr.bps.history.CancerHistory" %>


<div class="dialog">
    <table>
        <tbody>

            
        

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="primaryTumorSite"><g:message code="cancerHistory.primaryTumorSite.label" default="Primary Tumor Site" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'primaryTumorSite', 'error')}">
                <g:textField name="primaryTumorSite" value="${cancerHistoryInstance?.primaryTumorSite}"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="monthYearOfFirstDiagnosis"><g:message code="cancerHistory.monthYearOfFirstDiagnosis.label" default="Month Year Of First Diagnosis" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'monthYearOfFirstDiagnosis', 'error')}">
                <g:datePicker name="monthYearOfFirstDiagnosis" precision="day"  value="${cancerHistoryInstance?.monthYearOfFirstDiagnosis}" default="none" noSelection="['': '']" />

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="treatments"><g:message code="cancerHistory.treatments.label" default="Treatments" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'treatments', 'error')}">
                <g:textField name="treatments" value="${cancerHistoryInstance?.treatments}"/>

            </td>
        </tr>

        
        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="treatmentChemotherapy"><g:message code="cancerHistory.treatmentChemotherapy.label" default="Treatment Chemotherapy" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'treatmentChemotherapy', 'error')}">
                <g:checkBox name="treatmentChemotherapy" value="${cancerHistoryInstance?.treatmentChemotherapy}" />

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="treatmentNo"><g:message code="cancerHistory.treatmentNo.label" default="Treatment No" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'treatmentNo', 'error')}">
                <g:checkBox name="treatmentNo" value="${cancerHistoryInstance?.treatmentNo}" />

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="treatmentOther"><g:message code="cancerHistory.treatmentOther.label" default="Treatment Other" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'treatmentOther', 'error')}">
                <g:checkBox name="treatmentOther" value="${cancerHistoryInstance?.treatmentOther}" />

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="treatmentRadiation"><g:message code="cancerHistory.treatmentRadiation.label" default="Treatment Radiation" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'treatmentRadiation', 'error')}">
                <g:checkBox name="treatmentRadiation" value="${cancerHistoryInstance?.treatmentRadiation}" />

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="treatmentSurgery"><g:message code="cancerHistory.treatmentSurgery.label" default="Treatment Surgery" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'treatmentSurgery', 'error')}">
                <g:checkBox name="treatmentSurgery" value="${cancerHistoryInstance?.treatmentSurgery}" />

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="treatmentUnknown"><g:message code="cancerHistory.treatmentUnknown.label" default="Treatment Unknown" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'treatmentUnknown', 'error')}">
                <g:checkBox name="treatmentUnknown" value="${cancerHistoryInstance?.treatmentUnknown}" />

            </td>
        </tr>

        
        
        
        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="monthYearOfLastTreatment"><g:message code="cancerHistory.monthYearOfLastTreatment.label" default="Month Year Of Last Treatment" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'monthYearOfLastTreatment', 'error')}">
                <g:datePicker name="monthYearOfLastTreatment" precision="day"  value="${cancerHistoryInstance?.monthYearOfLastTreatment}" default="none" noSelection="['': '']" />

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="otherTreatment"><g:message code="cancerHistory.otherTreatment.label" default="Other Treatment" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'otherTreatment', 'error')}">
                <g:textField name="otherTreatment" value="${cancerHistoryInstance?.otherTreatment}"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="source"><g:message code="cancerHistory.source.label" default="Source" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: cancerHistoryInstance, field: 'source', 'error')}">
                <g:select name="source" from="${nci.bbrb.cdr.bps.history.CancerHistory$SourceType?.values()}" keys="${nci.bbrb.cdr.bps.history.CancerHistory$SourceType.values()*.name()}" value="${cancerHistoryInstance?.source?.name()}"  noSelection="['': '']"/>

            </td>
        </tr>

       


        

        </tbody>
    </table>
</div>  
