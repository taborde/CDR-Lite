
<g:set var="bodyclass" value="diseaseHome home" scope="request"/>
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

    <div class="body_wrapper">

<!-- place any content here -->
       <p id="textAlignCenter"> This is the Disease home page</p>
      <br>
            <div><g:link controller="caseRecord" class="list" action="index">Case Home</g:link> </div>
        <br>
        <div> <g:link controller="candidateRecord" class="list" action="index">Candidate Home</g:link> </div>
     

    </div>

</body>
</html>
