package com.SSHForum.Service;

import com.SSHForum.Bean.Reply;
import com.SSHForum.Dao.ReplyDao;

public class ReplyService {
	private ReplyDao replydao;
	public void setReplydao(ReplyDao replydao) {
		this.replydao = replydao;
	}
	public boolean AddReply(Reply rb){
		return replydao.AddReply(rb);
	}
}
