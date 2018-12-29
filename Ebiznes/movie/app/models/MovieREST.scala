package models

import play.api.libs.json.Json

case class MovieREST(id: Long, title: String, releaseDate: String, description: String, length: Long, mark: Double, genre: String, poster: String, price: Double)

object MovieREST {
  implicit val format = Json.format[MovieREST]
}