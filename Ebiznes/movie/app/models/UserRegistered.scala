package models

case class UserRegistered(id: Long, idUser: String, provider: String, firstName: String, lastName: String, fullName: String, email: String, avatarUrl: String, isAdmin: Int)

