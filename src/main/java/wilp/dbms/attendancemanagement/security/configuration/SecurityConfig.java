package wilp.dbms.attendancemanagement.security.configuration;

import wilp.dbms.attendancemanagement.service.JWTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    private JWTService jwtService;

    @Autowired
    public void setJwtService(JWTService jwtService)
    {
        this.jwtService=jwtService;
    }
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //@formatter:off
        http
                .httpBasic().disable()
                .csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                /*.antMatchers("/auth/signin").permitAll()
                .antMatchers(HttpMethod.GET, "/vehicles/**").permitAll()
                .antMatchers(HttpMethod.DELETE, "/vehicles/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/v1/vehicles/**").permitAll()*/
                /*.anyRequest().authenticated()*/
                /*.antMatchers("/grapgql").hasIpAddress("10.247.16.103")*/
                .antMatchers("/login").permitAll()
                .antMatchers("/health").permitAll()
                .antMatchers("/login/**").permitAll() 
                .antMatchers("/swagger-ui/**").permitAll() 
                .antMatchers("/v3/api-docs/**").permitAll() 
                .antMatchers("/v3/api-docs/**").permitAll() 
                /*.antMatchers("/temp/**").authenticated()*/
                .anyRequest().permitAll() 
                /*.anyRequest().authenticated()
                .anyRequest().access("hasIpAddress('localhost') or hasIpAddress('127.0.0.1') or hasIpAddress('10.247.16.100') or hasIpAddress('10.247.16.103') or hasIpAddress('192.168.29.0/32') ")*/
                .and()
                .cors()
                .and()
                .apply(new JwtConfig(jwtService));
        //@formatter:on
    }

    /*@Override
    public void configure(WebSecurity web) throws Exception{
        web.ignoring().antMatchers("/graphql");
    }*/

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        //configuration.setAllowedOrigins(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("authorization", "content-type", "x-auth-token"));
        configuration.setExposedHeaders(Arrays.asList("x-auth-token"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
