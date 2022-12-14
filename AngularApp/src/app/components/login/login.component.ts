import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AttendanceService } from '../../attendance.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  constructor(private router: Router,
    private attendanceService: AttendanceService) { }

  username: string='';
  password: string='';

  ngOnInit(): void {
    this.username = '';
    this.password = '';
  }

  doLogin(){
    this.attendanceService
      .login(this.username,this.password)
      .subscribe(
        user=>{
          if(user!=null){
            sessionStorage.setItem('isLoggedin', 'true');
            sessionStorage.setItem('user', user.username);
            sessionStorage.setItem('token', user.token);
            this.router.navigate(['/dashboard']);
          }
        }
      )
  }
 

}
