package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import wilp.dbms.attendancemanagement.model.Message;

@CrossOrigin("*")
@RepositoryRestResource(collectionResourceRel = "message", path = "message")
public interface MessageRepo extends JpaRepository<Message, Integer> {

}
