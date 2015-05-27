<%@ page import="nci.bbrb.cdr.util.AppSetting" %>

<g:set var="homeTitle" value="caHUB" scope="request"/>


<head>
  <meta name='layout' content='cahubTemplate' />
</head>
<body>
 <div id="nav" class="clearfix">
    <div id="navlist"></div>
    <g:link controller="study" class="list" action="create">Add a Study</g:link>     
 </div>
 <div id="container" class="clearfix">
  <div id="homemenu">
    
    <g:if test='${flash.message}'><div id="message" class="redtext">${flash.message}</div></g:if>
    
     <div class="list">
          <g:render template="/study/studyListTemplate" bean="${studyInstanceList}"/>
                          
                           
      </div>
  </div><!-- end homemenu --> 
 </div><!-- end container --> 
</body>
