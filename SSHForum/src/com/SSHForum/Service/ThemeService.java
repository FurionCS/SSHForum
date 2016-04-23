package com.SSHForum.Service;

import java.util.List;

import com.SSHForum.Bean.Theme;
import com.SSHForum.Dao.ThemeDao;

public class ThemeService {
	private ThemeDao themedao;
	public void setThemedao(ThemeDao themedao) {
		this.themedao = themedao;
	}
	public List<Theme> GetListByPage(String strWhere, String orderby, int pageSize, int pageIndex){	
		return themedao.GetListByPage(strWhere, orderby, pageSize, pageIndex);
	}
	public int GetRecordCount(String strWhere){
		return themedao.GetRecordCount(strWhere);
	}
	public boolean AddTheme(Theme tb){
		return themedao.AddTheme(tb);
	}
	public Theme getThemeWithReply(int id){
		return themedao.getThemeWithReply(id);
	}
}
