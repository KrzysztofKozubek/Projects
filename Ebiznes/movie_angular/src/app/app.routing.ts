import {RouterModule, Routes} from '@angular/router';
import {MoviesComponent} from './movies/movies.components';
import {ModuleWithProviders} from '@angular/core';
import {AppComponent} from './app.component';
import {LoginComponent} from './login/login.component';
import {CartComponent} from "./cart/cart.components";
import {AdminComponent} from "./admin/admin.components";

const appRoutes: Routes = [
  {path: '', component: LoginComponent},
  {path: 'movies', component: MoviesComponent},
  {path: 'cart', component: CartComponent},
  {path: 'admin', component: AdminComponent}
];

export const Routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);
