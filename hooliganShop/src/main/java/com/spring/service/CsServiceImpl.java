package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.spring.dao.CsDAO;
import com.spring.vo.CsVO;
import com.spring.vo.PageCriteria;

@Repository
public class CsServiceImpl implements CsService {

	@Inject
	private CsDAO cdao;
	
	@Override
	public void insert(CsVO cvo) throws Exception {
		cdao.insert(cvo);
	}

	@Override
	public CsVO read(int csNo) throws Exception {
		return cdao.read(csNo);
	}

	@Override
	public void update(CsVO cvo) throws Exception {
		cdao.update(cvo);
	}

	@Override
	public void delete(int csNo) throws Exception {
		cdao.delete(csNo);
	}

	@Override
	public List<CsVO> list() throws Exception {
		return cdao.list();
	}


	@Override
	public List<CsVO> listCriteria(PageCriteria pageCri) throws Exception {
		return cdao.listCriteria(pageCri);
	}

	@Override
	public int countData(PageCriteria pageCri) throws Exception {
		return cdao.countData(pageCri);
	}
}
