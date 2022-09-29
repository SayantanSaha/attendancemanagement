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
import javax.persistence.Table;

/**
 * The persistent class for the AttendanceType database table.
 * 
 */
@Entity(name = "AttendanceType")
@Table(name = "AttendanceType")
@NamedQuery(name = "AttendanceType.findAll", query = "SELECT a FROM AttendanceType a")
public class AttendanceType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "att_type_id")
	private int attTypeId;

	@Column(name = "att_type_name")
	private String attTypeName;

	// bi-directional many-to-one association to Attendance
	@OneToMany(mappedBy = "attendanceType")
	private List<Attendance> attendances;

	public AttendanceType() {
	}

	public int getAttTypeId() {
		return this.attTypeId;
	}

	public void setAttTypeId(int attTypeId) {
		this.attTypeId = attTypeId;
	}

	public String getAttTypeName() {
		return this.attTypeName;
	}

	public void setAttTypeName(String attTypeName) {
		this.attTypeName = attTypeName;
	}

	public List<Attendance> getAttendances() {
		return this.attendances;
	}

	public void setAttendances(List<Attendance> attendances) {
		this.attendances = attendances;
	}

	public Attendance addAttendance(Attendance attendance) {
		getAttendances().add(attendance);
		attendance.setAttendanceType(this);

		return attendance;
	}

	public Attendance removeAttendance(Attendance attendance) {
		getAttendances().remove(attendance);
		attendance.setAttendanceType(null);

		return attendance;
	}

}