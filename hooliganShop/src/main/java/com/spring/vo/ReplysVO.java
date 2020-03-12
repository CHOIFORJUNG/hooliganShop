package com.spring.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplysVO {

	private Integer rebnum;
	private Integer productNo;
	private String reContent;
	private String userId;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="MM-dd-HH:mm:ss")
	private Date regdate;
	private Date udatedate;
	public Integer getRebnum() {
		return rebnum;
	}
	public void setRebnum(Integer rebnum) {
		this.rebnum = rebnum;
	}
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUdatedate() {
		return udatedate;
	}
	public void setUdatedate(Date udatedate) {
		this.udatedate = udatedate;
	}
	@Override
	public String toString() {
		return "ReplysVO [rebnum=" + rebnum + ", productNo=" + productNo + ", reContent=" + reContent + ", userId="
				+ userId + ", regdate=" + regdate + ", udatedate=" + udatedate + "]";
	}
	
	
}
