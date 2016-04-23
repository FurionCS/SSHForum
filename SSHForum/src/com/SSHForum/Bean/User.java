package com.SSHForum.Bean;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	private int ID;
	private String UName;
	private String UPassword;
	private String UHeadUrl;
	private String Usex;
	private Date UStartTime;
	private Date ULastTime;
	private int UGrade;
	private String UPhone;
	private String UEmail;
	private String UAbout;
	
	private Plate pb;
	private Set<Reply> reply=new HashSet<Reply>();
	private Set<Theme> theme=new HashSet<Theme>();
	public User(){
		
	}
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUName() {
		return UName;
	}
	public void setUName(String uName) {
		UName = uName;
	}
	public String getUPassword() {
		return UPassword;
	}
	public void setUPassword(String uPassword) {
		UPassword = uPassword;
	}
	public String getUHeadUrl() {
		return UHeadUrl;
	}
	public void setUHeadUrl(String uHeadUrl) {
		UHeadUrl = uHeadUrl;
	}
	public String getUsex() {
		return Usex;
	}
	public void setUsex(String usex) {
		Usex = usex;
	}
	public Date getUStartTime() {
		return UStartTime;
	}
	public void setUStartTime(Date uStartTime) {
		UStartTime = uStartTime;
	}
	public Date getULastTime() {
		return ULastTime;
	}
	public void setULastTime(Date uLastTime) {
		ULastTime = uLastTime;
	}
	public int getUGrade() {
		return UGrade;
	}
	public void setUGrade(int uGrade) {
		UGrade = uGrade;
	}
	public String getUPhone() {
		return UPhone;
	}
	public void setUPhone(String uPhone) {
		UPhone = uPhone;
	}
	public String getUEmail() {
		return UEmail;
	}
	public void setUEmail(String uEmail) {
		UEmail = uEmail;
	}
	public String getUAbout() {
		return UAbout;
	}
	public void setUAbout(String uAbout) {
		UAbout = uAbout;
	}
	public Plate getPb() {
		return pb;
	}
	public void setPb(Plate pb) {
		this.pb = pb;
	}

	public Set<Reply> getReply() {
		return reply;
	}

	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}

	public Set<Theme> getTheme() {
		return theme;
	}

	public void setTheme(Set<Theme> theme) {
		this.theme = theme;
	}
	
	

	
	
	
}
