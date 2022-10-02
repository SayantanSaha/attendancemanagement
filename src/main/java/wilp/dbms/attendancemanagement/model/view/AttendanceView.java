package wilp.dbms.attendancemanagement.model.view;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

//NOTE: Hibernate-specific Annotations below
import org.hibernate.annotations.Immutable;
import org.hibernate.annotations.Subselect;

@Entity
@Table(name = "v_attendance")

// We are concatenating Date & AttendanceType to
// generate an ID String on the fly so that we
// can use it to query the data using that
// generated ID
@Subselect("select concat(va.Date, va.AttendanceType) as id, va.* from v_attendance va")
@Immutable
public class AttendanceView implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	String id;

	@Column(name = "Date")
	private Timestamp date;

	@Column(name = "AttendanceType")
	private String attendanceType;

	@Column(name = "PresentCount")
	private int presentCount;

	@Column(name = "AbsenseCount")
	private int absenseCount;

	@Column(name = "FieldCount")
	private int fieldCount;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getAttendanceType() {
		return attendanceType;
	}

	public void setAttendanceType(String attendanceType) {
		this.attendanceType = attendanceType;
	}

	public int getPresentCount() {
		return presentCount;
	}

	public void setPresentCount(int presentCount) {
		this.presentCount = presentCount;
	}

	public int getAbsenseCount() {
		return absenseCount;
	}

	public void setAbsenseCount(int absenseCount) {
		this.absenseCount = absenseCount;
	}

	public int getFieldCount() {
		return fieldCount;
	}

	public void setFieldCount(int fieldCount) {
		this.fieldCount = fieldCount;
	}

}
