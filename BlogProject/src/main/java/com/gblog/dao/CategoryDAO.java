package com.gblog.dao;

import java.util.List;

import com.gblog.dto.CategoryDTO;

public interface CategoryDAO {
	public void Create(CategoryDTO cdto) throws Exception; 	// 카테고리 생성
	
	public void Delete(Integer category_id) throws Exception; 	// 카테고리 삭제
	
	public List<CategoryDTO> CategoryList(String sid) throws Exception;	 // 카테고리 목록 
	
	
}
