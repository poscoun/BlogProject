package com.gbolg.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dao.PostDAO;
import com.gblog.dto.PostDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PostDAOTest {

	@Inject
	private PostDAO pdao;
	
	private static Logger logger = LoggerFactory.getLogger(PostDAOTest.class);
	
	@Test
	public void insertTest() throws Exception {
		PostDTO pdto = new PostDTO();
		pdto.setPost_subj("testSubj");
		pdto.setPost_content("testCont4");
		pdto.setUser_id("testId");
		pdao.insertPost(pdto);
	}
	
//	@Test
//	public void readTest() throws Exception{
//		logger.info(pdao.read(1).toString());
//	}

	
}
