package wilp.dbms.attendancemanagement.service;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wilp.dbms.attendancemanagement.model.HealthState;
import wilp.dbms.attendancemanagement.repo.AttendanceRepo;

@Service
public class HealthCheckerServiceImpl implements HealthCheckerService {

	@Autowired
	AttendanceRepo attendanceRepo;

	@Override
	public HealthState getHealth() {
		// ** //
		// DB //
		// ** //
		short dbHealth = 100;
		try {
			attendanceRepo.getReferenceById(1); // just poll a row
		} catch (EntityNotFoundException enf) {
			dbHealth = 50; // Connection is successful but there is no data
		} catch (Exception ex) {
			dbHealth = 0; // Something else is wrong
		}

		// ******* //
		// BACKEND //
		// ******* //
		short backendServerHealth = 100; // If you reached this point, it means that the Server is fine

		// ******** //
		// FRONTEND //
		// ******** //
		short frontendServerHealth = 100; // TODO: Need to figure out a way to do this

		// Construct a State object using the data above
		HealthState healthState = new HealthState(dbHealth, backendServerHealth, frontendServerHealth);
		return healthState;
	}

}
