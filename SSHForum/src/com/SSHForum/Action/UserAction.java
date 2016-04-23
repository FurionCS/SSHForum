package com.SSHForum.Action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.SSHForum.Bean.User;
import com.SSHForum.Service.UserService;
import com.opensymphony.xwork2.ActionContext;

public class UserAction {
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private User user;
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	private Map session=ActionContext.getContext().getSession();
	
	public String Logout(){
		session.clear();
		return "input";
	}
	/**
	 * 登入action
	 * @return
	 * @throws SQLException
	 */
	public String Login() throws SQLException{
		if(user.getUName()!=null&&user.getUPassword()!=null){
			ArrayList<User> alu=userService.checkLogin(user);
			if(alu.size()>0){
				session.put("userinfo", alu.get(0));	
				return "index";
			}
			else{return "input";}		
		}
		else return "input";	
	}
}
