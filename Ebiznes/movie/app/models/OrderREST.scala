package models

import play.api.libs.json.Json

case class OrderREST(id: Long, idUser: String, address: String, shipment: String, orderJSON: String, cost: Double, date: String)

object OrderREST {
  implicit val productFormat = Json.format[OrderREST]
}

