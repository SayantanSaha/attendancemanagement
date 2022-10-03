package wilp.dbms.attendancemanagement.repo.view;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.view.MonthlyAttendanceView;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "v_monthly_attendance", path = "v_monthly_attendance")
public interface MonthlyAttendanceViewRepo extends JpaRepository<MonthlyAttendanceView, String> {

}
