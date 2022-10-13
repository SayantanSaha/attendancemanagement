package wilp.dbms.attendancemanagement.service;

import java.util.Map;

//@Service
public interface JWTService {
    Map<String,String> validateToken(String token);
}
