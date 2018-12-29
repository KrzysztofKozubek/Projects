package models

import play.api.libs.json.Json

case class CartREST(id: Long, idUser: String, title: String, poster: String, price: Double)

object CartREST {
  implicit val json = Json.format[CartREST]
}

