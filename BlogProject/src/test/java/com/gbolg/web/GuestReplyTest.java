package com.gbolg.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dao.GusetbookReplyDAO;
import com.gblog.dto.GuestbookReplyDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GuestReplyTest {
	
	@Inject
	private GusetbookReplyDAO gdao;
	
	private static Logger logger = LoggerFactory.getLogger(GuestDAOTest.class);
	
//	@Test
//	public void insertTest() throws Exception{
//		GuestbookReplyDTO gdto = new GuestbookReplyDTO();
//		
//		gdto.setGuest_id(1);
//		gdto.setGuest_rp_content("답글");
//		
//		gdao.insert(gdto);
//		
//	}
	
//	@Test
//	public void listTest() throws Exception{
//		logger.info(gdao.list().toString());
//	}

}
