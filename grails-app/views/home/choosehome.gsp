
<%@ page contentType="text/html;charset=UTF-8" %>
<g:set var="bodyclass" value="choosehome" scope="request"/>

<html>
  <head>
    <title><g:message code="CDR-Lite"/></title>
    <meta name="layout" content="cahubTemplate" />
    <asset:stylesheet src="cdrLite.css"/>      
  </head>
  <body>
<div id="nav" class="clearfix">
          <div id="navlist">
            
                 <g:if test="${session.authorities?.contains('ROLE_NCI-FREDERICK_CAHUB_SUPER') || session.authorities?.contains('ROLE_ADMIN')}">
                <g:link controller="backoffice" class="list" action="index">Back Office</g:link>             
            </g:if>             
            
            <g:if test="${session.authorities?.contains('ROLE_NCI-FREDERICK_CAHUB_DM') || session.DM}">
               <g:link controller="query" class="list" action="list">Query Tracker</g:link>
                <g:link controller="deviation" class="list" action="list">Deviation List</g:link>               
            </g:if> 

          </div>
      </div>
 
      
        <div class="containerDiv">
            
            
                 <div class="textAlignCenter">
            <h3>Choose your Destination</h3>
            </div>
                <div class="rowDiv clearfix">
             
                    <div class="cellDiv homeimg"><g:link controller="home" action="normalhome"><img src="../assets/normalthumb.jpg" alt="Normal"  ></g:link><br><span>Normal Home</span></div>
                    <div class="cellDiv homeimg"><g:link controller="home" action="diseaseHome"><img src="../assets/diseasethumb.jpg" alt="Disease" ></g:link><br> <span>Disease Home</span></div>
                    <div class="cellDiv homeimg"><g:link controller="home" action="diseaseHome"><img src="../assets/ctcthumb.jpg" alt="Plasma" ></g:link> <br><span>Plasma Home</span></div>
                </div>
                
                
        </div><!--end containerDiv-->

 
        
  
   
</body>
</html>
