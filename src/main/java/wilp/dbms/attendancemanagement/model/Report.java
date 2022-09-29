package wilp.dbms.attendancemanagement.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

/**
 * The persistent class for the Report database table.
 * 
 */
@Entity(name = "Report")
@NamedQuery(name = "Report.findAll", query = "SELECT r FROM Report r")
public class Report implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "rpt_id")
	private int rptId;

	@Column(name = "rpt_name")
	private String rptName;

	@Column(name = "rpt_type")
	private String rptType;

	public Report() {
	}

	public int getRptId() {
		return this.rptId;
	}

	public void setRptId(int rptId) {
		this.rptId = rptId;
	}

	public String getRptName() {
		return this.rptName;
	}

	public void setRptName(String rptName) {
		this.rptName = rptName;
	}

	public String getRptType() {
		return this.rptType;
	}

	public void setRptType(String rptType) {
		this.rptType = rptType;
	}

}