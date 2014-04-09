class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

	"/"(controller:'bucket',action:"/list")
        "500"(view:'/error')
	}
}
