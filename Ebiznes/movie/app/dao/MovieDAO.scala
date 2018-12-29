package dao

import javax.inject.Inject

import models.{ GenreREST, Movie, MovieREST }
import play.api.db.slick.{ DatabaseConfigProvider, HasDatabaseConfigProvider }
import slick.driver.MySQLDriver

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.{ ExecutionContext, Future }

class MovieDAO @Inject() (protected val dbConfigProvider: DatabaseConfigProvider)
    extends HasDatabaseConfigProvider[MySQLDriver] {

  import driver.api._

  val Movies = TableQuery[MoviesTable]

  def all(implicit ec: ExecutionContext): Future[List[MovieREST]] = {
    val query = Movies
    val results = db.run(query.result)
    results.map(
      _.map {
      a => MovieREST(id = a.id, title = a.title, releaseDate = a.releaseDate, description = a.description, length = a.length, mark = a.mark, genre = a.genre, poster = a.poster, price = a.price)
    }.toList
    )
  }

  def getMovie(id: Long): Future[List[MovieREST]] = {

    val query = Movies.filter(_.id === id)
    val results = dbConfig.db.run(query.result)
    val futureMovie = results
    futureMovie.map(
      _.map {
      a => MovieREST(id = a.id, title = a.title, releaseDate = a.releaseDate, description = a.description, length = a.length, mark = a.mark, genre = a.genre, poster = a.poster, price = a.price)
    }.toList
    )
  }

  def getMovies(site: Long): Future[List[MovieREST]] = {

    println(site)
    val movieOnSite = 3
    val query = Movies.sortBy(_.releaseDate.desc).drop(site * movieOnSite).take(movieOnSite)
    val results = dbConfig.db.run(query.result)

    val futureMovie = results
    futureMovie.map(
      _.map {
      a => MovieREST(id = a.id, title = a.title, releaseDate = a.releaseDate, description = a.description, length = a.length, mark = a.mark, genre = a.genre, poster = a.poster, price = a.price)
    }.toList
    )
  }

  def getGenres(): Future[List[GenreREST]] = {

    val query = Movies.filterNot(_.genre like "% %").sortBy(_.genre).groupBy(_.genre).map { case (genre, group) => (genre, group.size) }
    val results = dbConfig.db.run(query.result)

    results.map(
      _.map {
      a => GenreREST(genre = a._1)
    }.toList
    )
  }

  def searchMovie(_search: String, _genre: String, _site: Int): Future[List[MovieREST]] = {

    val movieOnSite = 3
    var search = "%" + _search + "%"
    var genre = "%" + _genre + "%"
    val query = Movies.filter(_.title like search).filter(_.genre like genre).drop(_site * movieOnSite).take(movieOnSite)
    val results = dbConfig.db.run(query.result)

    val futureMovie = results
    futureMovie.map(
      _.map {
      a => MovieREST(id = a.id, title = a.title, releaseDate = a.releaseDate, description = a.description, length = a.length, mark = a.mark, genre = a.genre, poster = a.poster, price = a.price)
    }.toList
    )
  }

  def insert(movie: Movie): Future[MovieREST] = {

    val insertQuery = Movies returning Movies.map(_.id) into ((movie, id) => movie.copy(id = id))
    val action = insertQuery += movie
    db.run(action).map(a => MovieREST(id = a.id, title = a.title, releaseDate = a.releaseDate, description = a.description, length = a.length, mark = a.mark, genre = a.genre, poster = a.poster, price = a.price))
  }

  def updateById(movie: Movie): Future[Int] = db.run(Movies.filter(_.id === movie.id).update(movie))

  def deleteById(id: Long): Future[Int] = db.run(Movies.filter(_.id === id).delete)

  class MoviesTable(tag: Tag) extends Table[Movie](tag, "movie") {

    def id = column[Long]("id", O.AutoInc, O.AutoInc, O.PrimaryKey)
    def title = column[String]("title")
    def releaseDate = column[String]("releaseDate")
    def description = column[String]("description")
    def length = column[Long]("length")
    def mark = column[Double]("mark")
    def genre = column[String]("genre")
    def poster = column[String]("poster")
    def price = column[Double]("price")

    def * = (id, title, releaseDate, description, length, mark, genre, poster, price) <> (models.Movie.tupled, models.Movie.unapply)
  }
}
