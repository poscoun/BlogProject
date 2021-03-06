package com.gbolg.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dao.CategoryDAO;
import com.gblog.dto.CategoryDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CategoryDAOTest {
	
	@Inject
	private CategoryDAO cdao;
	
	private static Logger logger = LoggerFactory.getLogger(CategoryDAOTest.class);
	
	// 카테고리 작성
//	@Test
//	public void createTest() throws Exception {
//		CategoryDTO cdto = new CategoryDTO();
//		cdto.setCategory_name("테스트");
//		cdao.Create(cdto);
//	}
	
	// 카테고리 삭제
//	@Test
//	public void deleteTest() throws Exception {
//		cdao.Delete(16);
//	}
	
	// 카테고리 목록
//	@Test
//	public void categorylistTest() throws Exception {
//		logger.info(cdao.CategoryList(null).toString());
//	}
//
	
	// 카테고리 수정
//	@Test
//	public void ModifyTest() throws Exception {
//		CategoryDTO cdto = new CategoryDTO();
//		cdto.setCategory_id(84);
//		cdto.setCategory_name("수정테스트");
//		cdao.Modify(cdto);
//	}
	
	// 카테고리 정보
	@Test
	public void readTest() throws Exception{
		logger.info(cdao.Read(4).toString());
	}
}
