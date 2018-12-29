import {Component, OnDestroy, OnInit} from '@angular/core';
import {MoviesService} from './movies.service';
import {ActivatedRoute, Params} from '@angular/router';
import {CookieService} from "angular2-cookie/core";
import {MovieCart} from "./movieCart";
import {Movie} from "./movie";

@Component({
  selector: 'app-movies',
  templateUrl: './movies.html',
  providers: [MoviesService]
})
export class MoviesComponent implements OnInit, OnDestroy {

  site: string;
  search: string;
  genre: string;
  genres: string;
  movies: MovieCart[];

  next: number;
  prev: number;
  cart: MovieCart = new MovieCart;

  constructor(private moviesService: MoviesService, private cookieService: CookieService, private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {

    this.search = '';
    this.genre = '';
    this.site = '0';
    this.getGenres();
    this.cart.idUser = this.cookieService.get("userAuth");

    this.activatedRoute.params.subscribe((params: Params) => {
        this.site = params['site'];
    });
    this.next = Number(this.site) + 1;
    this.prev = Number(this.site) - 1;

    if (isNaN(Number(this.site))) {
      this.site = '0';
      this.prev = 0;
      this.next = 1;
    }

    this.moviesService.getMovies(this.site).subscribe(json => {
      this.movies = json;
    });
  }

  ngOnDestroy(): void { }

  searchMovie(event, search) {

    if (!search) { search = ' '; }
    if (!this.genre) { this.genre = ' '; }

    this.site = '0';
    this.prev = 0;
    this.next = 1;

    if (event && event.target.value && event.target.value.length > 0) {
      this.search = event.target.value;
    }

    this.moviesService.searchMovie(this.search, this.genre, this.site).subscribe(json => {
      this.movies = json;
    });
  }

  onClickMe(site) {
    if (isNaN(Number(site))) {
      site = '0';
    }
    this.site = site;
    this.prev = site - 1;
    this.next = site + 1;
    if (Number(site) <= 0) {
      this.site = '0';
      this.prev = 0;
      this.next = 1;
    }

    this.moviesService.searchMovie(this.search, this.genre, site).subscribe(json => {
      this.movies = json;
    });
  }

  getGenres() {

    this.moviesService.getGenres().subscribe(json => {
      this.genres = json;
    });
  }

  changeGenre(event) {

    this.genre = event.target.value;
    this.site = '0';
    this.prev = 0;
    this.next = 1;

    console.log('zmieniam ' + this.search + ' genre: ' + this.genre);
    this.moviesService.searchMovie(this.search, this.genre, this.site).subscribe(json => {
      this.movies = json;
    });
  }

  changeGenres(genre) {

    this.genre = genre;
    this.site = '0';
    this.prev = 0;
    this.next = 1;

    console.log('zmieniam ' + this.search + ' genre: ' + this.genre);
    this.moviesService.searchMovie(this.search, this.genre, this.site).subscribe(json => {
      this.movies = json;
    });
  }


  onClickCart(movie: Movie) {
    this.cart.idUser = this.cookieService.get("userAuth");
    // this.cart.idUser = "111493230806075182303";
    this.cart.id = 0;
    this.cart.title = movie.title;
    this.cart.poster = movie.poster;
    this.cart.price = movie.price;
    console.log(this.cart);
    this.moviesService.newCart(this.cart);
  }
}


