package com.SSHForum.Dao;

import java.util.List;

import org.hibernate.Query;
import com.SSHForum.Bean.Plate;



public class PlateDao extends BaseDao {
	/**
	 * 获得板块列表
	 * @param str
	 * @param OrderStr
	 * @return
	 */
	public List<Plate> getPlateByString(){
		Query query=getSession().createQuery("from Plate where plates==null");
	//	query.setCacheable(true);
		List<Plate> platelist=query.list();
		System.out.println("////////////////"+platelist.get(0).toString());
		return platelist;
		}
	/**
	 * 更新PlateBean 信息
	 * @param newstr
	 * @param whereStr
	 * @return count
	 */
	public int UpdatePlate(String newstr,String whereStr){
			return 0;
	}
}
