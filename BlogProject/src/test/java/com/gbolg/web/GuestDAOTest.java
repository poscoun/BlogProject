package com.gbolg.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//import com.gblog.dao.BlogDAO;
import com.gblog.dao.GuestDAO;
import com.gblog.dao.GuestbookDAO;
import com.gblog.dto.BlogDTO;
import com.gblog.dto.GuestDTO;
import com.gblog.dto.GuestbookDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GuestDAOTest {
	
	@Inject
	private GuestbookDAO gbdao;
	
	@Inject
	private GuestDAO gdao;
	
	@Inject
//	private BlogDAO bdao;
	
	private static Logger logger = LoggerFactory.getLogger(GuestDAOTest.class);
	
//	@Test
//	public void insertTest() throws Exception{
//		GuestbookDTO gdto = new GuestbookDTO();
//		
//		gdto.setUser_id("세션에서 가저올 ID");
//		gdto.setGuest_content("방명록 내용");
//		
//		gdao.insert(gdto);
//		
//	}
	
//	@Test
//	public void listTest() throws Exception{
//		logger.info(gdao.list().toString());
//	}
	
//	@Test
//	public void updateTest() throws Exception{
//		GuestbookDTO gdto = new GuestbookDTO();
//		gdto.setGuest_id(4);
//		gdto.setGuest_content("수정하기");
//		
//		gdao.update(gdto);
//	}
//	@Test
//	public void deleteTest() throws Exception{
//		gdao.delete(4);
//	}
//	
//	@Test
//	public void readTest() throws Exception{
//		logger.info(gdao.read(6).toString());
//	}
	
//	@Test
//	public void visitTest() throws Exception{
		
		// gdao.insert();
//		int totalcount = gdao.visitTotal();
//		System.out.println(totalcount);
//		
//		int todaytcount = gdao.visitToday();
//		System.out.println(todaytcount);
//		
//	}
	
//	@Test
//	public void test() throws Exception {
//		bdao.selectOne("test");
//	}
	
}
