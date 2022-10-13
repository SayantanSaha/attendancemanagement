import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { Login } from './components/login/login';

@Injectable({
  providedIn: 'root',
})
export class AttendanceService {

  private ApiUrl: string = "http://localhost:8080/";

  private handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      // A client-side or network error occurred. Handle it accordingly.
      console.error('An error occurred:', error.error.message);
      return throwError('User defined error.' + error.error.message);
    } else {
      // The backend returned an unsuccessful response code.
      // The response body may contain clues as to what went wrong,
      console.error(
        `Backend returned code ${error.status}, ` +
        `body was: `);
      console.log(error.error);
      return throwError('User defined error.' + error.statusText);
    }
    // return an observable with a user-facing error message
    /*if (error instanceof Error) {
      this.zone.run(() => {
        this.snackBar.open("MESSAGE", "", {
          duration: 5000,
          horizontalPosition: "right"
        });
      });
      return;
    }
    return throwError('Something bad happened; please try again later.');*/
  }

  constructor(private http: HttpClient) { }


  getDailyData() {
    return this.http.get<any>(this.ApiUrl + "v_attendance?page=0&size=10000");
  }

  getMonthlyData() {
    return this.http.get<any>(this.ApiUrl + "v_monthly_attendance?page=0&size=10000");
  }

  login(userName: String): Observable<Login> {
    
    return this.http.get<Login>(this.ApiUrl+'login/search/findByLoginUsername?username='+userName).pipe(
      catchError(this.handleError)
    );
  }
}
