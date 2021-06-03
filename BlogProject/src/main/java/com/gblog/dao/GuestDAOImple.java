package com.gblog.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.BlogDTO;
import com.gblog.dto.GuestDTO;

@Repository
public class GuestDAOImple implements GuestDAO{
	
	private static final String NAMESPACE = "com.gblog.dao.GuestDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public int visitTotal(Integer blog_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectTotal",blog_id);
	}

	@Override
	public int visitToday(Integer blog_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectToday", blog_id);
	}

	@Override
	public void insert(GuestDTO gdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insertDate", gdto);
		
	}

}
