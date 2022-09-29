package wilp.dbms.attendancemanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import wilp.dbms.attendancemanagement.model.Message;

@RepositoryRestResource(collectionResourceRel = "message", path = "message")
public interface MessageRepo extends JpaRepository<Message, Integer> {

}
