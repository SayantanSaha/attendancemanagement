
package wilp.dbms.attendancemanagement.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.lang.Strings;
import wilp.dbms.attendancemanagement.model.Login;
import wilp.dbms.attendancemanagement.repo.LoginRepo;

@RestController
public class LoginController
{
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    LoginRepo loginRepo;

    @Value("${jwt.lifetime}")
    private long validityInMilliseconds;

    @Value("${jwt.secret}")
    private String secret;

    @PostMapping(path = "/login")
    public Map doLogin(@RequestBody Map<String, String> payload, HttpServletRequest request){

        System.out.println(payload.get("username")+"----"+payload.get("password"));
        String username = payload.get("username");
        String password = payload.get("password");
        List<Login> login = loginRepo.findByLoginUsername(username);
        if(!login.isEmpty()){
            Login l = login.get(0);
            if(l!=null){
                if(l.getLoginUserPwd().equals(password))
                {
                    logger.info("Invalid Password", payload);
                    //return l.getUsers().get(0).getUserName();
                    Claims claims = Jwts.claims().setSubject(l.getLoginUsername());
                    String ipAddress = request.getHeader("X-FORWARDED-FOR");
                    if (ipAddress == null) {
                        ipAddress = request.getRemoteAddr();
                    }
                    else
                    {
                        ipAddress = ipAddress.split(",")[0];
                    }
                    claims.put("clientIP", ipAddress);
                    Date now = new Date();
                    Date validity = new Date(now.getTime() + validityInMilliseconds);

                    String token = Jwts.builder()
                                    .setClaims(claims)
                                    .setIssuedAt(now)
                                    .setExpiration(validity)
                                    .signWith(SignatureAlgorithm.HS512, secret)
                                    .compact();
                    Map m = new HashMap<String,String>();
                    m.put("username", l.getLoginUsername());
                    m.put("token",token);                    
                    return m;
                }
                else
                {
                    logger.info("Invalid Password:"+ payload.get("password")+":"+l.getLoginUserPwd());
                    return null;
                }                    
            }
            else
            {
                logger.info("Invalid Username:"+ payload.get("username"));
                return null;
            }      
        }
        else
        {
            logger.info("Invalid Username:"+ payload.get("username"));
            return null;
        }      
    }

    @PatchMapping(path =  "/change-password")
    public void changePassword(@RequestBody Map<String, String> payload, HttpServletRequest request) {
        List<Login> records = loginRepo.findByLoginUsername(payload.get("username"));
        if(!CollectionUtils.isEmpty(records)) {
            Login record = records.get(0);
            String oldPassword = payload.get("oldPassword");
            if(oldPassword == null || oldPassword.isEmpty()) {
                throw new IllegalArgumentException("Old password can not be empty in the request");
            }
            if(!record.getLoginUserPwd().equals(oldPassword)) {
                throw new IllegalArgumentException("Old password is not matching with current password");
            }
            String newPassssword = payload.get("newPassword");
            if(newPassssword == null || newPassssword.isEmpty()) {
                throw new IllegalArgumentException("New passssword can not be empty in the request");
            }
            record.setLoginUserPwd(payload.get("newPassword"));
            loginRepo.save(record);
        } else {
            logger.warn("no login records");
        }
    }
}