import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';

@Injectable({
  providedIn: 'root',
})
export class AttendanceService {

  private ApiUrl: string = "http://localhost:8080/";

  constructor(private http: HttpClient) { }


  getDailyData() {
    return this.http.get<any>(this.ApiUrl + "v_attendance?page=0&size=10000");
  }

  getMonthlyData() {
    return this.http.get<any>(this.ApiUrl + "v_monthly_attendance?page=0&size=10000");
  }
}
