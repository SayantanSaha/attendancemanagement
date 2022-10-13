package wilp.dbms.attendancemanagement.filters;

import com.fasterxml.jackson.databind.ObjectMapper;
import wilp.dbms.attendancemanagement.security.model.User;
import wilp.dbms.attendancemanagement.service.JWTService;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toList;

public class JwtTokenFilter extends GenericFilterBean {

    private JWTService jwtService;
    /*private JwtTokenProvider jwtTokenProvider;*/
    public JwtTokenFilter(JWTService jwtService) {
        this.jwtService = jwtService;
    }
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        //String token = jwtTokenProvider.resolveToken((HttpServletRequest) req);
        String token = null;
        String bearerToken = request.getHeader("Authorization");
        if (bearerToken != null && bearerToken.startsWith("Bearer ")) {
            token= bearerToken.substring(7);
        }
        Map<String,String> claim=null;
        if(jwtService == null)
        {
            System.out.println("JWT Service not found");
            return;
        }
        if(token!=null)
            claim = jwtService.validateToken(token);

        if (token != null && claim!=null) {

            String[] roles = new String[2];
            String userString = claim.get("userData");
            HashMap<String,Object> u = new ObjectMapper().readValue(userString,HashMap.class);
            HashMap<String,Object> c = (HashMap)u.get("contact");
            String email = (String)c.get("email");
            String empCodeString = (String) u.get("empCode");
            Long empCode = Long.parseLong(empCodeString);
            String empName = (String) u.get("empName");
            List<String> rolesList = Arrays.asList(roles);
            User user = new User(email,empCode,empName,rolesList );
            Authentication auth = new UsernamePasswordAuthenticationToken(user, "", user.getRoles().stream().map(SimpleGrantedAuthority::new).collect(toList()));
            SecurityContextHolder.getContext().setAuthentication(auth);
            System.out.println(user.toString());
        }
        filterChain.doFilter(req, res);
    }
}
