package com.spring.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CsReplyVO {

	private int csReplyNo;
	private String userId;
	private int csNo;
	private String csContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date regDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date modDate;
	public int getCsReplyNo() {
		return csReplyNo;
	}
	public void setCsReplyNo(int csReplyNo) {
		this.csReplyNo = csReplyNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	@Override
	public String toString() {
		return "CsReplyVO [csReplyNo=" + csReplyNo + ", userId=" + userId + ", csNo=" + csNo + ", csContent="
				+ csContent + ", regDate=" + regDate + ", modDate=" + modDate + "]";
	}
	
	
}