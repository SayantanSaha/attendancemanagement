import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AttendanceService } from '../../attendance.service';
import { DatePipe } from '@angular/common'
import { forkJoin } from 'rxjs/internal/observable/forkJoin';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})

export class DashboardComponent implements OnInit {

  isLoading: boolean = true;
  // Bar Chart
  dailyAbsenseGraph: any = {
    data: [
      {
        x: ['01-10-2022', '02-10-2022', '03-10-2022', '04-10-2022'],
        y: [10, 20, 30, 5],
        type: 'scatter',
        mode: 'lines+points',
        marker: { color: 'blue' }
      },
      {
        x: [], y: [],
        type: 'bar',
        marker: { color: 'red' }
      }
    ],
    layout: { title: 'Dialy Absence Graph' }
  };

  // Bar Chart
  dailyPresentGraph: any = {
    data: [
      {
        x: ['01-10-2022', '02-10-2022', '03-10-2022', '04-10-2022'],
        y: [10, 20, 30, 5],
        type: 'scatter',
        mode: 'lines+points',
        marker: { color: 'blue' }
      },
      {
        x: [], y: [],
        type: 'bar',
        marker: { color: 'sky-blue' }
      }
    ],
    layout: { title: 'Dialy Present Graph' }
  };

  // Line chart
  monthlyAbsenceChart = {
    data: [
      { x: ['January', 'February', 'March'], y: [10, 40, 90, 40, 10], type: 'scatter' },
    ],
    /*layout: { width: 500, height: 400, title: 'Monthly absense report' }*/
    layout: { title: 'Monthly Absence Chart' }
  };

  // Pie chart
  overallPieChart = {
    data: [
      { labels: ['Present', 'Absent', 'Field Trip'], values: [100, 5, 20], row: 10, column: 10, type: 'pie' },
    ],
    layout: { title: `Overall report`  }
  };

  constructor(private router: Router,
    private attendanceService: AttendanceService,
    public datepipe: DatePipe) {
  }

  ngOnInit() {
    let response1 = this.attendanceService.getDailyData();
    let response2 = this.attendanceService.getMonthlyData();
    // Observable.forkJoin (RxJS 5) changes to just forkJoin() in RxJS 6
    forkJoin([response1, response2]).subscribe(responseList => {
      let attendanceDetails = responseList[0]["_embedded"]["v_attendance"];
      this.dailyAbsenseGraph.data[0]["x"] = [];
      this.dailyAbsenseGraph.data[0]["y"] = [];
      this.dailyPresentGraph.data[0]["x"] = [];
      this.dailyPresentGraph.data[0]["y"] = [];
      this.overallPieChart.data[0]["values"] = [0, 0, 0];
      attendanceDetails = attendanceDetails.sort((a: any, b: any) => new Date(b.date).getTime() - new Date(a.date).getTime());
      for (var i = 0; i < attendanceDetails.length; i++) {
        if (attendanceDetails[i].attendanceType == "Absent") {
          this.dailyAbsenseGraph.data[0]["x"].push(this.datepipe.transform(new Date(attendanceDetails[i].date), 'dd/MM/yyyy') ?? '');
          this.dailyAbsenseGraph.data[0]["y"].push(attendanceDetails[i].count);
          this.overallPieChart.data[0]["values"][1] = this.overallPieChart.data[0]["values"][1] + attendanceDetails[i].count;
        } else if (attendanceDetails[i].attendanceType == "Present") {
          this.dailyPresentGraph.data[0]["x"].push(this.datepipe.transform(new Date(attendanceDetails[i].date), 'dd/MM/yyyy') ?? '');
          this.dailyPresentGraph.data[0]["y"].push(attendanceDetails[i].count);
          this.overallPieChart.data[0]["values"][0] = this.overallPieChart.data[0]["values"][0] + attendanceDetails[i].count;
        }
      }
      this.dailyAbsenseGraph.data[1]["x"] = this.dailyAbsenseGraph.data[0]["x"];
      this.dailyAbsenseGraph.data[1]["y"] = this.dailyAbsenseGraph.data[0]["y"];
      this.dailyPresentGraph.data[1]["x"] = this.dailyPresentGraph.data[0]["x"];
      this.dailyPresentGraph.data[1]["y"] = this.dailyPresentGraph.data[0]["y"];

      attendanceDetails = responseList[1]["_embedded"]["v_monthly_attendance"];
      this.monthlyAbsenceChart.data[0]["x"] = [];
      this.monthlyAbsenceChart.data[0]["y"] = [];
      for (var i = 0; i < attendanceDetails.length; i++) {
        if (attendanceDetails[i].attendanceType == "Absent") {
          this.monthlyAbsenceChart.data[0]["x"].push(attendanceDetails[i].date);
          this.monthlyAbsenceChart.data[0]["y"].push(attendanceDetails[i].count);
        }
      }

      this.isLoading = false;
    });

    //this.attendanceService.getDailyData()
    //  .subscribe((data: any) => {
    //    let attendanceDetails = data["_embedded"]["v_attendance"];
    //    this.dailyAbsenseGraph.data[0]["x"] = [];
    //    this.dailyAbsenseGraph.data[0]["y"] = [];
    //    attendanceDetails = attendanceDetails.sort((a: any, b: any) => new Date(b.date).getTime() - new Date(a.date).getTime());
    //    for (var i = 0; i < attendanceDetails.length; i++) {
    //      if (attendanceDetails[i].attendanceType == "Absent") {
    //        this.dailyAbsenseGraph.data[0]["x"].push(this.datepipe.transform(new Date(attendanceDetails[i].date), 'dd/MM/yyyy') ?? '');
    //        this.dailyAbsenseGraph.data[0]["y"].push(attendanceDetails[i].count);
    //      }
    //    }
    //    this.dailyAbsenseGraph.data[1]["x"] = this.dailyAbsenseGraph.data[0]["x"];
    //    this.dailyAbsenseGraph.data[1]["y"] = this.dailyAbsenseGraph.data[0]["y"];
    //    this.isLoading = false;
    //  });

    //this.attendanceService.getMonthlyData()
    //  .subscribe((data: any) => {
    //    let attendanceDetails = data["_embedded"]["v_monthly_attendance"];
    //    this.monthlyAbsenceChart.data[0]["x"] = [];
    //    this.monthlyAbsenceChart.data[0]["y"] = [];
    //    for (var i = 0; i < attendanceDetails.length; i++) {
    //      if (attendanceDetails[i].attendanceType == "Absent") {
    //        this.monthlyAbsenceChart.data[0]["x"].push(attendanceDetails[i].date);
    //        this.monthlyAbsenceChart.data[0]["y"].push(attendanceDetails[i].count);
    //      }
    //    }
    //    this.isLoading = false;
    //  });
  }
}
