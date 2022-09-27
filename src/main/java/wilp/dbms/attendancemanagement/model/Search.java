package wilp.dbms.attendancemanagement.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

/**
 * The persistent class for the Search database table.
 * 
 */
@Entity
@NamedQuery(name = "Search.findAll", query = "SELECT s FROM Search s")
public class Search implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "search_id")
	private int searchId;

	@Column(name = "search_description")
	private String searchDescription;

	@Column(name = "search_typ")
	private String searchTyp;

	public Search() {
	}

	public int getSearchId() {
		return this.searchId;
	}

	public void setSearchId(int searchId) {
		this.searchId = searchId;
	}

	public String getSearchDescription() {
		return this.searchDescription;
	}

	public void setSearchDescription(String searchDescription) {
		this.searchDescription = searchDescription;
	}

	public String getSearchTyp() {
		return this.searchTyp;
	}

	public void setSearchTyp(String searchTyp) {
		this.searchTyp = searchTyp;
	}

}