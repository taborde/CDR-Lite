<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title><g:message code="CDR-Lite"/></title>
    <meta name="layout" content="cahubTemplate" />
    <asset:stylesheet src="cdrLite.css"/>      
  </head>
  <body>

  <!-- this is for the section above the  nav bar list  -->
  <div class="headerDiv">
    <g:if test="${controllerName != 'login' && controllerName != 'logout' }">
      <div id="userInfo" class="clearfix">
      <div class="small"><span class="welcome">Welcome, ${session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()}</span> <a href="javascript:redirectToLogin();">Logout</a></div>
      <div class="small">Org: ${session.org?.name}</div>   
      <div id="countdown" class="countdown hasCountdown">Session expires in: <b><span class="minutesleft"></span>:<span class="secondsleft"></span></b></div>
      </div>
    </g:if>
  </div>
  <!-- end of section above nav bar list -->

  <div class="clear"></div>

  <div id="navbar">NAVBAR</div>
  <div class="containerDiv">

  <div class="rowDivHeader">
    <div class="cellDivHeader"><g:link controller="home" action="normalhome"><img src="../assets/normalthumb.jpg" alt="Normal" ></g:link></div>
    <div class="cellDivHeader"><img src="../assets/brnthumb.jpg" alt="Disease" > </div>
    <div class="cellDivHeader"><img src="../assets/ctcthumb.jpg" alt="Plasma" > </div>
  </div>

  <div class="rowDiv">
      <div class="cellDiv">Normal</div>
    <div class="cellDiv">Disease</div>
    <div class="cellDiv">Plasma</div>
  </div>
  </div>

   
</body>
</html>
