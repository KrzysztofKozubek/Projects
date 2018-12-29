package dao

import javax.inject.Inject

import models.{ Cart, CartREST }
import play.api.db.slick.{ DatabaseConfigProvider, HasDatabaseConfigProvider }
import play.api.libs.json.Json
import slick.driver.MySQLDriver

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.{ ExecutionContext, Future }

class CartDAO @Inject() (protected val dbConfigProvider: DatabaseConfigProvider)
    extends HasDatabaseConfigProvider[MySQLDriver] {

  import driver.api._

  val Carts = TableQuery[CartTable]

  def all: Future[List[CartREST]] = {
    val query = Carts
    val results = db.run(query.result)
    results.map(
      _.map {
      a => CartREST(id = a.id, idUser = a.idUser, title = a.title, poster = a.poster, price = a.price)
    }.toList
    )
  }

  def getCartByIdUser(idUser: String): Future[List[CartREST]] = {
    val query = Carts.filter(_.idUser === idUser)
    val results = db.run(query.result)
    results.map(
      _.map {
      a => CartREST(id = a.id, idUser = a.idUser, title = a.title, poster = a.poster, price = a.price)
    }.toList
    )
  }

  def insert(cart: Cart): Future[CartREST] = {

    //    this.deleteByIdUser(cart.idUser)
    val insertQuery = Carts returning Carts.map(_.id) into ((cart, id) => cart.copy(id = id))
    val action = insertQuery += cart
    db.run(action).map(a => CartREST(0, idUser = a.idUser, title = a.title, poster = a.poster, price = a.price))
  }

  def deleteByIdUser(idUser: String): Future[Int] = db.run(Carts.filter(_.idUser === idUser).delete)

  def deleteById(id: Long): Future[Int] = db.run(Carts.filter(_.id === id).delete)

  class CartTable(tag: Tag) extends Table[Cart](tag, "cart") {
    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
    def idUser = column[String]("idUser")
    def title = column[String]("title")
    def poster = column[String]("poster")
    def price = column[Double]("price")
    def * = (id, idUser, title, poster, price) <> (models.Cart.tupled, models.Cart.unapply)
  }
}
