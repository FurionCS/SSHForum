package com.SSHForum.Service;

import java.util.List;

import com.SSHForum.Bean.Plate;
import com.SSHForum.Dao.PlateDao;

public class PlateService {
	private PlateDao platedao;
	public void setPlatedao(PlateDao platedao) {
		this.platedao = platedao;
	}
	public List<Plate> getPlateByString(){
		System.out.println("daoservice");
		return platedao.getPlateByString();
	}
	public int UpdatePlate(String newstr,String whereStr){
		return platedao.UpdatePlate(newstr, whereStr);
	}
}
