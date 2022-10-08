import {Component, OnInit} from '@angular/core';
import {FormBuilder, FormControl, FormGroup} from '@angular/forms';
import {first} from 'rxjs/operators';
import {ActivatedRoute, Router} from "@angular/router";

import {AccountService} from "../_services/account.service";
import {AlertService} from "../_alert";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  form = new FormGroup({
    login: new FormControl(''),
    password: new FormControl(''),
  });
  loading = false;
  submitted = false;
  hide = true;

  constructor(
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private accountService: AccountService,
    private alertService: AlertService,
    private router: Router) {
  }

  ngOnInit() {
  }

  get f() {
    return this.form.controls;
  }

  onSubmit() {
    this.submitted = true;

    // stop here if form is invalid
    if (this.form.invalid) {
      return;
    }
    this.loading = true;
    const login: string | null = this.f.login.value;
    const password: string | null = this.f.password.value;

    if (login === null || login === "") {
      console.log("Missing login");
      this.alertService.error("Missing login");
    } else if (password === null || password === "") {
      console.log("Missing password");
      this.alertService.error("Missing password");
    } else {
      console.log(`try to log with login:'${login}' password:'${password}'`);
      this.accountService.login(login, password)
        .pipe(first())
        .subscribe({
          next: (response) => {
            // get return url from query parameters or default to home page
            this.fillUserDetails();
            const returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
            this.router.navigateByUrl(returnUrl);
          },
          error: error => {
            const errorMsg = `Incorrect login or password! ${JSON.stringify(error)}`;
            console.log(`LoginComponent ${errorMsg} ${JSON.stringify(error)}`);
            this.alertService.error(errorMsg);
            this.loading = false;
          }
        });
    }
  }

  private fillUserDetails(): void {
    this.accountService.getMe()
      .pipe(first())
      .subscribe({
        next: (response) => {
          console.log(`get user details`);
        },
        error: error => {
          const errorMsg = `problem with get user details: ${JSON.stringify(error)}`;
          console.log(`LoginComponent ${errorMsg}`);
          this.alertService.error(errorMsg, {});
        }
      });
  }
}
