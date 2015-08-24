<%@ page import="nci.bbrb.cdr.datarecords.SpecimenRecord" %>


<div class="dialog">
    <table>
        <tbody>

            
        <tr class="prop">
            <td valign="top" class="name">
                <label for="fixative"><g:message code="specimenRecord.fixative.label" default="Fixative" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: specimenRecordInstance, field: 'fixative', 'error')}">
                <g:select id="fixative" name="fixative.id" from="${nci.bbrb.cdr.staticmembers.Fixative.list()}" optionKey="id" value="${specimenRecordInstance?.fixative?.id}" class="many-to-one" noSelection="['null': '']"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="containerType"><g:message code="specimenRecord.containerType.label" default="Container Type" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: specimenRecordInstance, field: 'containerType', 'error')}">
                <g:select id="containerType" name="containerType.id" from="${nci.bbrb.cdr.staticmembers.ContainerType.list()}" optionKey="id" value="${specimenRecordInstance?.containerType?.id}" class="many-to-one" noSelection="['null': '']"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="tissueLocation"><g:message code="specimenRecord.tissueLocation.label" default="Tissue Location" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: specimenRecordInstance, field: 'tissueLocation', 'error')}">
                <g:select id="tissueLocation" name="tissueLocation.id" from="${nci.bbrb.cdr.staticmembers.TissueLocation.list()}" optionKey="id" value="${specimenRecordInstance?.tissueLocation?.id}" class="many-to-one" noSelection="['null': '']"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="parentSpecimen"><g:message code="specimenRecord.parentSpecimen.label" default="Parent Specimen" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: specimenRecordInstance, field: 'parentSpecimen', 'error')}">
                <g:select id="parentSpecimen" name="parentSpecimen.id" from="${nci.bbrb.cdr.datarecords.SpecimenRecord.list()}" optionKey="id" value="${specimenRecordInstance?.parentSpecimen?.id}" class="many-to-one" noSelection="['null': '']"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="caseRecord"><g:message code="specimenRecord.caseRecord.label" default="Case Record" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: specimenRecordInstance, field: 'caseRecord', 'error')}">
                <g:select id="caseRecord" name="caseRecord.id" from="${nci.bbrb.cdr.datarecords.CaseRecord.list()}" optionKey="id" required="" value="${specimenRecordInstance?.caseRecord?.id}" class="many-to-one"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="specimenId"><g:message code="specimenRecord.specimenId.label" default="Specimen Id" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: specimenRecordInstance, field: 'specimenId', 'error')}">
                <g:textField name="specimenId" required="" value="${specimenRecordInstance?.specimenId}"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="tissueType"><g:message code="specimenRecord.tissueType.label" default="Tissue Type" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: specimenRecordInstance, field: 'tissueType', 'error')}">
                <g:select id="tissueType" name="tissueType.id" from="${nci.bbrb.cdr.staticmembers.TissueType.list()}" optionKey="id" required="" value="${specimenRecordInstance?.tissueType?.id}" class="many-to-one"/>

            </td>
        </tr>

        
        

        </tbody>
    </table>
</div>  
