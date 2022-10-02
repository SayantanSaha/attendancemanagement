package wilp.dbms.attendancemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import wilp.dbms.attendancemanagement.model.HealthState;
import wilp.dbms.attendancemanagement.service.HealthCheckerService;

@RestController("/")
public class HealthCheckController {

	@Autowired
	HealthCheckerService healthChecker;

	@GetMapping("health")
	public ResponseEntity<HealthState> getHealth() {
		// Fetch the Server's Health State
		HealthState healthState = healthChecker.getHealth();

		// Calculate the Response Code based on the Server State
		HttpStatus responseCode = healthState.getOverallHealth() == 100 ? HttpStatus.OK
				: HttpStatus.INTERNAL_SERVER_ERROR;

		// Build a custom Response Entity based on the states
		return new ResponseEntity<HealthState>(healthState, responseCode);
	}
}
