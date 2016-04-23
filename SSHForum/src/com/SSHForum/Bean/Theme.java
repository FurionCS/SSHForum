package com.SSHForum.Bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Theme {
	private int TID;
	private Plate plate;
	private User user;
	private String Title;
	private String Content;
	private int ReplyCount;
	private int ClickCount;
	private Date PublishTime;
	private Date ModifyTime;
	private int TType;
	private Set<Reply> reply=new HashSet<Reply>();
	public int getTID() {
		return TID;
	}
	public void setTID(int TiD) {
		TID = TiD;
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
	public Set<Reply> getReply() {
		return reply;
	}
	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getReplyCount() {
		return ReplyCount;
	}
	public void setReplyCount(int replyCount) {
		ReplyCount = replyCount;
	}
	public int getClickCount() {
		return ClickCount;
	}
	public void setClickCount(int clickCount) {
		ClickCount = clickCount;
	}
	public Date getPublishTime() {
		return PublishTime;
	}
	public void setPublishTime(Date publishTime) {
		PublishTime = publishTime;
	}
	public Date getModifyTime() {
		return ModifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		ModifyTime = modifyTime;
	}
	public int getTType() {
		return TType;
	}
	public void setTType(int tType) {
		TType = tType;
	}
	
}
