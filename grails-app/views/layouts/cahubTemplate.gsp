
<g:set var="env" value="${grails.util.GrailsUtil.environment}"/>

<g:set var="homeLink" value="/cdrlite/home/choosehome" /><g:set var="homeTitle" value="CDR-Lite" />
<g:if test="${env != 'production'}"><%-- cache buster--%><g:set var="d" value="${new Date()}" /><g:set var="ts" value="${d.format('yyyy-MM-dd:HH')}" /></g:if>
    <!DOCTYPE html>
    <html>
        <head>
            <title><g:layoutTitle default="CDR-Lite"/></title>

        <script> function redirectToLogin(){
            window.location = '/cdrlite/logout';
            }
        </script>
        <g:layoutHead/>
    </head>
    <body>

  <!-- this is for the section above the  nav bar list  -->
        <div id="header">
            <div id="grailsLogoLink">   
                <a href="${homeLink}" title="${homeTitle}">${homeTitle}</a> 

            </div>
            <g:if test="${controllerName != 'login' && controllerName != 'logout' && controllerName != 'register'}">
            <div id="userInfo" class="clearfix">
                <div class="small"><span class="welcome">Welcome, ${session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername()}</span> <a href="javascript:redirectToLogin();">Logout</a></div>
                <div class="small">Org: ${session.org?.name}</div>   
                <div id="countdown" class="countdown hasCountdown">Session expires in: <b><span class="minutesleft"></span>:<span class="secondsleft"></span></b></div>
            </div>
            </g:if>

        </div>
        <!-- end of section above nav bar list -->


  <!-- now comes the customized body content for each page -->
        <g:layoutBody/>
         <!-- At the end of the page..standard footer information below -->
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
    </body>
</html>