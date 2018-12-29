import {EventEmitter, Injectable} from '@angular/core';
import {Headers, Http, RequestOptions} from '@angular/http';
import 'rxjs/add/operator/map';
import {Movie} from "./movie";

import {FormGroup} from '@angular/forms';
import {MovieCart} from "./movieCart";

@Injectable()
export class MoviesService {

  private linkMovie: string;
  newMovieEvent: EventEmitter<Movie> = new EventEmitter<Movie>();
  constructor(private http: Http) { }
  /*
   getMovie | getMovies | search | genres | newMovie | updateMovie | deleteMovie
   */

  getMovie(id: string) {
    console.log('id: ' + id);
    this.linkMovie = 'http://localhost:9000/api/movie/' + id + '/';
    return this.http.get(this.linkMovie)
      .map(res => res.json());
  }

  getMovies(site: string) {
    this.linkMovie = 'http://localhost:9000/api/movies/' + site + '/';
    return this.http.get(this.linkMovie).map(res => res.json());
  }

  searchMovie(search: string, genre: string, site: string) {

    this.linkMovie = 'http://localhost:9000/api/search/' + search + '/' + genre + '/' + site + '/';
    console.log(this.linkMovie);
    return this.http.get(this.linkMovie)
      .map(res => res.json());
  }

  getGenres() {

    this.linkMovie = 'http://localhost:9000/api/genres/';
    return this.http.get(this.linkMovie)
      .map(res => res.json());
  }

  newMovie(movieForm: FormGroup) {
    const serializedForm = JSON.stringify(movieForm);
    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    const options = new RequestOptions({headers: headers});
    this.http.post('http://localhost:9000/api/movie/', serializedForm, options)
      .subscribe(
        data => console.log('sent!', data),
        error => console.error('error', error)
      );
  }

  updateMovie(movie: Movie) {
    const serializedForm = JSON.stringify(movie);
    const headers: Headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    const options = new RequestOptions({headers: headers});
    this.http.put('http://localhost:9000/movie/', serializedForm, options)
      .subscribe(
        data => console.log('sent!', data),
        error => console.error('error', error)
      );
  }

  deleteMovie(id: number) {
    const headers: Headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    const options = new RequestOptions({headers: headers});
    this.http.delete('http://localhost:9000/movie/'+id, options)
      .subscribe(
        data => console.log('sent!', data),
        error => console.error('error', error)
      );
  }


  newCart(movie: MovieCart) {
    const serializedForm = JSON.stringify(movie);
    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    const options = new RequestOptions({headers: headers});
    console.log(serializedForm);
    this.http.post('http://localhost:9000/api/cart/', serializedForm, options)
      .subscribe(
        data => console.log('sent!', data),
        error => console.error('error', error)
      );
  }
}
