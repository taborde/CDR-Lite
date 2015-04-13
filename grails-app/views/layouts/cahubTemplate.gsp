
<g:set var="env" value="${grails.util.GrailsUtil.environment}"/>
<%--<g:set var="appMilestone" value="${nci.obbr.cahub.util.AppSetting.findByCode('APP_RELEASE_MILESTONE')?.bigValue}"/> %-->

<%--<g:if test="${homeLink == null || homeLink == ''}" ><g:if test="${session.org?.code == 'OBBR'}" ><g:set var="homeLink" value="/cahubdataservices/home/choosehome" /><g:set var="homeTitle" value="caHUB" /></g:if> <g:else><g:set var="homeLink" value="/cahubdataservices/home" /><g:set var="homeTitle" value="caHUB" /></g:else></g:if>--%>
<g:if test="${env != 'production'}"><%-- cache buster--%><g:set var="d" value="${new Date()}" /><g:set var="ts" value="${d.format('yyyy-MM-dd:HH')}" /></g:if>
    <!DOCTYPE html>
    <html>
        <head>
            <title><g:layoutTitle default="CDR-Lite"/></title>
        <style>
            #navbar {background-color:#ffe0e0;text-align: center;}
            #footer {background-color:#e0e0ff;text-align: center;}

        </style>
        <script> function redirectToLogin(){
            window.location = '/cdrlite/logout';
            }
        </script>
        <g:layoutHead/>
    </head>
    <body>

        <g:layoutBody/>
        <div id="footer">FOOTER</div>
    </body>
</html>