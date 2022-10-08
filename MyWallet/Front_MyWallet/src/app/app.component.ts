import {Component} from '@angular/core';
import {AlertService} from "./_alert";
import {AccountService} from "./_services/account.service";
import {environment} from "../environments/environment";
import {User} from "./_model/user";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'kk-my-wallet';
  options = {
    autoClose: false,
    keepAfterRouteChange: false
  };

  constructor(
    private alertService: AlertService,
    private accountService: AccountService,
  ) {
    console.log(environment.production);
  }

  public getUserDetails(): User {
    const userDetails = this.accountService.userValue;
    return userDetails ? userDetails : new User();
  }

  public isAuthenticated(): boolean {
    const token = localStorage.getItem(environment.TOKEN_STORE_KEY);
    return token !== null && token !== "";
  }

  public logout(): void {
    this.accountService.logout();
  }
}
