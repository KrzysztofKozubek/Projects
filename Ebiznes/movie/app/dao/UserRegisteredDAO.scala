package dao

import javax.inject.Inject

import models.{ MovieREST, UserRegistered, UserRegisteredREST }
import play.api.db.slick.{ DatabaseConfigProvider, HasDatabaseConfigProvider }
import slick.driver.MySQLDriver

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.{ ExecutionContext, Future }

class UserRegisteredDAO @Inject() (protected val dbConfigProvider: DatabaseConfigProvider)
    extends HasDatabaseConfigProvider[MySQLDriver] {

  import driver.api._

  val UsersRegistered = TableQuery[UserRegisteredTable]

  def all(implicit ec: ExecutionContext): Future[List[UserRegisteredREST]] = {
    val query = UsersRegistered
    val results = db.run(query.result)
    results.map(
      _.map {
      a => UserRegisteredREST(idUser = a.idUser, provider = a.provider, firstName = a.firstName, lastName = a.lastName, fullName = a.fullName, email = a.email, avatarUrl = a.avatarUrl, isAdmin = a.isAdmin)
    }.toList
    )
  }

  def getByIdUser(idUser: String): Future[List[UserRegisteredREST]] = {

    val futureUsers = db.run(UsersRegistered.filter(_.idUser === idUser).result.headOption)
    futureUsers.map(
      _.map {
      a => UserRegisteredREST(idUser = a.idUser, provider = a.provider, firstName = a.firstName, lastName = a.lastName, fullName = a.fullName, email = a.email, avatarUrl = a.avatarUrl, isAdmin = a.isAdmin)
    }.toList
    )
  }

  def insert(userRegistered: UserRegistered): Future[UserRegisteredREST] = {

    println("insert user" + userRegistered)
    val insertQuery = UsersRegistered returning UsersRegistered.map(_.id) into ((userRegistered, id) => userRegistered.copy(id = id))
    val action = insertQuery += userRegistered
    db.run(action).map(a => UserRegisteredREST(idUser = a.idUser, provider = a.provider, firstName = a.firstName, lastName = a.lastName, fullName = a.fullName, email = a.email, avatarUrl = a.avatarUrl, isAdmin = a.isAdmin))
  }

  def deleteById(idUser: String): Future[Int] = db.run(UsersRegistered.filter(_.idUser === idUser).delete)

  class UserRegisteredTable(tag: Tag) extends Table[UserRegistered](tag, "user") {

    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
    def idUser = column[String]("idUser")
    def provider = column[String]("provider")
    def firstName = column[String]("firstName")
    def lastName = column[String]("lastName")
    def fullName = column[String]("fullName")
    def email = column[String]("email")
    def avatarUrl = column[String]("avatarUrl")
    def isAdmin = column[Int]("isAdmin")

    def * = (id, idUser, provider, firstName, lastName, fullName, email, avatarUrl, isAdmin) <> (models.UserRegistered.tupled, models.UserRegistered.unapply)
  }

}
