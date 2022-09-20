package wilp.dbms.attendancemanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Attendance")

public class Attendance {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int att_id;

	@Column(name = "att_stud_id")
	private int att_stud_id;

	@Column(name = "att_type_id")
	private int att_type_id;

	@Column(name = "att_time_stamp")
	private String att_time_stamp;

	public int getAtt_id() {
		return att_id;
	}

	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}

	public int getAtt_stud_id() {
		return att_stud_id;
	}

	public void setAtt_stud_id(int att_stud_id) {
		this.att_stud_id = att_stud_id;
	}

	public int getAtt_type_id() {
		return att_type_id;
	}

	public void setAtt_type_id(int att_type_id) {
		this.att_type_id = att_type_id;
	}

	public String getAtt_time_stamp() {
		return att_time_stamp;
	}

	public void setAtt_time_stamp(String att_time_stamp) {
		this.att_time_stamp = att_time_stamp;
	}
}
