package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.GuestbookDTO;

@Repository
public class GuestbookDAOImple implements GuestbookDAO{
	
	private static final String NAMESPACE = "com.gblog.dao.GuestbookDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert(GuestbookDTO gdto) throws Exception {
		sqlSession.insert(NAMESPACE+".insert", gdto);
	}

	@Override
	public List<GuestbookDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".list");
	}

	@Override
	public void update(GuestbookDTO gdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".update", gdto);
		
	}

	@Override
	public void delete(Integer guest_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".delete", guest_id);
		
	}

	@Override
	public GuestbookDTO read(Integer guest_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".read", guest_id);
	}
	
}
