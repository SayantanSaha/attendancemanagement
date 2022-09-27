package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.AttendanceType;

@RepositoryRestResource(collectionResourceRel = "attendancetype", path = "attendancetype")
public interface AttendanceTypeRepo extends JpaRepository<AttendanceType, Integer> {

}
