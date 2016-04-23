package com.SSHForum.Bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;


public class Reply {
	private int RID;
	private Theme theme;
	private Plate plate;
	private User user;
	private String RTheme;
	private String RContent;
	private Date RPublishTime;
	private Date RModifyTime;
	private int Ticket;
	public Reply(){}
	

	public int getRID() {
		return RID;
	}
	public void setRID(int RiD) {
		RID = RiD;
	}
	public Theme getTheme() {
		return theme;
	}
	public void setTheme(Theme theme) {
		this.theme = theme;
	}
	public Plate getPlate() {
		return plate;
	}
	public void setPlate(Plate plate) {
		this.plate = plate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getRTheme() {
		return RTheme;
	}
	public void setRTheme(String rTheme) {
		RTheme = rTheme;
	}
	public String getRContent() {
		return RContent;
	}
	public void setRContent(String rContent) {
		RContent = rContent;
	}
	public Date getRPublishTime() {
		return RPublishTime;
	}
	public void setRPublishTime(Date rPublishTime) {
		RPublishTime = rPublishTime;
	}
	public Date getRModifyTime() {
		return RModifyTime;
	}
	public void setRModifyTime(Date rModifyTime) {
		RModifyTime = rModifyTime;
	}
	public int getTicket() {
		return Ticket;
	}
	public void setTicket(int ticket) {
		Ticket = ticket;
	}
}
