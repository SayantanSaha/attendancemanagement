package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.User;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "user", path = "user")
public interface UserRepo extends JpaRepository<User, Integer> {

}
