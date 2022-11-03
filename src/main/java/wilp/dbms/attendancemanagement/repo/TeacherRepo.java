package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.Teacher;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "teacher", path = "teacher")
public interface TeacherRepo extends JpaRepository<Teacher, Integer> {

}
