package wilp.dbms.attendancemanagement.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the Teacher database table.
 * 
 */
@Entity(name = "Teacher")
@NamedQuery(name = "Teacher.findAll", query = "SELECT s FROM Teacher s")
public class Teacher implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "teacher_id")
	private int teacherId;

	@Column(name = "date_of_joining")
	private Timestamp joiningDate;

	@Column(name = "date_of_birth")
	private Timestamp dateOfBirth;

	@Column(name = "ed_level")
	private String edLevel;

	private String gender;

	private String nationality;

	private String department;

	private String designation;

	private String specialization;

	@Column(name = "teacher_contact")
	private String teacherContact;

	@Column(name = "teacher_first_name")
	private String teacherFirstName;

	@Column(name = "teacher_last_name")
	private String teacherLastName;

	public Teacher() {
	}

	public int getteacherId() {
		return this.teacherId;
	}

	public void setteacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	public Timestamp getjoiningDate() {
		return this.joiningDate;
	}

	public void setjoiningDate(Timestamp joiningDate) {
		this.joiningDate = joiningDate;
	}

	public Timestamp getDateOfBirth() {
		return this.dateOfBirth;
	}

	public void setDateOfBirth(Timestamp dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEdLevel() {
		return this.edLevel;
	}

	public void setEdLevel(String edLevel) {
		this.edLevel = edLevel;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return this.nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getdepartment() {
		return this.department;
	}

	public void setdepartment(String department) {
		this.department = department;
	}

	public String getdesignation() {
		return this.designation;
	}

	public void setdesignation(String designation) {
		this.designation = designation;
	}

	public String getspecialization() {
		return this.specialization;
	}

	public void setspecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getteacherContact() {
		return this.teacherContact;
	}

	public void setteacherContact(String teacherContact) {
		this.teacherContact = teacherContact;
	}

	public String getteacherFirstName() {
		return this.teacherFirstName;
	}

	public void setteacherFirstName(String teacherFirstName) {
		this.teacherFirstName = teacherFirstName;
	}

	public String getteacherLastName() {
		return this.teacherLastName;
	}

	public void setteacherLastName(String teacherLastName) {
		this.teacherLastName = teacherLastName;
	}

}