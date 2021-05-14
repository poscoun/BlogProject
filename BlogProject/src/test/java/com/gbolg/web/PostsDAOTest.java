package com.gbolg.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dao.PostsDAO;
import com.gblog.dto.PostsDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PostsDAOTest {

	@Inject
	private PostsDAO pdao;
	
	private static Logger logger = LoggerFactory.getLogger(PostsDAOTest.class);
	
	@Test
	public void insertTest() throws Exception {
		PostsDTO pdto = new PostsDTO();
		pdto.setPost_subj("testSubj");
		pdto.setPost_content("testCont");
		pdto.setUser_id("testId");
		pdao.insertPost(pdto);
	}
	
}
