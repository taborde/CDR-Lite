<%@ page import="nci.bbrb.cdr.util.AppSetting" %>

<g:set var="homeTitle" value="caHUB" scope="request"/>


<head>
  <meta name='layout' content='cahubTemplate' />
</head>
<body>
 <div id="nav" class="clearfix">
    <div id="navlist"></div>
    <g:link controller="candidateRecord" class="list" action="create">Add a Candidate</g:link>     
 </div>
 <div id="container" class="clearfix">
  <div id="homemenu">
    
    <g:if test='${flash.message}'><div id="message" class="redtext">${flash.message}</div></g:if>
    
     <div class="list">
          <g:render template="/caseRecord/caseRecordTable_tmpl" bean="${caseRecordInstanceList}"/>
          <div class="clearfix tablefooter"><div class="left">Most recently created on top</div><div class="right"><a href="/cdrlite/caseRecord">View all Cases >></a></td></div></div>
          <g:render template="/candidateRecord/candidateRecordTable_tmpl" bean="${candidateRecordInstanceList}" />
          <div class="clearfix tablefooter"><div class="left">Most recently created on top</div><div class="right"><a href="/cdrlite/candidateRecord">View all Cases >></a></td></div></div>               
                           
      </div>
  </div><!-- end homemenu --> 
 </div><!-- end container --> 
</body>
