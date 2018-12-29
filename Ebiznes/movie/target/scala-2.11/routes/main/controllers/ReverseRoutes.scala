
// @GENERATOR:play-routes-compiler
// @SOURCE:F:/3.UJ(LICENCJAT)/SEMESTR VIII/Ebiznes/movie/conf/routes
// @DATE:Mon Jun 19 13:26:50 CEST 2017

import play.api.mvc.{ QueryStringBindable, PathBindable, Call, JavascriptLiteral }
import play.core.routing.{ HandlerDef, ReverseRouteContext, queryString, dynamicString }


import _root_.controllers.Assets.Asset

// @LINE:6
package controllers {

  // @LINE:46
  class ReverseAssets(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:46
    def at(file:String): Call = {
      implicit val _rrc = new ReverseRouteContext(Map(("path", "/public")))
      Call("GET", _prefix + { _defaultPrefix } + "assets/" + implicitly[PathBindable[String]].unbind("file", file))
    }
  
  }

  // @LINE:40
  class ReverseSocialAuthController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:40
    def authenticate(provider:String): Call = {
    
      (provider: @unchecked) match {
      
        // @LINE:40
        case (provider)  =>
          import ReverseRouteContext.empty
          Call("GET", _prefix + { _defaultPrefix } + "authenticate/" + implicitly[PathBindable[String]].unbind("provider", dynamicString(provider)))
      
      }
    
    }
  
    // @LINE:43
    def logoutUser(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "logout")
    }
  
    // @LINE:42
    def getLoggedUser(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "getLoggedUser")
    }
  
  }

  // @LINE:24
  class ReverseCartController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:25
    def apiNewCart(): Call = {
      import ReverseRouteContext.empty
      Call("POST", _prefix + { _defaultPrefix } + "api/cart/")
    }
  
    // @LINE:24
    def apiGetById(id:String): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/cart/" + implicitly[PathBindable[String]].unbind("id", dynamicString(id)) + "/")
    }
  
    // @LINE:27
    def apiDeleteCartById(id:String): Call = {
      import ReverseRouteContext.empty
      Call("DELETE", _prefix + { _defaultPrefix } + "api/carts/" + implicitly[PathBindable[String]].unbind("id", dynamicString(id)) + "/")
    }
  
    // @LINE:26
    def apiDeleteCart(id:Long): Call = {
      import ReverseRouteContext.empty
      Call("DELETE", _prefix + { _defaultPrefix } + "api/cart/" + implicitly[PathBindable[Long]].unbind("id", id) + "/")
    }
  
  }

  // @LINE:9
  class ReverseMovieController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:12
    def apiDeleteMovie(id:Long): Call = {
      import ReverseRouteContext.empty
      Call("DELETE", _prefix + { _defaultPrefix } + "api/movie/" + implicitly[PathBindable[Long]].unbind("id", id) + "/")
    }
  
    // @LINE:9
    def apiGetAll(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/movie/")
    }
  
    // @LINE:11
    def apiNewMovie(): Call = {
      import ReverseRouteContext.empty
      Call("POST", _prefix + { _defaultPrefix } + "api/movie/")
    }
  
    // @LINE:16
    def apiSearchBySearch(search:String, site:Int): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/search/" + implicitly[PathBindable[String]].unbind("search", dynamicString(search)) + "//" + implicitly[PathBindable[Int]].unbind("site", site) + "/")
    }
  
    // @LINE:10
    def apiMovie(id:Long): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/movie/" + implicitly[PathBindable[Long]].unbind("id", id) + "/")
    }
  
    // @LINE:15
    def apiSearch(search:String, genre:String, site:Int): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/search/" + implicitly[PathBindable[String]].unbind("search", dynamicString(search)) + "/" + implicitly[PathBindable[String]].unbind("genre", dynamicString(genre)) + "/" + implicitly[PathBindable[Int]].unbind("site", site) + "/")
    }
  
    // @LINE:17
    def apiSearchByGenre(genre:String, site:Int): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/search//" + implicitly[PathBindable[String]].unbind("genre", dynamicString(genre)) + "/" + implicitly[PathBindable[Int]].unbind("site", site) + "/")
    }
  
    // @LINE:21
    def apiGetGenres(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/genres/")
    }
  
    // @LINE:13
    def apiUpdateMovie(): Call = {
      import ReverseRouteContext.empty
      Call("PUT", _prefix + { _defaultPrefix } + "api/movie/")
    }
  
    // @LINE:20
    def apiMovies(id:Long): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/movies/" + implicitly[PathBindable[Long]].unbind("id", id) + "/")
    }
  
    // @LINE:18
    def apiSearchBySite(site:Int): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/search///" + implicitly[PathBindable[Int]].unbind("site", site) + "/")
    }
  
  }

  // @LINE:35
  class ReverseUserController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:36
    def getAll(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "registereduser/")
    }
  
    // @LINE:35
    def getByIdUser(id:String): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "user/" + implicitly[PathBindable[String]].unbind("id", dynamicString(id)))
    }
  
    // @LINE:37
    def deleteUser(id:String): Call = {
      import ReverseRouteContext.empty
      Call("DELETE", _prefix + { _defaultPrefix } + "registereduser/" + implicitly[PathBindable[String]].unbind("id", dynamicString(id)) + "/")
    }
  
  }

  // @LINE:6
  class ReverseApplication(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:6
    def index(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix)
    }
  
  }

  // @LINE:30
  class ReverseOrderController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:32
    def apiDeleteOrder(id:Long): Call = {
      import ReverseRouteContext.empty
      Call("DELETE", _prefix + { _defaultPrefix } + "api/order/" + implicitly[PathBindable[Long]].unbind("id", id) + "/")
    }
  
    // @LINE:30
    def apiGetAll(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "api/order/")
    }
  
    // @LINE:31
    def apiNewOrder(): Call = {
      import ReverseRouteContext.empty
      Call("POST", _prefix + { _defaultPrefix } + "api/order/")
    }
  
  }


}
