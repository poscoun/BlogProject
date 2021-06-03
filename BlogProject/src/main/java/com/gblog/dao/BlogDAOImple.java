package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.BlogDTO;

//@Repository
//public class BlogDAOImple implements BlogDAO{
//	
//	private static final String NAMESPACE = "com.gblog.dao.BlogDAO";
//	
//	@Inject
//	private SqlSession sqlSession;
//
//	@Override
//	public int selectOne(String user_id) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne(NAMESPACE+".blogselect", user_id);
//	}
//
//	@Override
//	public void insert(BlogDTO bdto) throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.insert(NAMESPACE+".bloginsert", bdto);
//	}
//
//	@Override
//	public List<BlogDTO> selectList() throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(NAMESPACE+".bloglist");
//	}
//
//}
