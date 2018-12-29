import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';

import * as $ from 'jquery';
import { CookieService } from 'angular2-cookie/services/cookies.service';
import { LoginComponent } from './login/login.component';
import { MoviesComponent } from './movies/movies.components';
import {Routing} from "./app.routing";
import {APP_BASE_HREF} from "@angular/common";
import {CartComponent} from "./cart/cart.components";
import {AdminComponent} from "./admin/admin.components";

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    MoviesComponent,
    CartComponent,
    AdminComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    HttpModule,
    Routing
  ],
  providers: [CookieService, { provide: APP_BASE_HREF, useValue: '/' }],
  bootstrap: [AppComponent]
})

export class AppModule { }
