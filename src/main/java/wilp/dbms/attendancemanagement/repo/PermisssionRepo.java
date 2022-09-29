package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.Permission;

@RepositoryRestResource(collectionResourceRel = "permission", path = "permission")
public interface PermisssionRepo extends JpaRepository<Permission, Integer> {

}
