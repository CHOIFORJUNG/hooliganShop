package com.spring.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingMaker {
	private int totalData; //전체데이터갯수
	private int startPage; //페이지목록의 시작번호
	private int endPage; //페이지목록의 끝번호
	private boolean prev; //이전버튼을 나타내는 부울 값
	private boolean next; //다음버튼을 나타내는 부울 값

	private int displayPageNum = 10; // 페이지목록에 페이지번호의 갯수
	
	private PageCriteria cri; //이런 클래스를 반환타입으로 하는 경우 반환타입은 이 클래스가 가진 속성들로 해줘야한다.
			//참조타입이란 값이 직접들어가있지 않고 그 데이터를 가리키고 있는 주소값을 가지고있다.
	public void setCri(PageCriteria cri){ //.set~~ = 너 이걸로 세팅하라고 명령하는거다.
		this.cri = cri;					//PageCriteria클래스의 변수인 page 또는 numperpage로 받는거 
	}
	
	public void setTotalData(int totalData){
		this.totalData = totalData;
		
		getPagingData();
	}
	
	
	private void getPagingData(){
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int finalEndPage = (int)(Math.ceil(totalData/(double)cri.getNumPerPage()));
		
		if(endPage > finalEndPage){
			endPage = finalEndPage;
		}
		
		prev = startPage == 1? false: true;
		
		next = endPage*cri.getNumPerPage() >= totalData ? false : true;
		
	}
	
	public String makeURI(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()//uri를 바로 지정해주는거얌
				.queryParam("page", page) 		//bbs/pageList?page='~'&numPerPage='~' 이런식으로 들어감
				.queryParam("numPerPage", cri.getNumPerPage())
				.build();
		return uriComponents.toUriString();
	}

	public String makeFind(int page){
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("numPerPage", cri.getNumPerPage())
				.queryParam("findType", ((FindCriteria)cri).getFindType())
				.queryParam("keyword", ((FindCriteria)cri).getKeyword())
				.build();
		
		return uriComponents.toUriString();
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalData() {
		return totalData;
	}

	public PageCriteria getCri() {
		return cri;
	}
	
}
