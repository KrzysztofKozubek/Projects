package controllers

import javax.inject.Inject

import dao.CartDAO
import models.{ Cart, CartREST }
import play.api.libs.json.Json
import play.api.mvc.{ Action, Controller }

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.{ ExecutionContext, Future }

class CartController @Inject() (cartDAO: CartDAO) extends Controller {

  def apiGetById(idUser: String) = Action.async { implicit request =>
    cartDAO.getCartByIdUser(idUser) map {
      carts => Ok(Json.toJson(carts))
    }
  }

  def apiNewCart = Action.async { implicit request =>
    println(request)
    val json: CartREST = request.body.asJson.get.as[CartREST]
    val cart = Cart(id = 0, idUser = json.idUser, title = json.title, poster = json.poster, price = json.price)
    val cartResult = cartDAO.insert(cart)
    cartResult.map {
      json => Ok(Json.toJson(json))
    }
  }

  def apiDeleteCart(id: Long) = Action { implicit request =>
    println("delete")
    cartDAO.deleteById(id)
    Ok("OK")
  }

  def apiDeleteCartById(id: String) = Action { implicit request =>
    cartDAO.deleteByIdUser(id)
    Ok("OK")
  }
}
