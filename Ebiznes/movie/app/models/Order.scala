package models

case class Order(id: Long, idUser: String, address: String, shipment: String, orderJSON: String, cost: Double, date: String)
