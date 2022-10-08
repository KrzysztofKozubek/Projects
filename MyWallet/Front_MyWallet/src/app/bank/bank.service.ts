import {Injectable} from '@angular/core';
import {Router} from '@angular/router';
import {HttpClient} from '@angular/common/http';
import {first, map} from 'rxjs/operators';

import {environment} from '../../environments/environment';
import {Bank} from "../_model/bank";
import {AlertService} from "../_alert";

@Injectable({providedIn: 'root'})
export class BankService<T extends Bank = Bank> {

  private path = `${environment.bankUrl}/`;
  private ERROR_MSG = `Problem with request`;

  constructor(
    private router: Router,
    private http: HttpClient,
    private alertService: AlertService,
  ) {
  }

  getAll() {
    return this.http.get<T[]>(`${environment.apiUrl}${this.path}`)
      .pipe(map(response => {
        return response;
      }));
  }

  funGetAll(functionSubscribe: any, funError: any) {
    this.getAll()
      .pipe(first())
      .subscribe({
        next: (response) => {
          functionSubscribe(response);
          return response;
        },
        error: error => {
          funError(error);
          console.log(`${this.ERROR_MSG} ${JSON.stringify(error)}`);
          this.alertService.error(`${this.ERROR_MSG}`);
        }
      });
  }

  subscribeGet(observeObject: any, refreshMethod: any) {
    this.funGetAll((objects: T[]) => {
      observeObject(objects);
      refreshMethod();
    }, () => {
    });
  }

  add(object: T) {
    return this.http.put<void>(`${environment.apiUrl}${this.path}`, object)
      .pipe(map(response => {
        return response;
      }));
  }

  funAdd(object: T, functionSubscribe: any, funError: any) {
    this.add(object)
      .pipe(first())
      .subscribe({
        next: (response) => {
          functionSubscribe(response);
          this.alertService.info(`object has been added`);
          return response;
        },
        error: error => {
          funError(error);
          console.log(`${this.ERROR_MSG} ${JSON.stringify(error)}`);
          this.alertService.error(`${this.ERROR_MSG}`);
        }
      });
  }

  edit(object: T) {
    return this.http.post<void>(`${environment.apiUrl}${this.path}`, object)
      .pipe(map(response => {
        return response;
      }));
  }

  funEdit(object: T, functionSubscribe: any, funError: any) {
    this.edit(object)
      .pipe(first())
      .subscribe({
        next: (response) => {
          functionSubscribe(response);
          this.alertService.info(`object has been edited`);
          return response;
        },
        error: error => {
          funError(error);
          console.log(`${this.ERROR_MSG} ${JSON.stringify(error)}`);
          this.alertService.error(`${this.ERROR_MSG}`);
        }
      });
  }

  remove(idObject: number) {
    return this.http.delete<void>(`${environment.apiUrl}${this.path}${idObject}`)
      .pipe(map(response => {
        return response;
      }));
  }

  funRemove(idObject: number, functionSubscribe: any, funError: any) {
    this.remove(idObject)
      .pipe(first())
      .subscribe({
        next: (response) => {
          functionSubscribe(response);
          this.alertService.info(`object has been removed`);
          return response;
        },
        error: error => {
          funError(error);
          console.log(`${this.ERROR_MSG} ${JSON.stringify(error)}`);
          this.alertService.error(`${this.ERROR_MSG}`);
        }
      });
  }

  getBank(idBank: number) {
    return this.http.get<Bank>(`${environment.apiUrl}${this.path}/${idBank}/`)
      .pipe(map(response => {
        return response;
      }));
  }

  openWeb(item: T) {
    this.router.navigate(
      [`/transaction`],
      {
        queryParams: {
          bankId: item?.id
        }
      }
    );
  }
}
