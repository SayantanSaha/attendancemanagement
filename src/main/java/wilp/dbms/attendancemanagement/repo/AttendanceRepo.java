package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.Attendance;

@RepositoryRestResource(collectionResourceRel = "attendance", path = "attendance")
public interface AttendanceRepo extends JpaRepository<Attendance, Integer> {

}
