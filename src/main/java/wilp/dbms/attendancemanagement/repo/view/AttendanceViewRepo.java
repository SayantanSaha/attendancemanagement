package wilp.dbms.attendancemanagement.repo.view;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.view.AttendanceView;

@RepositoryRestResource(collectionResourceRel = "v_attendance", path = "v_attendance")
public interface AttendanceViewRepo extends JpaRepository<AttendanceView, String> {

}
