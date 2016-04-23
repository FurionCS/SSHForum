package com.SSHForum.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;


import com.SSHForum.Bean.Theme;


public class ThemeDao extends BaseDao{
	ArrayList<Theme> altb=null;
	private int count;
	
	/**
	 * 
	 * 实现主题分页功能
	 * @param strWhere  - 筛选条件
	 * @param orderby	- 排序方式
	 * @param pageSize  - 每页行数
	 * @param pageIndex  - 当前页
	 * @return ArrayList     - 短消息对象链表
	 */
	public List<Theme> GetListByPage(String strWhere, String orderby, int pageSize, int pageIndex){	
	
		String hql="From Theme where "+strWhere+" order by "+orderby;
		Query query=getSession().createQuery(hql);
		//query.setCacheable(true);
		List<Theme> lt=query.setFirstResult((pageIndex - 1) * pageSize).setMaxResults(pageSize).list();
		for(Theme t:lt){
			Hibernate.initialize(t.getUser());
		}
		return lt;
	}
	/**
	 * 得到记录数
	 * @param strWhere  -筛选条件
	 * @return   ListCount
	 */
	public int GetRecordCount(String strWhere){
		
		String hql="from Theme where "+strWhere;
		Query query=getSession().createQuery(hql);
		//query.setCacheable(true);
		count=query.list().size();
		return count;
	}
	/**
	 * 添加主题
	 * @param tb
	 * @return
	 */
	public boolean AddTheme(Theme tb){
		
		try{
			getSession().save(tb);
		}catch(Exception e){
			
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	 /* 更新PlateBean 信息
	 * @param newstr
	 * @param whereStr
	 * @return count
	 */
	public int UpdatePlate(String newstr,String whereStr){
		return 0;
	}
	/**
	 * 获得主题和对应的回复信息
	 * @return
	 */
	public Theme getThemeWithReply(int id){
		Theme t=(Theme) getSession().get(Theme.class,id);
		Hibernate.initialize(t.getPlate());
		Hibernate.initialize(t.getUser());
		Hibernate.initialize(t.getReply());
		return t;
		
	}
}
