package controllers

import javax.inject.Inject

import dao.OrderDAO
import models.{ Order, OrderREST }
import play.api.libs.json.Json
import play.api.mvc.{ Action, Controller }

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.{ ExecutionContext, Future }

class OrderController @Inject() (orderDAO: OrderDAO) extends Controller {

  def apiGetAll = Action.async { implicit request =>
    orderDAO.all map {
      json => Ok(Json.toJson(json))
    }
  }

  def apiNewOrder = Action.async { implicit request =>
    val json: OrderREST = request.body.asJson.get.as[OrderREST]
    val order = Order(id = json.id, idUser = json.idUser, address = json.address, shipment = json.shipment, orderJSON = json.orderJSON, cost = json.cost, date = json.date)
    val orderResult = orderDAO.insert(order)
    orderResult.map {
      json => Ok(Json.toJson(json))
    }
  }

  def apiDeleteOrder(id: Long) = Action { implicit request =>
    orderDAO.deleteById(id)
    Ok("OK")
  }
}
