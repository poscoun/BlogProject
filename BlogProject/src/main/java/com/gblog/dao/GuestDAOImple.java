package com.gblog.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDAOImple implements GuestDAO{
	
	private static final String NAMESPACE = "com.gblog.dao.GuestDAO";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insert() throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insertDate");
		
	}

	@Override
	public int visitTotal() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectTotal");
	}

	@Override
	public int visitToday() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectToday");
	}

}
