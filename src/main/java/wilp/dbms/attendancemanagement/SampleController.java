package wilp.dbms.attendancemanagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import wilp.dbms.attendancemanagement.model.Attendance;
import wilp.dbms.attendancemanagement.repo.AttendanceRepo;

@RestController
public class SampleController {

	@Autowired
	AttendanceRepo attRepo;

	@GetMapping(path = "/attendances", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Attendance> getAttendances() {
		return attRepo.findAll();
	}
}
