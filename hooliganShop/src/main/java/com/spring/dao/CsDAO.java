package com.spring.dao;

import java.util.List;

import com.spring.vo.CsVO;
import com.spring.vo.PageCriteria;

public interface CsDAO {

	public void insert(CsVO cvo) throws Exception;
	
	public CsVO read(int csNo) throws Exception;
	
	public void update(CsVO cvo) throws Exception;
	
	public void delete(int csNo) throws Exception;
	
	public List<CsVO> list() throws Exception;
	
	public List<CsVO> listCriteria(PageCriteria pageCri) throws Exception;
	
	public int countData(PageCriteria pageCri) throws Exception;
	
	public void updateReplyCnt(int csNO, int amount) throws Exception;
	

}
