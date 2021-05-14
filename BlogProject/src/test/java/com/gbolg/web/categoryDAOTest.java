package com.gbolg.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dao.categoryDAO;
import com.gblog.dto.categoryDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class categoryDAOTest {
	
	@Inject
	private categoryDAO cdao;
	
	private static Logger logger = LoggerFactory.getLogger(categoryDAOTest.class);
	
	// 카테고리 작성
//	@Test
//	public void insertTest() throws Exception {
//		categoryDTO cdto = new categoryDTO();
//		cdto.setCategory_name("테스트");
//		cdao.insert(cdto);
//	}
	
	// 카테고리 삭제
//	@Test
//	public void deleteTest() throws Exception {
//		cdao.delete(1);
//	}
	
	// 카테고리 목록
	@Test
	public void categorylistTest() throws Exception {
		logger.info(cdao.categorylist(null).toString());
	}
	
}
