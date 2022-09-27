package wilp.dbms.attendancemanagement.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;


/**
 * The persistent class for the Attendance database table.
 * 
 */
@Entity
@NamedQuery(name="Attendance.findAll", query="SELECT a FROM Attendance a")
public class Attendance implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="att_id")
	private int attId;

	@Column(name="att_time_stamp")
	private Timestamp attTimeStamp;

	//bi-directional many-to-one association to AttendanceType
	@ManyToOne
	@JoinColumn(name="att_type_id")
	private AttendanceType attendanceType;

	//bi-directional many-to-one association to Student
	@ManyToOne
	@JoinColumn(name="att_stud_id")
	private Student student;

	public Attendance() {
	}

	public int getAttId() {
		return this.attId;
	}

	public void setAttId(int attId) {
		this.attId = attId;
	}

	public Timestamp getAttTimeStamp() {
		return this.attTimeStamp;
	}

	public void setAttTimeStamp(Timestamp attTimeStamp) {
		this.attTimeStamp = attTimeStamp;
	}

	public AttendanceType getAttendanceType() {
		return this.attendanceType;
	}

	public void setAttendanceType(AttendanceType attendanceType) {
		this.attendanceType = attendanceType;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}