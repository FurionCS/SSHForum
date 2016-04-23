package com.SSHForum.Dao;

import com.SSHForum.Bean.Reply;



public class ReplyDao extends BaseDao{
	/**
	 * 添加Reply 
	 * @param rb
	 * @return true or false
	 */
	public boolean AddReply(Reply rb){
		try{
			getSession().save(rb);
			}catch(Exception E){
				return false;
			}
			return true;
	}
}
