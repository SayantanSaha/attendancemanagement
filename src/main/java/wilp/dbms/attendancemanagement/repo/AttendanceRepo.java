package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import wilp.dbms.attendancemanagement.model.Attendance;

public interface AttendanceRepo extends JpaRepository<Attendance, Integer> {

}
