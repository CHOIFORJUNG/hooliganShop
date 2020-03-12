package com.spring.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {
	private Integer rebno;
	private Integer bno;
	private String replyContent;
	private String userId;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="MM-dd-HH:mm:ss")
	private Date regDate;
	private Date udateDate;
	public Integer getRebno() {
		return rebno;
	}
	public void setRebno(Integer rebno) {
		this.rebno = rebno;
	}
	public Integer getBno() {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getuserId() {
		return userId;
	}
	public void setuserId(String userId) {
		this.userId = userId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUdateDate() {
		return udateDate;
	}
	public void setUdateDate(Date udateDate) {
		this.udateDate = udateDate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rebno=" + rebno + ", bno=" + bno + ", replyContent=" + replyContent + ", userId=" + userId
				+ ", regDate=" + regDate + ", udateDate=" + udateDate + "]";
	}
	
	
}
	
