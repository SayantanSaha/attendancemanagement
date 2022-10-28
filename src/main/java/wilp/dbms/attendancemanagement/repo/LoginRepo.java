package wilp.dbms.attendancemanagement.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.Login;

@CrossOrigin("*")
//@RepositoryRestResource(collectionResourceRel = "login", path = "login")
public interface LoginRepo extends JpaRepository<Login, Integer> {
    public List<Login> findByLoginUsername(String username);
}
