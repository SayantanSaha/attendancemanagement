package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.Attendance;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "attendance", path = "attendance")
public interface AttendanceRepo extends JpaRepository<Attendance, Integer> {

}
