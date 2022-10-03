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
@Table(name = "v_monthly_attendance")

// We are concatenating Date & AttendanceType to
// generate an ID String on the fly so that we
// can use it to query the data using that
// generated ID
@Subselect("select va.MonthYear as id, va.* from v_monthly_attendance va")
@Immutable
public class MonthlyAttendanceView implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	String id;

	@Column(name = "MonthYear")
	private String monthYear;

	@Column(name = "AttendanceType")
	private String attendanceType;

	@Column(name = "Count")
	private int count;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDate() {
		return monthYear;
	}

	public void setDate(String monthYear) {
		this.monthYear = monthYear;
	}

	public String getAttendanceType() {
		return attendanceType;
	}

	public void setAttendanceType(String attendanceType) {
		this.attendanceType = attendanceType;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
