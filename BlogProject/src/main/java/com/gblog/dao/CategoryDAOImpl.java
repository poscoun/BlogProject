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
		sqlSession.insert(NAMESPACE+".insertCategory", cdto);
		
	}
	
	// 카테고리 삭제
	@Override
	public void Delete(Integer category_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".deleteCategory", category_id);
		
	}
	
	// 카테고리 목록
	@Override
	public List<CategoryDTO> CategoryList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".CategoryList");
	}
	
	// 카테고리 수정
	@Override
	public void Update(CategoryDTO cdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".updateCategory", cdto);
	}
	
	// 카테고리 정보
	@Override
	public CategoryDTO Read(Integer category_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".readCategory", category_id);
	}
	


}
