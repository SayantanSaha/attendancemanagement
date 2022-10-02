package wilp.dbms.attendancemanagement.service;

import org.springframework.stereotype.Service;

import wilp.dbms.attendancemanagement.model.HealthState;

@Service
public interface HealthCheckerService {
	public HealthState getHealth();
}
