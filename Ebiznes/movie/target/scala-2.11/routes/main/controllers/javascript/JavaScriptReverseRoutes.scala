
// @GENERATOR:play-routes-compiler
// @SOURCE:F:/3.UJ(LICENCJAT)/SEMESTR VIII/Ebiznes/movie/conf/routes
// @DATE:Mon Jun 19 13:26:50 CEST 2017

import play.api.routing.JavaScriptReverseRoute
import play.api.mvc.{ QueryStringBindable, PathBindable, Call, JavascriptLiteral }
import play.core.routing.{ HandlerDef, ReverseRouteContext, queryString, dynamicString }


import _root_.controllers.Assets.Asset

// @LINE:6
package controllers.javascript {
  import ReverseRouteContext.empty

  // @LINE:46
  class ReverseAssets(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:46
    def at: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.Assets.at",
      """
        function(file1) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "assets/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("file", file1)})
        }
      """
    )
  
  }

  // @LINE:40
  class ReverseSocialAuthController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:40
    def authenticate: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.SocialAuthController.authenticate",
      """
        function(provider0) {
        
          if (true) {
            return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "authenticate/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("provider", encodeURIComponent(provider0))})
          }
        
        }
      """
    )
  
    // @LINE:43
    def logoutUser: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.SocialAuthController.logoutUser",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "logout"})
        }
      """
    )
  
    // @LINE:42
    def getLoggedUser: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.SocialAuthController.getLoggedUser",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "getLoggedUser"})
        }
      """
    )
  
  }

  // @LINE:24
  class ReverseCartController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:25
    def apiNewCart: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.CartController.apiNewCart",
      """
        function() {
          return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "api/cart/"})
        }
      """
    )
  
    // @LINE:24
    def apiGetById: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.CartController.apiGetById",
      """
        function(id0) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/cart/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("id", encodeURIComponent(id0)) + "/"})
        }
      """
    )
  
    // @LINE:27
    def apiDeleteCartById: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.CartController.apiDeleteCartById",
      """
        function(id0) {
          return _wA({method:"DELETE", url:"""" + _prefix + { _defaultPrefix } + """" + "api/carts/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("id", encodeURIComponent(id0)) + "/"})
        }
      """
    )
  
    // @LINE:26
    def apiDeleteCart: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.CartController.apiDeleteCart",
      """
        function(id0) {
          return _wA({method:"DELETE", url:"""" + _prefix + { _defaultPrefix } + """" + "api/cart/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id0) + "/"})
        }
      """
    )
  
  }

  // @LINE:9
  class ReverseMovieController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:12
    def apiDeleteMovie: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiDeleteMovie",
      """
        function(id0) {
          return _wA({method:"DELETE", url:"""" + _prefix + { _defaultPrefix } + """" + "api/movie/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id0) + "/"})
        }
      """
    )
  
    // @LINE:9
    def apiGetAll: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiGetAll",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/movie/"})
        }
      """
    )
  
    // @LINE:11
    def apiNewMovie: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiNewMovie",
      """
        function() {
          return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "api/movie/"})
        }
      """
    )
  
    // @LINE:16
    def apiSearchBySearch: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiSearchBySearch",
      """
        function(search0,site1) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/search/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("search", encodeURIComponent(search0)) + "//" + (""" + implicitly[PathBindable[Int]].javascriptUnbind + """)("site", site1) + "/"})
        }
      """
    )
  
    // @LINE:10
    def apiMovie: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiMovie",
      """
        function(id0) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/movie/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id0) + "/"})
        }
      """
    )
  
    // @LINE:15
    def apiSearch: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiSearch",
      """
        function(search0,genre1,site2) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/search/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("search", encodeURIComponent(search0)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("genre", encodeURIComponent(genre1)) + "/" + (""" + implicitly[PathBindable[Int]].javascriptUnbind + """)("site", site2) + "/"})
        }
      """
    )
  
    // @LINE:17
    def apiSearchByGenre: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiSearchByGenre",
      """
        function(genre0,site1) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/search//" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("genre", encodeURIComponent(genre0)) + "/" + (""" + implicitly[PathBindable[Int]].javascriptUnbind + """)("site", site1) + "/"})
        }
      """
    )
  
    // @LINE:21
    def apiGetGenres: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiGetGenres",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/genres/"})
        }
      """
    )
  
    // @LINE:13
    def apiUpdateMovie: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiUpdateMovie",
      """
        function() {
          return _wA({method:"PUT", url:"""" + _prefix + { _defaultPrefix } + """" + "api/movie/"})
        }
      """
    )
  
    // @LINE:20
    def apiMovies: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiMovies",
      """
        function(id0) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/movies/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id0) + "/"})
        }
      """
    )
  
    // @LINE:18
    def apiSearchBySite: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.MovieController.apiSearchBySite",
      """
        function(site0) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/search///" + (""" + implicitly[PathBindable[Int]].javascriptUnbind + """)("site", site0) + "/"})
        }
      """
    )
  
  }

  // @LINE:35
  class ReverseUserController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:36
    def getAll: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.UserController.getAll",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "registereduser/"})
        }
      """
    )
  
    // @LINE:35
    def getByIdUser: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.UserController.getByIdUser",
      """
        function(id0) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "user/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("id", encodeURIComponent(id0))})
        }
      """
    )
  
    // @LINE:37
    def deleteUser: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.UserController.deleteUser",
      """
        function(id0) {
          return _wA({method:"DELETE", url:"""" + _prefix + { _defaultPrefix } + """" + "registereduser/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("id", encodeURIComponent(id0)) + "/"})
        }
      """
    )
  
  }

  // @LINE:6
  class ReverseApplication(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:6
    def index: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.Application.index",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + """"})
        }
      """
    )
  
  }

  // @LINE:30
  class ReverseOrderController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:32
    def apiDeleteOrder: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.OrderController.apiDeleteOrder",
      """
        function(id0) {
          return _wA({method:"DELETE", url:"""" + _prefix + { _defaultPrefix } + """" + "api/order/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id0) + "/"})
        }
      """
    )
  
    // @LINE:30
    def apiGetAll: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.OrderController.apiGetAll",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "api/order/"})
        }
      """
    )
  
    // @LINE:31
    def apiNewOrder: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.OrderController.apiNewOrder",
      """
        function() {
          return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "api/order/"})
        }
      """
    )
  
  }


}
