package wilp.dbms.attendancemanagement.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration

public class CustomWebMvcConfigurer implements WebMvcConfigurer {

/*@Value("${eSignServiceDomain}")
    String eSignServiceDomain;*/


    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedMethods("HEAD", "GET", "PUT", "POST", "DELETE", "PATCH", "OPTIONS")
                .allowedOrigins("*")
                .maxAge(3600)
                .allowCredentials(false);
    }
}
