package wilp.dbms.attendancemanagement.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

/**
 * The persistent class for the Message database table.
 * 
 */
@Entity(name = "Message")
@NamedQuery(name = "Message.findAll", query = "SELECT m FROM Message m")
public class Message implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "msg_id")
	private int msgId;

	private String bcc;

	private String cc;

	@Column(name = "msg_text")
	private String msgText;

	@Column(name = "time_stamp")
	private Timestamp timeStamp;

	private String to;

	public Message() {
	}

	public int getMsgId() {
		return this.msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public String getBcc() {
		return this.bcc;
	}

	public void setBcc(String bcc) {
		this.bcc = bcc;
	}

	public String getCc() {
		return this.cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getMsgText() {
		return this.msgText;
	}

	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}

	public Timestamp getTimeStamp() {
		return this.timeStamp;
	}

	public void setTimeStamp(Timestamp timeStamp) {
		this.timeStamp = timeStamp;
	}

	public String getTo() {
		return this.to;
	}

	public void setTo(String to) {
		this.to = to;
	}

}