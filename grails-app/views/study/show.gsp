<!DOCTYPE html>
<%@ page import="nci.bbrb.cdr.study.Study" %>
<%--<g:set var="bodyclass" value="study show" scope="request"/> --%>
<html>

<html>
  <head>
    <meta name="layout" content="cahubTemplate"/>
  <%--<g:set var="entityName" value="${studyInstance?.formMetadata?.cdrFormName}" /> --%>
  
   <g:set var="entityName" value="Study" />

  <title>Show Study /></title>
</head>
<body>
  <div id="nav" class="clearfix">
    <div id="navlist">
      <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>  
    </div>
  </div>
 <div id="container" class="clearfix">
    <h1>Show Study</h1>
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>

    <div id="show" >
      <div class="dialog">
        <g:render template="formShow" />
      </div>
    </div>
    <g:if test="${studyInstance?.dateCreated }">
      <div class="buttons">
        <g:form>
          <g:hiddenField name="id" value="${studyInstance?.id}" />
          <span class="button"><g:actionSubmit class="edit" action="resumeEditing" value="${message(code: 'default.button.resumeEditing.label', default: 'Resume Editing')}" /></span>
         </g:form>
      </div>
    </g:if>
  </div>
</body>
</html>


