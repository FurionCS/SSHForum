package com.SSHForum.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.SSHForum.Bean.Reply;
import com.SSHForum.Bean.User;
import com.SSHForum.Service.ReplyService;
import com.opensymphony.xwork2.ActionContext;

public class ReplyAction implements ServletResponseAware{
	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	private  Reply reply;
	private  Map session=ActionContext.getContext().getSession();
	private  ServletResponse response;
	public Reply getReply(){
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	public String AddReply() throws IOException{
		reply.setUser((User)session.get("userinfo"));
		reply.setRPublishTime(new Date());
		response.setCharacterEncoding("utf-8");
		JSONObject jb =new JSONObject();
		if(replyService.AddReply(reply)){
			jb.put("code",1);
		}else{
			jb.put("code", 0);
		}
		PrintWriter out=response.getWriter();
		out.print(jb);
		return null;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		response=arg0;
	}
}
