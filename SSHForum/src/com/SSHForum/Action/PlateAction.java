package com.SSHForum.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.SSHForum.Bean.Page;
import com.SSHForum.Bean.Plate;
import com.SSHForum.Service.PlateService;
import com.SSHForum.Util.JsonUtil;
import com.opensymphony.xwork2.ActionContext;

public class PlateAction implements ServletResponseAware{
	private PlateService plateService;
	public void setPlateService(PlateService plateService) {
		this.plateService = plateService;
	}
	private Page page;
	public void setPage(Page page) {
		this.page = page;
	}
	public Page getPage() {
		return page;
	}
	private Plate plate;
	public void setPlate(Plate plate) {
		this.plate = plate;
	}
	public Plate getPlate() {
		return plate;
	}
	private Map session=ActionContext.getContext().getSession();
	/**
	 * 
	 * @return Json
	 * @throws IOException
	 */
	public String showPlist() throws IOException{
		List<Plate> lp=plateService.getPlateByString();
//		session.put("lp", lp);
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(lp.size()>0){
			jb.put("code", 1);
			System.out.println(lp);
			String JThemeList=JsonUtil.listToJson(lp);
		//	System.out.println("................"+JThemeList);
			jb.put("alpb",JThemeList);
		}
		else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
	}
	private ServletResponse response;
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		response=arg0;
	}
	
	
	
	
}
