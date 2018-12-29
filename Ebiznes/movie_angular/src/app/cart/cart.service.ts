import {EventEmitter, Injectable} from '@angular/core';
import {Headers, Http, RequestOptions} from '@angular/http';
import 'rxjs/add/operator/map';

import {FormGroup} from '@angular/forms';
import {MovieCart} from "./movieCart";
import {Order} from "./cart.components";


@Injectable()
export class CartService {

  private linkMovie: string;
  constructor(private http: Http) { }

  getCart(idUser: string) {
    this.linkMovie = 'http://localhost:9000/api/cart/' + idUser + '/';
    return this.http.get(this.linkMovie).map(res => res.json());
  }

  newOrder(order: Order) {

    this.linkMovie = 'http://localhost:9000/api/order/';
    console.log(this.linkMovie);
    const serializedForm = JSON.stringify(order);
    const headers = new Headers();
    headers.append('Accept', 'application/json');
    headers.append('Content-Type', 'application/json');
    const options = new RequestOptions({headers: headers});
    console.log(serializedForm);
    this.http.post(this.linkMovie, serializedForm, options)
      .subscribe(
        data => console.log('sent!', data),
        error => console.error('error', error)
      );
  }

  deleteCart(id: number) {
    this.linkMovie = 'http://localhost:9000/api/cart/' + id + '/';
    console.log(this.linkMovie);
    this.http.delete(this.linkMovie).subscribe(
      data => {console.log('wyslane!', data)},
      error => console.error('nie bangla', error)
    );
  }

  deleteCartById(id: string) {
    this.linkMovie = 'http://localhost:9000/api/carts/' + id + '/';
    console.log(this.linkMovie);
    this.http.delete(this.linkMovie).subscribe(
      data => {console.log('wyslane!', data)},
      error => console.error('nie bangla', error)
    );
  }
}
