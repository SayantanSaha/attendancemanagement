import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router) {}
  canActivate() {
    //const date = new Date(sessionStorage.getItem('validTill'));
    const currDate = new Date();


    //if (sessionStorage.getItem('isLoggedin') && date.getTime() > currDate.getTime()) {
      if (sessionStorage.getItem('isLoggedin')) {
        return true;
    }

    this.router.navigate(['/login']);
    return false;
  }
  
}
