import {Component, OnInit} from '@angular/core';
import {AppService} from "./app.service";
import {Location} from "@angular/common";
import {ActivatedRoute, Router} from "@angular/router";
import {CookieService} from "angular2-cookie/core";
import {User} from "./user/user";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [AppService]
})

export class AppComponent {

  loggedUser: User = new User;
  isAdmin: Boolean = false;
  isLogged: Boolean = false;

  constructor(private appService: AppService, private router: Router, private location:Location,
              private cookieService: CookieService, public activatedRoute: ActivatedRoute) {

    var cookieName = this.cookieService.get("userAuth");
    if(cookieName === undefined ) {
      if(this.location.path().startsWith("/?auth=") || this.location.path() == "" || this.location.path() == "/") {
        console.log("login");
      }
      else {
        // this.location.replaceState('');
        // this.router.navigate(['']);
      }
    }
    else {
      this.appService.getLoggedUser(cookieName).subscribe( data => {
        var arr = data.json();
        if(arr.length == 0) {
          // this.cookieService.remove("userAuth");
          // this.location.replaceState('/');
          // this.router.navigate(['']);
        }
        else {
          this.loggedUser = arr[0];
          if(this.loggedUser.isAdmin == 1)
            this.isAdmin = true;
            this.isLogged = true;
        }
      })
    }
  }

  logout() {
    this.appService.logout().subscribe(data => {
      this.cookieService.remove("userAuth");
      this.location.replaceState('/');
      this.router.navigate(['']);
      this.isLogged = false;
      this.isAdmin = false;
    })
  }
}
