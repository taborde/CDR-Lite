
<g:set var="bodyclass" value="diseaseHome home" scope="request"/>
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

    <div  class="navbarcontainer">

        <div id="nav" class="clearfix">
            <div id="navlist" >back office</div>
        </div>
        <div><span> This is the Disease home page</span></div>
        <div id="footer">
            <div id="vers"><div id="verstext">caHUB CDR Lite Version 1
                    <ul class="footerlogos ">
                        <li class="footer_cahub"><a target="_blank" href="http://cahub.cancer.gov" title="caHUB" >caHUB</a></li>
                        <li class="footer_nci"><a target="_blank" href="http://www.cancer.gov/" title="NCI - National Cancer Institute">National Cancer Institute</a></li>
                        <li class="footer_leidos"><a target="_blank" href="http://www.leidos.com/about/companies/leidos-biomedical-research" title="Leidos Biomedical Research Inc.">Leidos Biomedical Research Inc.</a></li>        
                        <li class="footer_nih"><a target="_blank" href="http://www.nih.gov/" title="NIH - National Institutes of Health">National Institutes of Health</a></li>
                        <li class="footer_dop"><a target="_blank" href="http://www.hhs.gov/" title="HHS - U.S. Department of Health &amp; Human Services">U.S. Department of Health &amp; Human Services</a></li>
                        <li class="footer_usagov"><a target="_blank" href="http://www.usa.gov/" title="USA.gov">USA.gov</a></li>

                    </ul>



                </div></div>


        </div>

    </div><!--end navbarcontainer-->



</body>
</html>
