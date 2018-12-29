package dao

import javax.inject.Inject

import models.{ Order, OrderREST }
import play.api.db.slick.{ DatabaseConfigProvider, HasDatabaseConfigProvider }
import slick.driver.MySQLDriver

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.{ ExecutionContext, Future }

class OrderDAO @Inject() (protected val dbConfigProvider: DatabaseConfigProvider)
    extends HasDatabaseConfigProvider[MySQLDriver] {

  import driver.api._

  val Orders = TableQuery[OrderTable]

  def all(implicit ec: ExecutionContext): Future[List[OrderREST]] = {
    val query = Orders
    val results = db.run(query.result)
    results.map(
      _.map {
      a => OrderREST(id = a.id, idUser = a.idUser, address = a.address, shipment = a.shipment, orderJSON = a.orderJSON, cost = a.cost, date = a.date)
    }.toList
    )
  }

  def insert(order: Order): Future[OrderREST] = {

    val insertQuery = Orders returning Orders.map(_.id) into ((order, id) => order.copy(id = id))
    val action = insertQuery += order
    val dbAc = db.run(action)
    dbAc.map(a => OrderREST(id = a.id, idUser = a.idUser, address = a.address, shipment = a.shipment, orderJSON = a.orderJSON, cost = a.cost, date = a.date))
  }

  def deleteById(id: Long): Future[Int] = db.run(Orders.filter(_.id === id).delete)

  class OrderTable(tag: Tag) extends Table[Order](tag, "order") {
    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
    def idUser = column[String]("idUser")
    def address = column[String]("address")
    def shipment = column[String]("shipment")
    def orderJSON = column[String]("orderJSON")
    def cost = column[Double]("cost")
    def date = column[String]("date")

    def * = (id, idUser, address, shipment, orderJSON, cost, date) <> (models.Order.tupled, models.Order.unapply)
  }

}
