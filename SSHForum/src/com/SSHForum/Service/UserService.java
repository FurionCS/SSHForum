package com.SSHForum.Service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.SSHForum.Bean.User;
import com.SSHForum.Dao.UserDao;

public class UserService {
	private UserDao userdao;
	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}
	public ArrayList<User> checkLogin(User Loginer) throws SQLException{
		return userdao.checkLogin(Loginer);
	}
	public boolean AddUser(User usd){
		return userdao.AddUser(usd);
	}
}
