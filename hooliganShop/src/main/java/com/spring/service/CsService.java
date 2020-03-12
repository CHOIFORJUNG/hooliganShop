package com.spring.service;

import java.util.List;

import com.spring.vo.CsVO;
import com.spring.vo.PageCriteria;

public interface CsService {

	public void insert(CsVO cvo) throws Exception;
	
	public CsVO read(int csNo) throws Exception;
	
	public void update(CsVO cvo) throws Exception;
	
	public void delete(int csNo) throws Exception;
	
	public List<CsVO> list() throws Exception;
	
	public List<CsVO> listCriteria(PageCriteria pageCri) throws Exception;

	public int countData(PageCriteria pageCri) throws Exception;

}
