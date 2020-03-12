package com.spring.vo;

import java.util.Date;

public class BoardVO {

	private Integer bno;
	private String userId;
	private String title;
	private String content;
	private Integer hit;
	private Integer replyCnt;
	/*
	 * private String image; private String thumbImg;
	 */
	private String boardImg;
	private String boardThumbImg;
	private Date regDate;
	private Date modDate;
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getHit() {
		return hit;
	}
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	public Integer getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(Integer replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	public String getBoardImg() {
		return boardImg;
	}
	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}
	public String getBoardThumbImg() {
		return boardThumbImg;
	}
	public void setBoardThumbImg(String boardThumbImg) {
		this.boardThumbImg = boardThumbImg;
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
		return "BoardVO [bno=" + bno + ", userId=" + userId + ", title=" + title + ", content=" + content + ", hit="
				+ hit + ", replyCnt=" + replyCnt + ", boardImg=" + boardImg + ", boardThumbImg=" + boardThumbImg
				+ ", regDate=" + regDate + ", modDate=" + modDate + "]";
	}
	
}