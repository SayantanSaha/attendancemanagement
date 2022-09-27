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
 * The persistent class for the Student database table.
 * 
 */
@Entity
@NamedQuery(name = "Student.findAll", query = "SELECT s FROM Student s")
public class Student implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "stu_id")
	private int stuId;

	@Column(name = "admission_date")
	private Timestamp admissionDate;

	@Column(name = "date_of_birth")
	private Timestamp dateOfBirth;

	@Column(name = "ed_level")
	private String edLevel;

	private String gender;

	private String grade;

	private String nationality;

	private String section;

	private String semester;

	@Column(name = "stu_contact")
	private String stuContact;

	@Column(name = "stu_first_name")
	private String stuFirstName;

	@Column(name = "stu_last_name")
	private String stuLastName;

	// bi-directional many-to-one association to Attendance
	@OneToMany(mappedBy = "student")
	private List<Attendance> attendances;

	public Student() {
	}

	public int getStuId() {
		return this.stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public Timestamp getAdmissionDate() {
		return this.admissionDate;
	}

	public void setAdmissionDate(Timestamp admissionDate) {
		this.admissionDate = admissionDate;
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

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getNationality() {
		return this.nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getSection() {
		return this.section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSemester() {
		return this.semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getStuContact() {
		return this.stuContact;
	}

	public void setStuContact(String stuContact) {
		this.stuContact = stuContact;
	}

	public String getStuFirstName() {
		return this.stuFirstName;
	}

	public void setStuFirstName(String stuFirstName) {
		this.stuFirstName = stuFirstName;
	}

	public String getStuLastName() {
		return this.stuLastName;
	}

	public void setStuLastName(String stuLastName) {
		this.stuLastName = stuLastName;
	}

	public List<Attendance> getAttendances() {
		return this.attendances;
	}

	public void setAttendances(List<Attendance> attendances) {
		this.attendances = attendances;
	}

	public Attendance addAttendance(Attendance attendance) {
		getAttendances().add(attendance);
		attendance.setStudent(this);

		return attendance;
	}

	public Attendance removeAttendance(Attendance attendance) {
		getAttendances().remove(attendance);
		attendance.setStudent(null);

		return attendance;
	}

}