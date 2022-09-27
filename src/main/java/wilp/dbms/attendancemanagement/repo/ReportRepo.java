package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.Report;

@RepositoryRestResource(collectionResourceRel = "report", path = "report")
public interface ReportRepo extends JpaRepository<Report, Integer> {

}
