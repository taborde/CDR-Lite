grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    //form:          'application/x-www-form-urlencoded',
    //pmh 05/07/15: use this to make dynamic scaffold work. comment out the above line
    form:          ['application/x-www-form-urlencoded','multipart/form-data'],
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

// New for grails 2.4.4 -- output from the jqueryDatePicker tag lib no longer binds to Date attributes on a domain class, unless you update the default binding strategy
grails.databinding.dateFormats = ['MM/dd/yyyy', 'yyyy-MM-dd HH:mm:ss.S', "yyyy-MM-dd'T'hh:mm:ss'Z'"]

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


//pmh this is required for emails etc..

environments {
    development {
        grails.logging.jul.usebridge = true
        grails.mail.host = "mailfwd.nih.gov"
        grails.mail.port="25"
        grails.mail.default.from="pushpa.hariharan@nih.gov"
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com" : not sure about this yet 
        //TODO: pmh: set up mail.host info for PROD
    }
}

grails.plugin.springsecurity.filterChain.chainMap = [
   '/rest/**': 'JOINED_FILTERS,-exceptionTranslationFilter',
   '/**': 'JOINED_FILTERS,-basicAuthenticationFilter,-basicExceptionTranslationFilter'
]

grails.plugin.springsecurity.useBasicAuth = true
grails.plugin.springsecurity.basic.realmName = "CDR Data Services"

grails.plugin.springsecurity.ui.register.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.forgotPassword.emailFrom ='pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.register.emailSubject = 'CDR-Lite Password Reset'

grails.plugin.springsecurity.ui.forgotPassword.emailBody = 'Dear $user.username,<br/><br/>You recently requested that your CDR-Lite password be reset.<br/><br/>Please click <a href="$url">here</a> to reset your password, if you did request a password change. Otherwise, ignore this email and no change will be applied to your account.<br/><br/>CDR-Lite Administrator'
grails.plugin.springsecurity.ui.forgotPassword.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.forgotPassword.emailSubject = 'CDR-Lite Account Password Reset'

grails.plugin.springsecurity.ui.expiredPassword.emailBody = 'Dear $username,<br/><br/>Your CDR-Lite account password is expired.<br/><br/>Please click <a href="$url">here</a> to change your password.<br/><br/>CDR-Lite Administrator'
grails.plugin.springsecurity.ui.expiredPassword.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.expiredPassword.emailSubject = 'CDR-Lite Account Password Expired'

grails.plugin.springsecurity.ui.expiredPassword.reminder.emailBody = 'Dear $username,<br/><br/>Your CDR-Lite account password expires on $expireDate, which is $daysRemain from today.<br/><br/>Please click <a href="$url">here</a> to change your password before it expires.<br/><br/>CDR-Lite Administrator'
grails.plugin.springsecurity.ui.expiredPassword.reminder.emailFrom = 'pushpa.hariharan@nih.gov'
grails.plugin.springsecurity.ui.expiredPassword.reminder.emailSubject = 'Reminder: CDR-Lite Account Password Expiration'
//pessimistic lockdown setting, so you need to ALLOW all roles on URLs
grails.plugin.springsecurity.rejectIfNoRule = true

//pmh 04/02/15 testing the @secured annotations 
grails.plugin.springsecurity.securityConfigType = "Annotation"

grails.assets.bundle=true
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
    //system setting controllers
    '/user/**': ['ROLE_ADMIN','ROLE_SUPER'],
    '/role/**': ['ROLE_ADMIN','ROLE_SUPER'],
    '/userRole/**': ['ROLE_ADMIN','ROLE_SUPER'],
    '/securityInfo/**': ['ROLE_ADMIN','ROLE_SUPER'],
    '/controllers.gsp':['ROLE_ADMIN','ROLE_SUPER'],
    '/backoffice/**':['ROLE_ADMIN','ROLE_SUPER'],
    '/auditLogEvent/**':['ROLE_ADMIN','ROLE_SUPER'],
    '/userLogin/**': ['ROLE_ADMIN','ROLE_SUPER','ROLE_DM'],
    '/privilege/**':['ROLE_ADMIN','ROLE_SUPER','ROLE_DM','ROLE_PRC','ROLE_LDS'],
    
    //leave these alone.  these rules are needed for everyting to work properly
    '/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/logout/**': ['IS_AUTHENTICATED_FULLY'],
    '/register/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/plugins/**': ['IS_AUTHENTICATED_ANONYMOUSLY', 'IS_AUTHENTICATED_FULLY'],
    '/images/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/css/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
    '/js/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	//webapp controllers
    '/home/**': ['IS_AUTHENTICATED_FULLY'],
    '/appSetting/**': ['IS_AUTHENTICATED_FULLY'],
    '/caseRecord/**': ['IS_AUTHENTICATED_FULLY'],
    '/candidateRecord/**': ['IS_AUTHENTICATED_FULLY'],
    '/specimenRecord/**': ['IS_AUTHENTICATED_FULLY'],
    '/study/**': ['IS_AUTHENTICATED_FULLY'],
    '/bss/**': ['IS_AUTHENTICATED_FULLY'],
    '/user/**': ['IS_AUTHENTICATED_FULLY'],
    '/role/**': ['IS_AUTHENTICATED_FULLY'],
    '/activityType/**':['IS_AUTHENTICATED_FULLY'],
    '/activityEvent/**': ['IS_AUTHENTICATED_FULLY'],
    '/activitycenter/**': ['IS_AUTHENTICATED_FULLY'],
    '/textSearch/**': ['IS_AUTHENTICATED_FULLY'],
    '/textSearch/index_all': ['ROLE_ADMIN'],
    '/query/**': ['ROLE_BSS_UUU', 'ROLE_DM','ROLE_SUPER','ROLE_ADMIN','ROLE_ORG_VARI','ROLE_ORG_BROAD','ROLE_ORG_MBB'],
    '/fileUpload/**': ['ROLE_ADMIN'],
    '/caseAttachmentType/**':['ROLE_ADMIN'],
    '/prcReport/**': ['ROLE_PRC','ROLE_ADMIN'],
    '/prcReport/view': ['ROLE_PRC','ROLE_ADMIN', 'ROLE_DCC'],
     '/rest/**': ['ROLE_ADMIN']


    
]



// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'nci.bbrb.cdr.authservice.CdrUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'nci.bbrb.cdr.authservice.CdrUserRole'
grails.plugin.springsecurity.authority.className = 'nci.bbrb.cdr.authservice.CdrRole'

//grails.plugin.springsecurity.userLookup.userDomainClassName = 'nci.bbrb.cdr.authservice.User'
//grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'nci.bbrb.cdr.authservice.UserRole'
//grails.plugin.springsecurity.authority.className = 'nci.bbrb.cdr.authservice.Role'



grails.plugin.springsecurity.fii.rejectPublicInvocations = false


grails.plugin.springsecurity.useSecurityEventListener = true
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




