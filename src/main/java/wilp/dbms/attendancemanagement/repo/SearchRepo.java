package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.Search;

@RepositoryRestResource(collectionResourceRel = "search", path = "search")
public interface SearchRepo extends JpaRepository<Search, Integer> {

}
