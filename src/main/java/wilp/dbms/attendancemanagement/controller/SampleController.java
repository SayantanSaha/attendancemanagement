package wilp.dbms.attendancemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import wilp.dbms.attendancemanagement.repo.AttendanceRepo;

@RestController
public class SampleController {

	@Autowired
	AttendanceRepo attRepo;

	@GetMapping(path = "/attendances", produces = MediaType.TEXT_HTML_VALUE)
	public String getAttendances() {
		return "Check <a href='http://localhost:8080/attendance'>http://localhost:8080/attendance</a>";
	}
}
