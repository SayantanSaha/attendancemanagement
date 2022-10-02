package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.Student;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "student", path = "student")
public interface StudentRepo extends JpaRepository<Student, Integer> {

}
