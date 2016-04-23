package com.SSHForum.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.SSHForum.Bean.Page;
import com.SSHForum.Bean.Reply;
import com.SSHForum.Bean.Theme;
import com.SSHForum.Bean.User;
import com.SSHForum.Service.ThemeService;
import com.SSHForum.Util.JsonUtil;
import com.opensymphony.xwork2.ActionContext;

public class ThemeAction implements ServletResponseAware{
	private ThemeService themeService;
	public void setThemeService(ThemeService themeService) {
		this.themeService = themeService;
	}
	private Page page;
	private ServletResponse response;
	private List<Theme> ThemeList;
	private Map session=ActionContext.getContext().getSession();
	public Theme theme;
	public void setTheme(Theme theme) {
		this.theme = theme;
	}
	public Theme getTheme() {
		return theme;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}

	public List<Theme> getThemeList() {
		return ThemeList;
	}
	public void setThemeList(List<Theme> themeList) {
		ThemeList = themeList;
	}
	/**
	 * json过滤器
	 * 过滤hibernate 联级属性
	 * @return
	 */
	public JsonConfig getConfig(){
		JsonConfig config = new JsonConfig();
		config.setJsonPropertyFilter(new PropertyFilter() {
	        public boolean apply(Object arg0, String arg1, Object arg2) {
	             if (arg1.equals("user") ||arg1.equals("reply")||arg1.equals("plate")) {
	                    return true;
	                } else {
	                    return false;
	                }
	        }
	    });
		return config;
	}
	public String PublishTheme() throws IOException{
		theme.setUser((User) session.get("userinfo"));
		theme.setPublishTime(new Date());
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(themeService.AddTheme(theme)){
			jb.put("code", 1);
		}
		else{
			jb.put("code",0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
	}
	/**
	 * new 
	 */
	public void preparePublishTheme(){
		theme=new Theme();
	}
	/**
	 * 等到Theme通过分页
	 * @return
	 * @throws IOException
	 */
	public String ThemeListByPage() throws IOException{
		if(page.getOrderby().equals("")){
			page.setOrderby(" TID DESC");
		}
		ThemeList=themeService.GetListByPage(page.getStrWhere(), page.getOrderby(), page.getPageSize(), page.getPageIndex());
		int count=themeService.GetRecordCount(page.getStrWhere());
		response.setCharacterEncoding("utf-8");
		//JSONArray JThemeList=JSONArray.fromObject(ThemeList,getConfig());
		String JThemeList=JsonUtil.listToJson(ThemeList);
		JSONObject jb =new JSONObject();
		if(ThemeList.size()>0){
			 jb.put("code", 1);	
			 jb.put("count", count);
			 jb.put("altib",JThemeList );
		 }
		 else{
			 jb.put("code", 0);	
		 }
		System.out.println(JThemeList);
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;	
	}
	public String ThemeWithReply() throws IOException{
		Theme t=themeService.getThemeWithReply(page.getID());
		Set<Reply> sr=t.getReply();
    	response.setCharacterEncoding("utf-8");
		String jtr=JsonUtil.setTojson(sr);
		JSONObject jb =new JSONObject();
		if(sr.size()>0){
			jb.put("count", sr.size());
			jb.put("jtr", jtr);
		}
		else{
		   jb.put("count", 0);
		   jb.put("jt", JsonUtil.beanToJson(t));
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
		
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		response=arg0;
	}
}
