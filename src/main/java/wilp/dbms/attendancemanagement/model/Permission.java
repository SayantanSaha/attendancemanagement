package wilp.dbms.attendancemanagement.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

/**
 * The persistent class for the Permission database table.
 * 
 */
@Entity(name = "Permission")
@NamedQuery(name = "Permission.findAll", query = "SELECT p FROM Permission p")
public class Permission implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "per_id")
	private int perId;

	@Column(name = "per_name")
	private String perName;

	@Column(name = "per_topic")
	private String perTopic;

	// bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;

	public Permission() {
	}

	public int getPerId() {
		return this.perId;
	}

	public void setPerId(int perId) {
		this.perId = perId;
	}

	public String getPerName() {
		return this.perName;
	}

	public void setPerName(String perName) {
		this.perName = perName;
	}

	public String getPerTopic() {
		return this.perTopic;
	}

	public void setPerTopic(String perTopic) {
		this.perTopic = perTopic;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}