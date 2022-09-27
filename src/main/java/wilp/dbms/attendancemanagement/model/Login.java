package wilp.dbms.attendancemanagement.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the Login database table.
 * 
 */
@Entity
@NamedQuery(name = "Login.findAll", query = "SELECT l FROM Login l")
public class Login implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "login_id")
	private int loginId;

	@Column(name = "login_user_pwd")
	private String loginUserPwd;

	@Column(name = "login_username")
	private String loginUsername;

	// bi-directional many-to-one association to User
	@OneToMany(mappedBy = "login")
	private List<User> users;

	public Login() {
	}

	public int getLoginId() {
		return this.loginId;
	}

	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}

	public String getLoginUserPwd() {
		return this.loginUserPwd;
	}

	public void setLoginUserPwd(String loginUserPwd) {
		this.loginUserPwd = loginUserPwd;
	}

	public String getLoginUsername() {
		return this.loginUsername;
	}

	public void setLoginUsername(String loginUsername) {
		this.loginUsername = loginUsername;
	}

	public List<User> getUsers() {
		return this.users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User addUser(User user) {
		getUsers().add(user);
		user.setLogin(this);

		return user;
	}

	public User removeUser(User user) {
		getUsers().remove(user);
		user.setLogin(null);

		return user;
	}

}