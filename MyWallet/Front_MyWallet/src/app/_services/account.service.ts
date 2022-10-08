import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {HttpClient} from '@angular/common/http';
import {map} from 'rxjs/operators';

import {environment} from '../../environments/environment';
import {User} from '../_model/user';

@Injectable({providedIn: 'root'})
export class AccountService {

  constructor(
    private router: Router,
    private http: HttpClient,
  ) {
  }

  public get token() : string | null {
    return localStorage.getItem(environment.TOKEN_STORE_KEY);
  }

  public get userValue(): User | null {
    const userDetailsJSON = localStorage.getItem(environment.USER_STORE_KEY);
    if (userDetailsJSON && userDetailsJSON !== "") {
      return JSON.parse(userDetailsJSON);
    }
    return null;
  }

  login(login: string, password: string) {
    return this.http.post<any>(`${environment.apiUrl}${environment.loginUrl}`, {login, password})
      .pipe(map(response => {
        localStorage.setItem(environment.TOKEN_STORE_KEY, response.token);
        return response;
      }))
      .pipe(map(response => {
        this.getMe();
        return response;
      }));
  }

  getMe() {
    return this.http.get<User>(`${environment.apiUrl}${environment.userDetailsUrl}`)
      .pipe(map(response => {
        localStorage.setItem(environment.USER_STORE_KEY, JSON.stringify(response));
        return response;
      }));
  }

  logout() {
    console.log(`logout`)
    localStorage.removeItem(environment.USER_STORE_KEY);
    localStorage.removeItem(environment.TOKEN_STORE_KEY);
    console.log(`navigate to ${environment.loginUrl}`)
    this.router.navigate([`${environment.loginUrl}`]);
  }

  // register(user: User) {
  //   return this.http.post(`${environment.apiUrl}/users/register`, user);
  // }
}
