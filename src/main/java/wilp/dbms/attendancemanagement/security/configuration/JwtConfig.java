package wilp.dbms.attendancemanagement.security.configuration;

import wilp.dbms.attendancemanagement.filters.JwtTokenFilter;
import wilp.dbms.attendancemanagement.service.JWTService;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class JwtConfig extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {

    private JWTService jwtService;
    /*private JwtTokenProvider jwtTokenProvider;*/
    public JwtConfig(JWTService jwtService) {
        this.jwtService = jwtService;
    }
    @Override
    public void configure(HttpSecurity http) throws Exception {
        JwtTokenFilter customFilter = new JwtTokenFilter(jwtService);
        http.addFilterBefore(customFilter, UsernamePasswordAuthenticationFilter.class);
    }
}
