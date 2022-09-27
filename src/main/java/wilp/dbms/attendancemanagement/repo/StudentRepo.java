package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.Student;

@RepositoryRestResource(collectionResourceRel = "student", path = "student")
public interface StudentRepo extends JpaRepository<Student, Integer> {

}
