package com.gbolg.web;

import java.util.List;

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
	private GusetbookReplyDAO grdao;
	
	private static Logger logger = LoggerFactory.getLogger(GuestDAOTest.class);
	
//	@Test
//	public void insertTest() throws Exception{
//		GuestbookReplyDTO gdto = new GuestbookReplyDTO();
//		
//		gdto.setGuest_id(8);
//		gdto.setGuest_rp_content("답글 아이디 테스트");
//		gdto.setUser_id("Won");
//		
//		grdao.insert(gdto);
//		
//	}
	
	@Test
	public void listTest() throws Exception{
		 logger.info(grdao.listreply(9).toString());
		
		List<GuestbookReplyDTO> list = grdao.listreply(9);
		for(GuestbookReplyDTO gdto : list) {
			System.out.println(gdto.getGuest_id()+"\t"+gdto.getGuest_rp_content()+"\t"+gdto.getGuest_rp_date()+"\t"+gdto.getUser_id());
		}
		
	}

}
