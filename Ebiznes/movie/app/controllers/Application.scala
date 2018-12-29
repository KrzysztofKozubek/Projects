package controllers

import javax.inject.Inject

import dao.{ MovieDAO }
import play.api.libs.json.Json
import play.api.mvc._
import play.api.libs.concurrent.Execution.Implicits.defaultContext

class Application @Inject() (movieDAO: MovieDAO) extends Controller {

  def index = Action.async { implicit request =>
    movieDAO.all map {
      movies => Ok(Json.toJson(movies))
    }
  }

  def order = Action {
    Ok(views.html.index("Your new application is ready."))
  }

}