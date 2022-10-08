import {Injectable} from '@angular/core';
import {Observable, Subject} from 'rxjs';
import {filter} from 'rxjs/operators';

import {Alert, AlertType} from '../_model/alert';

@Injectable({providedIn: 'root'})
export class AlertService {
  private subject = new Subject<Alert>();
  private defaultId = 'default-alert';

  // enable subscribing to alerts observable
  onAlert(id = this.defaultId): Observable<Alert> {
    return this.subject.asObservable().pipe(filter(x => x && x.id === id));
  }

  // convenience methods
  private readonly _duration = 3000;

  success(message: string, options?: any) {
    this.alert(new Alert({...options,
      autoClose: true,
      keepAfterRouteChange: true,
      fade: true,
      type: AlertType.Success,
      duration: this._duration,
      message}));
  }

  error(message: string, options?: any) {
    this.alert(new Alert({...options,
      autoClose: true,
      keepAfterRouteChange: true,
      fade: true,
      type: AlertType.Error,
      duration: this._duration,
      message}));
  }

  info(message: string, options?: any) {
    this.alert(new Alert({...options,
      autoClose: true,
      keepAfterRouteChange: true,
      fade: true,
      type: AlertType.Info,
      duration: this._duration,
      message}));
  }

  warn(message: string, options?: any) {
    this.alert(new Alert({...options,
      autoClose: true,
      keepAfterRouteChange: true,
      fade: true,
      type: AlertType.Warning,
      duration: this._duration,
      message}));
  }

  // main alert method
  alert(alert: Alert) {
    alert.id = alert.id || this.defaultId;
    this.subject.next(alert);
  }

  // clear alerts
  clear(id = this.defaultId) {
    this.subject.next(new Alert({id}));
  }
}
