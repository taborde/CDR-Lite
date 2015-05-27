<%@ page import="nci.bbrb.cdr.study.Study" %>
<!DOCTYPE html>
<html>
   <head>
        <meta name='layout' content='cahubTemplate' />
        <g:set var="entityName" value="${message(code: 'study.label', default: 'Study')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="nav" class="clearfix">
            <div id="navlist"></div>
            <g:link controller="home" class="list" action="studyHome">Home</g:link> 

        </div>
        <div id="container" class="clearfix">

            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test='${flash.message}'><div id="message" class="redtext">${flash.message}</div></g:if>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${studyInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${studyInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${studyInstance?.id}" />
                <div class="dialog">
                    <g:render template="form"/>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.save.label', default: 'Save')}" /></span>
                    <g:if test="${canSubmit == 'Yes'}">
                        <span class="button"><g:actionSubmit class="save" action="submit" value="${message(code: 'default.button.submit.label', default: 'Submit')}" onclick="return checkModification()" /></span>
                    </g:if> 

                    <span class="button"><input class="delete" type="button" value="Cancel" onclick="if(confirm('${message(code: 'default.button.cancel.confirm.message', default: 'Discard unsaved data?')}'))window.location.href='${createLink(uri: '/')}${params.controller}/edit/${params.id}';"></input></span>
                </div>
            </g:form>


        </div><!-- end container --> 
    </body>

</html>