package com.spring.vo;

public class PageCriteria {
	
	private int page; // 해당 현재 페이지번호
	private int numPerPage; // 한 페이지당 출력되는 게시글 갯수
	
	public PageCriteria() {
		this.page = 1;  // 디폴트      (page - 1) * 10;
		this.numPerPage = 10; // 디폴트로  10개씩    
	}
	//this. > 현재 속해있는 자신 클래스의 변수에 값을 넣어준다.
	//생성자는 클래스가 가지는 속성들의 값을 초기화해주기 위해 존재함 ()안에 아무것도 없으면 아무것도아님.
	/*
	 * PageCriteria p = new PageCriteria(); //<-- 객체 생성 및 생성자 호출
	 * sysout.println(p.getPage()); // 1 p.setPage();
	 */
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return; //아무것도 없는 return은 이 메소드에서 실행후 그냥 끝난다
		}
		
		this.page = page;
	}
	
	public void setNumPerPage(int numPerPage) {
		if(numPerPage <= 0 || numPerPage > 100) { 
			this.numPerPage = 10; // 10개만 보여주도록
			return;
		}
		
		this.numPerPage = numPerPage;
	}
	
	public int getPage() {
		return page; //page;는 this.page의 값을 의미한다.
	}
	
	public int getNumPerPage() {
		return this.numPerPage;//마찬가지
	}
	
	// 추가 메소드
	public int getStartPage() {  // limit {startPage}{numPerPage}에서 startPage를 구하는 것
		return(this.page-1)*numPerPage;
	}

	@Override
	public String toString() {
		return "PageCriteria [page=" + page + ", numPerPage=" + numPerPage + "]";
	}
	
}
