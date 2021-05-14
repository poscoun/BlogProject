package com.gblog.dao;

import java.util.List;

import com.gblog.dto.categoryDTO;

public interface categoryDAO {
	public void insert(categoryDTO cdto) throws Exception; 	// 카테고리 생성
	
	public void delete(int category_id) throws Exception; 	// 카테고리 삭제
	
	public List<categoryDTO> categorylist(String sid) throws Exception;	 // 카테고리 목록 
	
	
}
