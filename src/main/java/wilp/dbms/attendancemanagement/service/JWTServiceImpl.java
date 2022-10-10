package wilp.dbms.attendancemanagement.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Service
public class JWTServiceImpl implements JWTService {
    

    @Override
    public Map<String,String> validateToken(String token)
    {
        HashMap<String,String> claim=null;
        try{
            //TODO implement

        }
        catch (Exception e)
        {
            e.printStackTrace();

        }
        finally {
            return claim;
        }
    }
}
