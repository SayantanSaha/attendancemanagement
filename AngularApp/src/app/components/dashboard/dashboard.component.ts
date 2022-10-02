import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})

export class DashboardComponent implements OnInit {

  // Bar Chart
  public barChart = {
    data: [
      { x: ['01-10-2022', '02-10-2022', '03-10-2022', '04-10-2022'], y: [10, 20, 30, 5], type: 'scatter', mode: 'lines+points', marker: { color: 'red' } },
      { x: ['01-10-2022', '02-10-2022', '03-10-2022', '04-10-2022'], y: [10, 20, 30, 5], type: 'bar' },
    ],
    layout: { title: 'Absense graph' }
  };

  // Line chart
  lineChart = {
    data: [
      { x: ['January', 'February', 'March'], y: [10, 40, 90, 40, 10], type: 'scatter' },
    ],
    /*layout: { width: 500, height: 400, title: 'Monthly absense report' }*/
    layout: { title: 'Monthly absense report' }
  };

  // Pie chart
  pieChart = {
    data: [
      { title: ['Presnt', 'Absent', 'Field Trip'], values: [100, 5, 20], row: 10, column: 10, type: 'pie' },
    ],
    layout: { title: `Today's overall report`  }
  };

  constructor(private router: Router) {
  }

  ngOnInit() {
  } 
}
