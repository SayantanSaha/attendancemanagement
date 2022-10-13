package wilp.dbms.attendancemanagement.security.provider;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import java.util.HashSet;
import java.util.Set;

public class CustomIpAuthenticationProvider implements AuthenticationProvider {
    Set<String> whitelist = new HashSet<String>();

    public CustomIpAuthenticationProvider() {
        whitelist.add("localhost");
        whitelist.add("127.0.0.1");        
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        WebAuthenticationDetails details=(WebAuthenticationDetails)authentication.getDetails();
        String userIp = details.getRemoteAddress();
        if(!whitelist.contains(userIp))
            throw new BadCredentialsException("Invalid IP Address");
        return authentication;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }
}
