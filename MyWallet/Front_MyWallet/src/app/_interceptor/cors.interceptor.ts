// import {Injectable} from '@angular/core';
// import {HttpEvent, HttpHandler, HttpHeaders, HttpInterceptor, HttpRequest} from '@angular/common/http';
// import {Observable} from 'rxjs';
//
// import {environment} from '../../environments/environment';
// import {AccountService} from '../_services/account.service';
//
// @Injectable()
// export class CorsInterceptor implements HttpInterceptor {
//
//   constructor(private accountService: AccountService) {
//   }
//
//   intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
//     request = request.clone({
//       headers: request.headers.set('Access-Control-Allow-Headers', `Origin, X-Requested-With, Content-Type, Accept`)
//     });
//     return next.handle(request);
//   }
// }
