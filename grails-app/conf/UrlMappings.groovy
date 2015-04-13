class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        //"500"(view:"/error")
        "500"(controller: 'errors', action: 'error500')
        "403"(controller: 'errors', action: 'error500')
        "401"(controller: 'errors', action: 'error500')
        "404"(controller: 'errors', action: 'error404')
        
        
        
        //Landing page URLs
        "/"(controller:"home",action:"homedispatcher")
        "/home"(controller:"home",action:"homedispatcher")
	}
}
