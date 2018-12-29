import {Component, OnDestroy, OnInit} from '@angular/core';
import {ActivatedRoute, Data, Params, Router} from '@angular/router';
import {CookieService} from "angular2-cookie/core";
import {CartService} from "./cart.service";
import {forEach} from "@angular/router/src/utils/collection";
import {Location} from "@angular/common";


@Component({
  selector: 'app-cart',
  templateUrl: './cart.html',
  providers: [CartService]
})
export class CartComponent implements OnInit, OnDestroy {

  carts: MovieCart[] = [];
  orders: Order[] = [];
  idUser: string;
  costMovie: number;
  costShipment: number;
  cost: number;
  address: string;

  constructor(private cartService: CartService, private cookieService: CookieService, private activatedRoute: ActivatedRoute,
              private location:Location, private router: Router) { }

  ngOnInit(): void {
    this.idUser = this.cookieService.get("userAuth");
    console.log(this.idUser != 'undefined');
    if(typeof this.idUser === 'undefined') {
      this.location.replaceState('/');
      this.router.navigate(['']);
    }
    // this.idUser = "111493230806075182303";
    this.costShipment = 15;
    this.setCarts();
  }

  setCarts() {
    this.cartService.getCart(this.idUser).subscribe(json => {
      this.carts = json;
      this.costMovie = 0;
      this.carts.forEach(ele => {this.costMovie += ele.price;});
      this.cost = this.costMovie + this.costShipment;
    });

  }

  ngOnDestroy(): void { }

  deleteCart(id: number) {
    this.cartService.deleteCart(id);
    // window.location.reload();
    this.setCarts();
    // window.location.reload();
    this.setCarts();
  }

  clickShipment(cost: number) {
    this.costShipment = cost;
    this.cost = this.costMovie + cost;
  }

  clickAddress(event) {

    if (event && event.target.value && event.target.value.length > 0) {
      this.address = event.target.value;
    }
  }

  clickBuy() {
    var date = new Date();
    var order: Order = new Order();
    order.id = 0;
    order.idUser = this.idUser;
    order.address = this.address;
    order.shipment = this.costShipment.toString();
    order.orderJSON = JSON.stringify(this.carts);
    order.cost = this.cost;
    order.date = date.getFullYear() + "-" + date.getMonth() + "-" + date.getDay();

    this.cartService.newOrder(order);
    this.cartService.deleteCartById(this.idUser);
  }
}

export class Order {
  id: number;
  idUser: string;
  address: string;
  shipment: string;
  orderJSON: string;
  cost: number;
  date: string;
}

interface MovieCart {
  id: number;
  idUser: string;
  title: string;
  poster: string;
  price: number;
}
