import {EventEmitter, Injectable} from '@angular/core';
import {Headers, Http, RequestOptions} from '@angular/http';
import 'rxjs/add/operator/map';

import {FormGroup} from '@angular/forms';
import {Movie} from "../movies/movie";


@Injectable()
export class AdminService {

  private linkMovie: string;
  constructor(private http: Http) { }

  getMovie(id: string) {
    console.log('id: ' + id);
    this.linkMovie = 'http://localhost:9000/api/movie/' + id + '/';
    return this.http.get(this.linkMovie)
      .map(res => res.json());
  }

  newMovie(movieForm: Movie) {
    const serializedForm = JSON.stringify(movieForm);
    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    const options = new RequestOptions({headers: headers});
    console.log(serializedForm);
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
    console.log(serializedForm);
    this.http.put('http://localhost:9000/api/movie/', serializedForm, options)
      .subscribe(
        data => console.log('sent!', data),
        error => console.error('error', error)
      );
  }
}
