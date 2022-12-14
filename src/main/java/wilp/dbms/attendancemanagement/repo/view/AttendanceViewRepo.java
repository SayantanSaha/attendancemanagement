package wilp.dbms.attendancemanagement.repo.view;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.view.AttendanceView;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "v_attendance", path = "v_attendance")
public interface AttendanceViewRepo extends JpaRepository<AttendanceView, String> {

}
