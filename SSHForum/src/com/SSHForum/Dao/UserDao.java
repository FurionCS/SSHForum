package com.SSHForum.Dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.hibernate.Query;

import com.SSHForum.Bean.User;



public class UserDao extends BaseDao{
	ArrayList<User> List;	
	int ListCount=0;	
	boolean flag=false;
	
	
	/**
	 * 
	 * 实现用户分页功能
	 * @param strWhere  - 筛选条件
	 * @param orderby	- 排序方式
	 * @param pageSize  - 每页行数
	 * @param pageIndex  - 当前页
	 * @return ArrayList AdminBean    - 管理员对象链表
	 * 
	 */
	
	public ArrayList<User> GetListByPage(String strWhere, String orderby, int pageSize, int pageIndex){	
		
		return null;   
	}

	/**
	 * 更新用户
	 * @param id
	 * @return ListCount  -更新记录数
	 */
	
	public int UpdataUser(String str,int id){
		return 0;
		
	}

	/**
	 * 用于检查用户登入
	 * @param Loginer
	 * @return  ArrayList  登入者列表
	 * @throws SQLException 
	 */
	public ArrayList<User> checkLogin(User Loginer) throws SQLException{
		  
		Query query=getSession().createQuery("from User where UName=:name and UPassword=:pass");
		ArrayList<User> lu=(ArrayList<User>) query.setString("name", Loginer.getUName()).setString("pass", Loginer.getUPassword()).list();	
		
		return lu;	 
	}


	/**
	 * 更新LoginBean 信息
	 * @param newstr
	 * @param whereStr
	 * @return count
	 */
	public int UpdateLogin(String newstr,String whereStr){
		return 0;
		
	}


	/**
	 * 用于注册用户添加
	 * @param loginer
	 * @return
	 */
	public boolean AddUser(User usd){
		try{
			getSession().save(usd);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return flag;
		
	}

	
	
	/**
	 * 更新userBean 信息
	 * @param newstr
	 * @param whereStr
	 * @return count
	 */
	public int UpdateInfo(User ub){
		
		return 0;
	}
}
