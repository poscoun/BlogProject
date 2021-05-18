package com.gblog.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dao.ProfileDAO;
import com.gblog.dto.ProfileDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProfileDAOTest {
	
	@Inject
	private ProfileDAO pdao;
	
	private static Logger logger = LoggerFactory.getLogger(ProfileDAOTest.class);
	
//	@Test
//	public void insertTest() throws Exception {
//		ProfileDTO pdto = new ProfileDTO();
//		pdto.setProfile_content("테스트_내용");
//		pdto.setProfile_phone("010-1234-5678");
//		pdto.setProfile_sns("ddd@naver.com");
//		pdto.setUser_id("테스트_id");
//		pdao.insert(pdto);
//	}
	
//	@Test
//	public void readTest() throws Exception {
//		logger.info(pdao.read("테스트_id").toString());
//		
//	}

//	@Test
//	public void updateTest() throws Exception {
//		ProfileDTO pdto = new ProfileDTO();
//		pdto.setUser_id("테스트_id");
//		pdto.setProfile_content("테스트_내용수정");
//		pdto.setProfile_phone("010-5555-6666");
//		pdto.setProfile_sns("수정@naver.com");
//		pdao.update(pdto);
//	}
	
//	@Test
//	public void deleteTest() throws Exception {
//		pdao.delete("테스트_id");
//	}
	
}
