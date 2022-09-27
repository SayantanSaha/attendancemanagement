package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.Login;

@RepositoryRestResource(collectionResourceRel = "login", path = "login")
public interface LoginRepo extends JpaRepository<Login, Integer> {

}
