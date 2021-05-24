package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.CategoryDAO;
import com.gblog.dto.CategoryDTO;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Inject
	private CategoryDAO cdao;
	
	// 카테고리 생성
	@Override
	public void Create(CategoryDTO cdto) throws Exception {
		// TODO Auto-generated method stub
		cdao.Create(cdto);
	}
	
	// 카테고리 목록
	@Override
	public List<CategoryDTO> CategoryList(String sid) throws Exception {
		// TODO Auto-generated method stub
		return cdao.CategoryList(sid);
	}
	
	// 카테고리 삭제
	@Override
	public void Delete(Integer category_id) throws Exception {
		// TODO Auto-generated method stub
		cdao.Delete(category_id);
	}
	

}
