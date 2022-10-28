import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AttendanceService } from '../../attendance.service';
import {MatSnackBar} from '@angular/material/snack-bar';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.scss']
})
export class ChangePasswordComponent implements OnInit {

  constructor(private router: Router,
    private attendanceService: AttendanceService,
    private snackBar: MatSnackBar) { }

    oldPassword: string='';
    newPassword: string='';
  
    ngOnInit(): void {
      this.oldPassword = '';
      this.newPassword = '';
    }

  doChangePassword() {
    let username = sessionStorage.getItem('user');
    username = username == null ? '' : username;
    this.attendanceService
      .changePassword(username, this.oldPassword, this.newPassword)
      .subscribe(() => {
        this.snackBar.open('Password changed successfully for ' + username, 'Ok', {
          duration: 4 * 1000,
        });
        setTimeout(() => {
          this.router.navigate(['/dashboard']);
        }, 2000);
      },
      () => {
        this.snackBar.open('Error occurred. Check logs.', 'Ok', {
          duration: 4 * 1000,
        });
      });

    
  }

}
