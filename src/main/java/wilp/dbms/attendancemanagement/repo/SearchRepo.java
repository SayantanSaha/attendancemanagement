package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.Search;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "search", path = "search")
public interface SearchRepo extends JpaRepository<Search, Integer> {

}
