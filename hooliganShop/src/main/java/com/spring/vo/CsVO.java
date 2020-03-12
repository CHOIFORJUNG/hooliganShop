package com.spring.vo;

import java.util.Date;

public class CsVO {

//	csNo int(11) not null auto_increment primary key,
//	userId varchar(50) not null,
//	csTitle varchar(50) not null,
//	csContent varchar(50) not null,
//	hit int(11) not null,
//	csReplycnt int(11) not null,
//	csPw varchar(50), 
//	regDate timestamp default now(),
//	modDate timestamp not null
	
	private int csNo;
	private String userId;
	private String csTitle;
	private String csContent;
	private int hit;
	private int csReplycnt;
	private String csPw;
	private Date regDate;
	private Date modDate;
	private String csThumbImg;
	
	
	public String getCsThumbImg() {
		return csThumbImg;
	}
	public void setCsThumbImg(String csThumbImg) {
		this.csThumbImg = csThumbImg;
	}
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCsTitle() {
		return csTitle;
	}
	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getCsReplycnt() {
		return csReplycnt;
	}
	public void setCsReplycnt(int csReplycnt) {
		this.csReplycnt = csReplycnt;
	}
	public String getCsPw() {
		return csPw;
	}
	public void setCsPw(String csPw) {
		this.csPw = csPw;
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
		return "CsVO [csNo=" + csNo + ", userId=" + userId + ", csTitle=" + csTitle + ", csContent=" + csContent
				+ ", hit=" + hit + ", csReplycnt=" + csReplycnt + ", csPw=" + csPw + ", regDate=" + regDate
				+ ", modDate=" + modDate + ", csThumbImg=" + csThumbImg + "]";
	}
}
