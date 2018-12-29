
// @GENERATOR:play-routes-compiler
// @SOURCE:F:/3.UJ(LICENCJAT)/SEMESTR VIII/Ebiznes/movie/conf/routes
// @DATE:Mon Jun 19 13:26:50 CEST 2017

package router

import play.core.routing._
import play.core.routing.HandlerInvokerFactory._
import play.core.j._

import play.api.mvc._

import _root_.controllers.Assets.Asset

class Routes(
  override val errorHandler: play.api.http.HttpErrorHandler, 
  // @LINE:6
  Application_6: javax.inject.Provider[controllers.Application],
  // @LINE:9
  MovieController_3: javax.inject.Provider[controllers.MovieController],
  // @LINE:24
  CartController_2: javax.inject.Provider[controllers.CartController],
  // @LINE:30
  OrderController_1: javax.inject.Provider[controllers.OrderController],
  // @LINE:35
  UserController_0: javax.inject.Provider[controllers.UserController],
  // @LINE:40
  SocialAuthController_5: controllers.SocialAuthController,
  // @LINE:46
  Assets_4: controllers.Assets,
  val prefix: String
) extends GeneratedRouter {

   @javax.inject.Inject()
   def this(errorHandler: play.api.http.HttpErrorHandler,
    // @LINE:6
    Application_6: javax.inject.Provider[controllers.Application],
    // @LINE:9
    MovieController_3: javax.inject.Provider[controllers.MovieController],
    // @LINE:24
    CartController_2: javax.inject.Provider[controllers.CartController],
    // @LINE:30
    OrderController_1: javax.inject.Provider[controllers.OrderController],
    // @LINE:35
    UserController_0: javax.inject.Provider[controllers.UserController],
    // @LINE:40
    SocialAuthController_5: controllers.SocialAuthController,
    // @LINE:46
    Assets_4: controllers.Assets
  ) = this(errorHandler, Application_6, MovieController_3, CartController_2, OrderController_1, UserController_0, SocialAuthController_5, Assets_4, "/")

  import ReverseRouteContext.empty

  def withPrefix(prefix: String): Routes = {
    router.RoutesPrefix.setPrefix(prefix)
    new Routes(errorHandler, Application_6, MovieController_3, CartController_2, OrderController_1, UserController_0, SocialAuthController_5, Assets_4, prefix)
  }

  private[this] val defaultPrefix: String = {
    if (this.prefix.endsWith("/")) "" else "/"
  }

  def documentation = List(
    ("""GET""", this.prefix, """@controllers.Application@.index"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/movie/""", """@controllers.MovieController@.apiGetAll"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/movie/""" + "$" + """id<[^/]+>/""", """@controllers.MovieController@.apiMovie(id:Long)"""),
    ("""POST""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/movie/""", """@controllers.MovieController@.apiNewMovie"""),
    ("""DELETE""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/movie/""" + "$" + """id<[^/]+>/""", """@controllers.MovieController@.apiDeleteMovie(id:Long)"""),
    ("""PUT""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/movie/""", """@controllers.MovieController@.apiUpdateMovie"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/search/""" + "$" + """search<[^/]+>/""" + "$" + """genre<[^/]+>/""" + "$" + """site<[^/]+>/""", """@controllers.MovieController@.apiSearch(search:String, genre:String, site:Int)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/search/""" + "$" + """search<[^/]+>//""" + "$" + """site<[^/]+>/""", """@controllers.MovieController@.apiSearchBySearch(search:String, site:Int)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/search//""" + "$" + """genre<[^/]+>/""" + "$" + """site<[^/]+>/""", """@controllers.MovieController@.apiSearchByGenre(genre:String, site:Int)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/search///""" + "$" + """site<[^/]+>/""", """@controllers.MovieController@.apiSearchBySite(site:Int)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/movies/""" + "$" + """id<[^/]+>/""", """@controllers.MovieController@.apiMovies(id:Long)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/genres/""", """@controllers.MovieController@.apiGetGenres"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/cart/""" + "$" + """id<[^/]+>/""", """@controllers.CartController@.apiGetById(id:String)"""),
    ("""POST""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/cart/""", """@controllers.CartController@.apiNewCart"""),
    ("""DELETE""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/cart/""" + "$" + """id<[^/]+>/""", """@controllers.CartController@.apiDeleteCart(id:Long)"""),
    ("""DELETE""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/carts/""" + "$" + """id<[^/]+>/""", """@controllers.CartController@.apiDeleteCartById(id:String)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/order/""", """@controllers.OrderController@.apiGetAll"""),
    ("""POST""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/order/""", """@controllers.OrderController@.apiNewOrder"""),
    ("""DELETE""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """api/order/""" + "$" + """id<[^/]+>/""", """@controllers.OrderController@.apiDeleteOrder(id:Long)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """user/""" + "$" + """id<[^/]+>""", """@controllers.UserController@.getByIdUser(id:String)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """registereduser/""", """@controllers.UserController@.getAll"""),
    ("""DELETE""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """registereduser/""" + "$" + """id<[^/]+>/""", """@controllers.UserController@.deleteUser(id:String)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """authenticate/""" + "$" + """provider<[^/]+>""", """controllers.SocialAuthController.authenticate(provider:String)"""),
    ("""POST""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """authenticate/""" + "$" + """provider<[^/]+>""", """controllers.SocialAuthController.authenticate(provider:String)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """getLoggedUser""", """controllers.SocialAuthController.getLoggedUser"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """logout""", """controllers.SocialAuthController.logoutUser"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """assets/""" + "$" + """file<.+>""", """controllers.Assets.at(path:String = "/public", file:String)"""),
    Nil
  ).foldLeft(List.empty[(String,String,String)]) { (s,e) => e.asInstanceOf[Any] match {
    case r @ (_,_,_) => s :+ r.asInstanceOf[(String,String,String)]
    case l => s ++ l.asInstanceOf[List[(String,String,String)]]
  }}


  // @LINE:6
  private[this] lazy val controllers_Application_index0_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix)))
  )
  private[this] lazy val controllers_Application_index0_invoker = createInvoker(
    Application_6.get.index,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.Application",
      "index",
      Nil,
      "GET",
      """ Home page""",
      this.prefix + """"""
    )
  )

  // @LINE:9
  private[this] lazy val controllers_MovieController_apiGetAll1_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/movie/")))
  )
  private[this] lazy val controllers_MovieController_apiGetAll1_invoker = createInvoker(
    MovieController_3.get.apiGetAll,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiGetAll",
      Nil,
      "GET",
      """API Movie""",
      this.prefix + """api/movie/"""
    )
  )

  // @LINE:10
  private[this] lazy val controllers_MovieController_apiMovie2_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/movie/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_MovieController_apiMovie2_invoker = createInvoker(
    MovieController_3.get.apiMovie(fakeValue[Long]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiMovie",
      Seq(classOf[Long]),
      "GET",
      """""",
      this.prefix + """api/movie/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:11
  private[this] lazy val controllers_MovieController_apiNewMovie3_route = Route("POST",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/movie/")))
  )
  private[this] lazy val controllers_MovieController_apiNewMovie3_invoker = createInvoker(
    MovieController_3.get.apiNewMovie,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiNewMovie",
      Nil,
      "POST",
      """""",
      this.prefix + """api/movie/"""
    )
  )

  // @LINE:12
  private[this] lazy val controllers_MovieController_apiDeleteMovie4_route = Route("DELETE",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/movie/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_MovieController_apiDeleteMovie4_invoker = createInvoker(
    MovieController_3.get.apiDeleteMovie(fakeValue[Long]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiDeleteMovie",
      Seq(classOf[Long]),
      "DELETE",
      """""",
      this.prefix + """api/movie/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:13
  private[this] lazy val controllers_MovieController_apiUpdateMovie5_route = Route("PUT",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/movie/")))
  )
  private[this] lazy val controllers_MovieController_apiUpdateMovie5_invoker = createInvoker(
    MovieController_3.get.apiUpdateMovie,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiUpdateMovie",
      Nil,
      "PUT",
      """""",
      this.prefix + """api/movie/"""
    )
  )

  // @LINE:15
  private[this] lazy val controllers_MovieController_apiSearch6_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/search/"), DynamicPart("search", """[^/]+""",true), StaticPart("/"), DynamicPart("genre", """[^/]+""",true), StaticPart("/"), DynamicPart("site", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_MovieController_apiSearch6_invoker = createInvoker(
    MovieController_3.get.apiSearch(fakeValue[String], fakeValue[String], fakeValue[Int]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiSearch",
      Seq(classOf[String], classOf[String], classOf[Int]),
      "GET",
      """""",
      this.prefix + """api/search/""" + "$" + """search<[^/]+>/""" + "$" + """genre<[^/]+>/""" + "$" + """site<[^/]+>/"""
    )
  )

  // @LINE:16
  private[this] lazy val controllers_MovieController_apiSearchBySearch7_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/search/"), DynamicPart("search", """[^/]+""",true), StaticPart("//"), DynamicPart("site", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_MovieController_apiSearchBySearch7_invoker = createInvoker(
    MovieController_3.get.apiSearchBySearch(fakeValue[String], fakeValue[Int]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiSearchBySearch",
      Seq(classOf[String], classOf[Int]),
      "GET",
      """""",
      this.prefix + """api/search/""" + "$" + """search<[^/]+>//""" + "$" + """site<[^/]+>/"""
    )
  )

  // @LINE:17
  private[this] lazy val controllers_MovieController_apiSearchByGenre8_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/search//"), DynamicPart("genre", """[^/]+""",true), StaticPart("/"), DynamicPart("site", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_MovieController_apiSearchByGenre8_invoker = createInvoker(
    MovieController_3.get.apiSearchByGenre(fakeValue[String], fakeValue[Int]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiSearchByGenre",
      Seq(classOf[String], classOf[Int]),
      "GET",
      """""",
      this.prefix + """api/search//""" + "$" + """genre<[^/]+>/""" + "$" + """site<[^/]+>/"""
    )
  )

  // @LINE:18
  private[this] lazy val controllers_MovieController_apiSearchBySite9_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/search///"), DynamicPart("site", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_MovieController_apiSearchBySite9_invoker = createInvoker(
    MovieController_3.get.apiSearchBySite(fakeValue[Int]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiSearchBySite",
      Seq(classOf[Int]),
      "GET",
      """""",
      this.prefix + """api/search///""" + "$" + """site<[^/]+>/"""
    )
  )

  // @LINE:20
  private[this] lazy val controllers_MovieController_apiMovies10_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/movies/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_MovieController_apiMovies10_invoker = createInvoker(
    MovieController_3.get.apiMovies(fakeValue[Long]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiMovies",
      Seq(classOf[Long]),
      "GET",
      """""",
      this.prefix + """api/movies/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:21
  private[this] lazy val controllers_MovieController_apiGetGenres11_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/genres/")))
  )
  private[this] lazy val controllers_MovieController_apiGetGenres11_invoker = createInvoker(
    MovieController_3.get.apiGetGenres,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.MovieController",
      "apiGetGenres",
      Nil,
      "GET",
      """""",
      this.prefix + """api/genres/"""
    )
  )

  // @LINE:24
  private[this] lazy val controllers_CartController_apiGetById12_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/cart/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_CartController_apiGetById12_invoker = createInvoker(
    CartController_2.get.apiGetById(fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.CartController",
      "apiGetById",
      Seq(classOf[String]),
      "GET",
      """API Cart""",
      this.prefix + """api/cart/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:25
  private[this] lazy val controllers_CartController_apiNewCart13_route = Route("POST",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/cart/")))
  )
  private[this] lazy val controllers_CartController_apiNewCart13_invoker = createInvoker(
    CartController_2.get.apiNewCart,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.CartController",
      "apiNewCart",
      Nil,
      "POST",
      """""",
      this.prefix + """api/cart/"""
    )
  )

  // @LINE:26
  private[this] lazy val controllers_CartController_apiDeleteCart14_route = Route("DELETE",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/cart/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_CartController_apiDeleteCart14_invoker = createInvoker(
    CartController_2.get.apiDeleteCart(fakeValue[Long]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.CartController",
      "apiDeleteCart",
      Seq(classOf[Long]),
      "DELETE",
      """""",
      this.prefix + """api/cart/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:27
  private[this] lazy val controllers_CartController_apiDeleteCartById15_route = Route("DELETE",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/carts/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_CartController_apiDeleteCartById15_invoker = createInvoker(
    CartController_2.get.apiDeleteCartById(fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.CartController",
      "apiDeleteCartById",
      Seq(classOf[String]),
      "DELETE",
      """""",
      this.prefix + """api/carts/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:30
  private[this] lazy val controllers_OrderController_apiGetAll16_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/order/")))
  )
  private[this] lazy val controllers_OrderController_apiGetAll16_invoker = createInvoker(
    OrderController_1.get.apiGetAll,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.OrderController",
      "apiGetAll",
      Nil,
      "GET",
      """API Order""",
      this.prefix + """api/order/"""
    )
  )

  // @LINE:31
  private[this] lazy val controllers_OrderController_apiNewOrder17_route = Route("POST",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/order/")))
  )
  private[this] lazy val controllers_OrderController_apiNewOrder17_invoker = createInvoker(
    OrderController_1.get.apiNewOrder,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.OrderController",
      "apiNewOrder",
      Nil,
      "POST",
      """""",
      this.prefix + """api/order/"""
    )
  )

  // @LINE:32
  private[this] lazy val controllers_OrderController_apiDeleteOrder18_route = Route("DELETE",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("api/order/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_OrderController_apiDeleteOrder18_invoker = createInvoker(
    OrderController_1.get.apiDeleteOrder(fakeValue[Long]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.OrderController",
      "apiDeleteOrder",
      Seq(classOf[Long]),
      "DELETE",
      """""",
      this.prefix + """api/order/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:35
  private[this] lazy val controllers_UserController_getByIdUser19_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("user/"), DynamicPart("id", """[^/]+""",true)))
  )
  private[this] lazy val controllers_UserController_getByIdUser19_invoker = createInvoker(
    UserController_0.get.getByIdUser(fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.UserController",
      "getByIdUser",
      Seq(classOf[String]),
      "GET",
      """User""",
      this.prefix + """user/""" + "$" + """id<[^/]+>"""
    )
  )

  // @LINE:36
  private[this] lazy val controllers_UserController_getAll20_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("registereduser/")))
  )
  private[this] lazy val controllers_UserController_getAll20_invoker = createInvoker(
    UserController_0.get.getAll,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.UserController",
      "getAll",
      Nil,
      "GET",
      """""",
      this.prefix + """registereduser/"""
    )
  )

  // @LINE:37
  private[this] lazy val controllers_UserController_deleteUser21_route = Route("DELETE",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("registereduser/"), DynamicPart("id", """[^/]+""",true), StaticPart("/")))
  )
  private[this] lazy val controllers_UserController_deleteUser21_invoker = createInvoker(
    UserController_0.get.deleteUser(fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.UserController",
      "deleteUser",
      Seq(classOf[String]),
      "DELETE",
      """""",
      this.prefix + """registereduser/""" + "$" + """id<[^/]+>/"""
    )
  )

  // @LINE:40
  private[this] lazy val controllers_SocialAuthController_authenticate22_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("authenticate/"), DynamicPart("provider", """[^/]+""",true)))
  )
  private[this] lazy val controllers_SocialAuthController_authenticate22_invoker = createInvoker(
    SocialAuthController_5.authenticate(fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.SocialAuthController",
      "authenticate",
      Seq(classOf[String]),
      "GET",
      """Authenticate""",
      this.prefix + """authenticate/""" + "$" + """provider<[^/]+>"""
    )
  )

  // @LINE:41
  private[this] lazy val controllers_SocialAuthController_authenticate23_route = Route("POST",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("authenticate/"), DynamicPart("provider", """[^/]+""",true)))
  )
  private[this] lazy val controllers_SocialAuthController_authenticate23_invoker = createInvoker(
    SocialAuthController_5.authenticate(fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.SocialAuthController",
      "authenticate",
      Seq(classOf[String]),
      "POST",
      """""",
      this.prefix + """authenticate/""" + "$" + """provider<[^/]+>"""
    )
  )

  // @LINE:42
  private[this] lazy val controllers_SocialAuthController_getLoggedUser24_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("getLoggedUser")))
  )
  private[this] lazy val controllers_SocialAuthController_getLoggedUser24_invoker = createInvoker(
    SocialAuthController_5.getLoggedUser,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.SocialAuthController",
      "getLoggedUser",
      Nil,
      "GET",
      """""",
      this.prefix + """getLoggedUser"""
    )
  )

  // @LINE:43
  private[this] lazy val controllers_SocialAuthController_logoutUser25_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("logout")))
  )
  private[this] lazy val controllers_SocialAuthController_logoutUser25_invoker = createInvoker(
    SocialAuthController_5.logoutUser,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.SocialAuthController",
      "logoutUser",
      Nil,
      "GET",
      """""",
      this.prefix + """logout"""
    )
  )

  // @LINE:46
  private[this] lazy val controllers_Assets_at26_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("assets/"), DynamicPart("file", """.+""",false)))
  )
  private[this] lazy val controllers_Assets_at26_invoker = createInvoker(
    Assets_4.at(fakeValue[String], fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.Assets",
      "at",
      Seq(classOf[String], classOf[String]),
      "GET",
      """ Map static resources from the /public folder to the /assets URL path""",
      this.prefix + """assets/""" + "$" + """file<.+>"""
    )
  )


  def routes: PartialFunction[RequestHeader, Handler] = {
  
    // @LINE:6
    case controllers_Application_index0_route(params) =>
      call { 
        controllers_Application_index0_invoker.call(Application_6.get.index)
      }
  
    // @LINE:9
    case controllers_MovieController_apiGetAll1_route(params) =>
      call { 
        controllers_MovieController_apiGetAll1_invoker.call(MovieController_3.get.apiGetAll)
      }
  
    // @LINE:10
    case controllers_MovieController_apiMovie2_route(params) =>
      call(params.fromPath[Long]("id", None)) { (id) =>
        controllers_MovieController_apiMovie2_invoker.call(MovieController_3.get.apiMovie(id))
      }
  
    // @LINE:11
    case controllers_MovieController_apiNewMovie3_route(params) =>
      call { 
        controllers_MovieController_apiNewMovie3_invoker.call(MovieController_3.get.apiNewMovie)
      }
  
    // @LINE:12
    case controllers_MovieController_apiDeleteMovie4_route(params) =>
      call(params.fromPath[Long]("id", None)) { (id) =>
        controllers_MovieController_apiDeleteMovie4_invoker.call(MovieController_3.get.apiDeleteMovie(id))
      }
  
    // @LINE:13
    case controllers_MovieController_apiUpdateMovie5_route(params) =>
      call { 
        controllers_MovieController_apiUpdateMovie5_invoker.call(MovieController_3.get.apiUpdateMovie)
      }
  
    // @LINE:15
    case controllers_MovieController_apiSearch6_route(params) =>
      call(params.fromPath[String]("search", None), params.fromPath[String]("genre", None), params.fromPath[Int]("site", None)) { (search, genre, site) =>
        controllers_MovieController_apiSearch6_invoker.call(MovieController_3.get.apiSearch(search, genre, site))
      }
  
    // @LINE:16
    case controllers_MovieController_apiSearchBySearch7_route(params) =>
      call(params.fromPath[String]("search", None), params.fromPath[Int]("site", None)) { (search, site) =>
        controllers_MovieController_apiSearchBySearch7_invoker.call(MovieController_3.get.apiSearchBySearch(search, site))
      }
  
    // @LINE:17
    case controllers_MovieController_apiSearchByGenre8_route(params) =>
      call(params.fromPath[String]("genre", None), params.fromPath[Int]("site", None)) { (genre, site) =>
        controllers_MovieController_apiSearchByGenre8_invoker.call(MovieController_3.get.apiSearchByGenre(genre, site))
      }
  
    // @LINE:18
    case controllers_MovieController_apiSearchBySite9_route(params) =>
      call(params.fromPath[Int]("site", None)) { (site) =>
        controllers_MovieController_apiSearchBySite9_invoker.call(MovieController_3.get.apiSearchBySite(site))
      }
  
    // @LINE:20
    case controllers_MovieController_apiMovies10_route(params) =>
      call(params.fromPath[Long]("id", None)) { (id) =>
        controllers_MovieController_apiMovies10_invoker.call(MovieController_3.get.apiMovies(id))
      }
  
    // @LINE:21
    case controllers_MovieController_apiGetGenres11_route(params) =>
      call { 
        controllers_MovieController_apiGetGenres11_invoker.call(MovieController_3.get.apiGetGenres)
      }
  
    // @LINE:24
    case controllers_CartController_apiGetById12_route(params) =>
      call(params.fromPath[String]("id", None)) { (id) =>
        controllers_CartController_apiGetById12_invoker.call(CartController_2.get.apiGetById(id))
      }
  
    // @LINE:25
    case controllers_CartController_apiNewCart13_route(params) =>
      call { 
        controllers_CartController_apiNewCart13_invoker.call(CartController_2.get.apiNewCart)
      }
  
    // @LINE:26
    case controllers_CartController_apiDeleteCart14_route(params) =>
      call(params.fromPath[Long]("id", None)) { (id) =>
        controllers_CartController_apiDeleteCart14_invoker.call(CartController_2.get.apiDeleteCart(id))
      }
  
    // @LINE:27
    case controllers_CartController_apiDeleteCartById15_route(params) =>
      call(params.fromPath[String]("id", None)) { (id) =>
        controllers_CartController_apiDeleteCartById15_invoker.call(CartController_2.get.apiDeleteCartById(id))
      }
  
    // @LINE:30
    case controllers_OrderController_apiGetAll16_route(params) =>
      call { 
        controllers_OrderController_apiGetAll16_invoker.call(OrderController_1.get.apiGetAll)
      }
  
    // @LINE:31
    case controllers_OrderController_apiNewOrder17_route(params) =>
      call { 
        controllers_OrderController_apiNewOrder17_invoker.call(OrderController_1.get.apiNewOrder)
      }
  
    // @LINE:32
    case controllers_OrderController_apiDeleteOrder18_route(params) =>
      call(params.fromPath[Long]("id", None)) { (id) =>
        controllers_OrderController_apiDeleteOrder18_invoker.call(OrderController_1.get.apiDeleteOrder(id))
      }
  
    // @LINE:35
    case controllers_UserController_getByIdUser19_route(params) =>
      call(params.fromPath[String]("id", None)) { (id) =>
        controllers_UserController_getByIdUser19_invoker.call(UserController_0.get.getByIdUser(id))
      }
  
    // @LINE:36
    case controllers_UserController_getAll20_route(params) =>
      call { 
        controllers_UserController_getAll20_invoker.call(UserController_0.get.getAll)
      }
  
    // @LINE:37
    case controllers_UserController_deleteUser21_route(params) =>
      call(params.fromPath[String]("id", None)) { (id) =>
        controllers_UserController_deleteUser21_invoker.call(UserController_0.get.deleteUser(id))
      }
  
    // @LINE:40
    case controllers_SocialAuthController_authenticate22_route(params) =>
      call(params.fromPath[String]("provider", None)) { (provider) =>
        controllers_SocialAuthController_authenticate22_invoker.call(SocialAuthController_5.authenticate(provider))
      }
  
    // @LINE:41
    case controllers_SocialAuthController_authenticate23_route(params) =>
      call(params.fromPath[String]("provider", None)) { (provider) =>
        controllers_SocialAuthController_authenticate23_invoker.call(SocialAuthController_5.authenticate(provider))
      }
  
    // @LINE:42
    case controllers_SocialAuthController_getLoggedUser24_route(params) =>
      call { 
        controllers_SocialAuthController_getLoggedUser24_invoker.call(SocialAuthController_5.getLoggedUser)
      }
  
    // @LINE:43
    case controllers_SocialAuthController_logoutUser25_route(params) =>
      call { 
        controllers_SocialAuthController_logoutUser25_invoker.call(SocialAuthController_5.logoutUser)
      }
  
    // @LINE:46
    case controllers_Assets_at26_route(params) =>
      call(Param[String]("path", Right("/public")), params.fromPath[String]("file", None)) { (path, file) =>
        controllers_Assets_at26_invoker.call(Assets_4.at(path, file))
      }
  }
}
