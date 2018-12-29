package controllers

import javax.inject.Inject

import dao.MovieDAO
import models.{ Movie, MovieREST }
import play.api.libs.json.Json
import play.api.mvc._

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.{ ExecutionContext, Future }

class MovieController @Inject() (movieDAO: MovieDAO) extends Controller {

  def apiGetAll = Action.async { implicit request =>
    movieDAO.all map {
      json => Ok(Json.toJson(json))
    }
  }

  def apiMovie(id: Long) = Action.async { implicit request =>

    movieDAO.getMovie(id) map {
      movie => Ok(Json.toJson(movie))
    }
  }

  def apiMovies(site: Long) = Action.async { implicit request =>

    movieDAO.getMovies(site) map {
      movie => Ok(Json.toJson(movie))
    }
  }

  def apiGetGenres() = Action.async { implicit request =>

    movieDAO.getGenres() map {
      genres => Ok(Json.toJson(genres))
    }
  }

  def apiSearch(search: String, genre: String, site: Int) = Action.async { implicit request =>

    var s = site
    if (site <= -1) {
      s = 0
    }
    println(search + genre + site)
    movieDAO.searchMovie(search, genre, s) map {
      movies => Ok(Json.toJson(movies))
    }
  }

  def apiSearchBySearch(search: String, site: Int) = Action.async { implicit request =>

    var s = site
    if (site <= -1) {
      s = 0
    }
    println(search + site)
    movieDAO.searchMovie(search, "", s) map {
      movies => Ok(Json.toJson(movies))
    }
  }

  def apiSearchBySite(site: Int) = Action.async { implicit request =>

    var s = site
    if (site <= -1) {
      s = 0
    }
    println(site)
    movieDAO.searchMovie("", "", s) map {
      movies => Ok(Json.toJson(movies))
    }
  }

  def apiSearchByGenre(genre: String, site: Int) = Action.async { implicit request =>

    var s = site
    if (site <= -1) {
      s = 0
    }
    println(genre + site)
    movieDAO.searchMovie("", genre, s) map {
      movies => Ok(Json.toJson(movies))
    }
  }

  def apiNewMovie = Action.async { implicit request =>
    val json: MovieREST = request.body.asJson.get.as[MovieREST]
    val product = Movie(id = json.id, title = json.title, releaseDate = json.releaseDate, description = json.description, length = json.length, mark = json.mark, genre = json.genre, poster = json.poster, price = json.price)
    val productResult = movieDAO.insert(product)
    productResult.map {
      json => Ok(Json.toJson(json))
    }
  }

  def apiUpdateMovie = Action { implicit request =>
    val json: MovieREST = request.body.asJson.get.as[MovieREST]
    val product = Movie(id = json.id, title = json.title, releaseDate = json.releaseDate, description = json.description, length = json.length, mark = json.mark, genre = json.genre, poster = json.poster, price = json.price)
    movieDAO.updateById(product)
    Ok(Json.toJson(json))
  }

  def apiDeleteMovie(id: Long) = Action { implicit request =>
    movieDAO.deleteById(id)
    Ok("OK")
  }
}
