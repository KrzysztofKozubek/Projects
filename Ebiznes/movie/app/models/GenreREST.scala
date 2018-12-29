package models

import play.api.libs.json.Json

case class GenreREST(genre: String)

object GenreREST {
  implicit val json = Json.format[GenreREST]
}
