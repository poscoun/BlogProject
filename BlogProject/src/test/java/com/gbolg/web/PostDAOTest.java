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
import com.gblog.dto.ReplyDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PostDAOTest {

	@Inject
	private PostDAO pdao;
	
	private static Logger logger = LoggerFactory.getLogger(PostDAOTest.class);
	
	@Test
	public void insertTest() throws Exception {
		PostDTO pdto = new PostDTO();
		pdto.setCategory_id(7);
		pdto.setPost_subj("강남");
		pdto.setPost_content("1 요리 444 yori");
		
//		for(int i=0; i<150; i++) {
//			pdto.setPost_subj("testSubj" + i);
//			pdto.setPost_content("testContP" + i);
//			int result = pdao.insertPost(pdto);
//			
//			logger.info("insert result: " + result);
//			if(result==1) {
//				logger.info("success");
//			}else {
//				logger.info("fail");
//			}
//		}
		pdao.insertPost(pdto);
	}
	
//	@Test
//	public void insertReply() throws Exception {
//		ReplyDTO rdto = new ReplyDTO();
//		rdto.setPost_id(165);
//		rdto.setRp_content("엥");
//		rdto.setRp_writer("443434");
//		
//		pdao.insertReply(rdto);
//	}

	
//	@Test
//	public void readTest() throws Exception{
//		logger.info(pdao.read(1).toString());
//	}
	
//	@Test
//	public void listTest() throws Exception{
//		logger.info("test");
//	}

	
}
