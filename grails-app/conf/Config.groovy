grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}




//pmh testing added more here . will remove later

grails.plugin.springsecurity.ui.register.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.register.emailSubject = 'caHUB CDR-DS Password Reset'

grails.plugin.springsecurity.ui.forgotPassword.emailBody = 'Dear $user.username,<br/><br/>You recently requested that your caHUB CDR account password be reset.<br/><br/>Please click <a href="$url">here</a> to reset your password, if you did request a password change. Otherwise, ignore this email and no change will be applied to your account.<br/><br/>caHUB CDR Administrator'
grails.plugin.springsecurity.ui.forgotPassword.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.forgotPassword.emailSubject = 'caHUB CDR Account Password Reset'

grails.plugin.springsecurity.ui.expiredPassword.emailBody = 'Dear $username,<br/><br/>Your caHUB CDR account password is expired.<br/><br/>Please click <a href="$url">here</a> to change your password.<br/><br/>caHUB CDR Administrator'
grails.plugin.springsecurity.ui.expiredPassword.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.expiredPassword.emailSubject = 'caHUB CDR Account Password Expired'

grails.plugin.springsecurity.ui.expiredPassword.reminder.emailBody = 'Dear $username,<br/><br/>Your caHUB CDR account password expires on $expireDate, which is $daysRemain from today.<br/><br/>Please click <a href="$url">here</a> to change your password before it expires.<br/><br/>caHUB CDR Administrator'
grails.plugin.springsecurity.ui.expiredPassword.reminder.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.expiredPassword.reminder.emailSubject = 'Reminder: caHUB CDR Account Password Expiration'

//pessimistic lockdown setting, so you need to ALLOW all roles on URLs
grails.plugin.springsecurity.rejectIfNoRule = true

//pmh 04/02/15 testing the @secured annotations 
grails.plugin.springsecurity.securityConfigType = "Annotation"

grails.assets.bundle=true
grails.plugin.springsecurity.controllerAnnotations.staticRules = [

 //leave these alone.  these rules are needed for everyting to work properly
    '/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/logout/**': ['IS_AUTHENTICATED_FULLY'],
    '/register/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/plugins/**': ['IS_AUTHENTICATED_ANONYMOUSLY', 'IS_AUTHENTICATED_FULLY'],
    '/images/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/css/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/js/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	//webapp controllers
    '/home/**': ['IS_AUTHENTICATED_FULLY']
]



// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'nci.bbrb.cdr.authservice.CdrUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'nci.bbrb.cdr.authservice.CdrUserRole'
grails.plugin.springsecurity.authority.className = 'nci.bbrb.cdr.authservice.CdrRole'

//grails.plugin.springsecurity.userLookup.userDomainClassName = 'nci.bbrb.cdr.authservice.User'
//grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'nci.bbrb.cdr.authservice.UserRole'
//grails.plugin.springsecurity.authority.className = 'nci.bbrb.cdr.authservice.Role'


grails.plugin.springsecurity.fii.rejectPublicInvocations = false


//grails.plugin.springsecurity.useSecurityEventListener = true
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/home'
// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}




