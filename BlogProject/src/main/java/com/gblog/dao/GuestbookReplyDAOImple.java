package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.GuestbookReplyDTO;

@Repository
public class GuestbookReplyDAOImple implements GusetbookReplyDAO{
	
	private static final String NAMESPACE = "com.gblog.dao.GuestbookReplyDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert(GuestbookReplyDTO gdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insert", gdto);
	}

	@Override
	public List<GuestbookReplyDTO> listreply(Integer guest_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".list", guest_id);
	}

}
