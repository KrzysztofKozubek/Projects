package models

import play.api.libs.json.Json

case class UserRegisteredREST(idUser: String, provider: String, firstName: String, lastName: String, fullName: String, email: String, avatarUrl: String, isAdmin: Int)

object UserRegisteredREST {
  implicit val json = Json.format[UserRegisteredREST]
}