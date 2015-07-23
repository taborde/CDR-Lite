<%@ page import="nci.bbrb.cdr.staticmembers.Study" %>


<div class="dialog">
    <table>
        <tbody>

            
        <tr class="prop">
            <td valign="top" class="name">
                <label for="name"><g:message code="study.name.label" default="Name" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: studyInstance, field: 'name', 'error')}">
                <g:textField name="name" required="" value="${studyInstance?.name}"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="code"><g:message code="study.code.label" default="Code" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: studyInstance, field: 'code', 'error')}">
                <g:textField name="code" value="${studyInstance?.code}"/>

            </td>
        </tr>

        
        <tr class="prop">
            <td valign="top" class="name">
                <label for="description"><g:message code="study.description.label" default="Description" /></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: studyInstance, field: 'description', 'error')}">
                <g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${studyInstance?.description}"/>

            </td>
        </tr>

        
        

        </tbody>
    </table>
</div>  
