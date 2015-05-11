
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
        <div id='login'>
            <div class='inner'>
                <%--<div class='fheader'><g:message code="springSecurity.login.header"/></div> --%>
                <div class='fheader'>CDR-Lite Data Services Login</div>

                <g:if test='${flash.message}'>
                    <div class='login_message'>${flash.message}</div>
                </g:if>

                <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                    <p>
                        <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                        <input type='text' class='text_' name='j_username' id='username'/>
                    </p>

                    <p>
                        <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                        <input type='password' class='text_' name='j_password' id='password'/>
                    </p>
<%--
                    <p id="remember_me_holder">
                        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                    </p>
--%>
                    <p>
                        <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
                    </p>
                   
                    </form>
                    <div id="important_link"> 
                        <h3>Important links</h3>
                        <ul>

                            <li><g:link controller="register" action="forgotPassword">Reset or Forgot Password?</g:link> </li>
                                <li><a href="mailto:pushpa.hariharan@nih.gov">Request technical assistance via email</a><br /><i>(A support response will be provided by the end of the next business day, 8am-5pm Eastern)</i></li>
                            </ul>
                        </div>
                    
                </div>
            </div><!-- end login -->


    </div> <!-- end body wrapper -->

</body>
</html>