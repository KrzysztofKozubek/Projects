package controllers

import javax.inject.Inject

import dao.UserRegisteredDAO
import play.api.libs.concurrent.Execution.Implicits.defaultContext
import play.api.libs.json.Json
import play.api.mvc.{ Action, Controller }

class UserController @Inject() (userRegisteredDAO: UserRegisteredDAO) extends Controller {

  def getAll = Action.async { implicit request =>
    userRegisteredDAO.all map {
      categories => Ok(Json.toJson(categories))
    }
  }

  def deleteUser(idUser: String) = Action { implicit request =>
    userRegisteredDAO.deleteById(idUser)
    Ok("OK")
  }

  def getByIdUser(idUser: String) = Action.async {
    implicit request =>
      userRegisteredDAO.getByIdUser(idUser) map {
        json => Ok(Json.toJson(json))
      }
  }
}
