package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.categoryDTO;

@Repository
public class categoryDAOImpl implements categoryDAO {
	
	private static final String NAMESPACE = "com.gblog.category.categoryMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	// 카테고리 생성
	@Override
	public void insert(categoryDTO cdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insert", cdto);
		
	}
	
	// 카테고리 삭제
	@Override
	public void delete(int category_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".delete", category_id);
		
	}
	
	// 카테고리 목록
	@Override
	public List<categoryDTO> categorylist(String sid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".categorylist", sid);
	}


}
