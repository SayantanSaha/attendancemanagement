package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.Permission;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "permission", path = "permission")
public interface PermisssionRepo extends JpaRepository<Permission, Integer> {

}
