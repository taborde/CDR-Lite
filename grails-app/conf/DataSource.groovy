dataSource {
    pooled = true
    jmxExport = true
//    driverClassName = "org.h2.Driver"
//    driverClassName = "com.mysql.jdbc.Driver"
    driverClassName = "org.postgresql.Driver"
    dialect = "org.hibernate.dialect.PostgreSQLDialect"
//    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
//    username = "sa"
//    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 
   
}

// environment specific settings
environments {
    development {
        dataSource {
                     dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
                     url = "jdbc:postgresql://localhost:5432/cdrlite"  
                     username = "cdr"
                     password = "admin"
                     
                     //dbCreate = "create" // one of 'create', 'create-drop', 'update', 'validate', ''
		     //url = "jdbc:postgresql://nci-01870559-l.nci.nih.gov:5432/cdrlite2"  
		     //url = "jdbc:postgresql://137.187.205.56:5432/cdrlite2"  
		     //username = "postgres"
                     //password = "uks69956"

        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    /*
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
    */
}
