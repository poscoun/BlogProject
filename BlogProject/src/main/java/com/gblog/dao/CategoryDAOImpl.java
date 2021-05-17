package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.CategoryDTO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	private static final String NAMESPACE = "com.gblog.category.categoryMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	// 카테고리 생성
	@Override
	public void Create(CategoryDTO cdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insert", cdto);
		
	}
	
	// 카테고리 삭제
	@Override
	public void Delete(int category_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".delete", category_id);
		
	}
	
	// 카테고리 목록
	@Override
	public List<CategoryDTO> CategoryList(String sid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".CategoryList", sid);
	}


}
