import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {Headers, Http, RequestOptions} from "@angular/http";
import {Location} from "@angular/common";
import {CookieService} from "angular2-cookie/core";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})

export class LoginComponent implements OnInit {

  constructor(public activatedRoute: ActivatedRoute, private cookieService: CookieService, private router: Router) {
    let params: any = this.activatedRoute.snapshot.queryParams["auth"];
    if(params === undefined) {}
    else {
      this.cookieService.put("userAuth", params);
      console.log(this.cookieService.get("userAuth"));
      this.router.navigate(['movies']);
      window.location.reload();
    }
  }

  ngOnInit() {
  }

}
