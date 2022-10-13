package wilp.dbms.attendancemanagement.security.model;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
public class User implements Serializable {
    @NotEmpty(message = "should not be blank")
    @Pattern(regexp = "[a-zA-Z0-9_.@\\-]*",message = "Invalid")
    private String loginId;
    @NotEmpty(message = "should not be blank")
    private String password;

    private Long empCode;

    private String empName;

    private List<String> roles;

    public User(@NotEmpty(message = "should not be blank") @Pattern(regexp = "[a-zA-Z0-9_.@\\-]*", message = "Invalid") String loginId, Long empCode, String empName,List<String> roles) {
        this.loginId = loginId;
        this.empCode = empCode;
        this.empName = empName;
        this.roles = roles;
    }

    @Override
    public String toString()
    {
        return "{\n" +
                "loginID:" + this.loginId + "\n" +
                "empCode:" + this.empCode + "\n" +
                "empName:" + this.empName + "\n" +
                "roles:" + this.roles.toString() + "\n" +
                "}";
    }
}
