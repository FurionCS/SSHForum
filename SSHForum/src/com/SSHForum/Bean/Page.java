package com.SSHForum.Bean;

public class Page {
	private int ID;
	private int pageSize=5;
	private int pageIndex=1;
	private String strWhere="1=1";
	private String orderby="";
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public String getStrWhere() {
		return strWhere;
	}
	public void setStrWhere(String strWhere) {
		this.strWhere = strWhere;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	

}
