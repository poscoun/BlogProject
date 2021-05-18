package com.gblog.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dao.UserDAO;
import com.gblog.dto.UserDTO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserTest {
	
	@Inject
	private UserDAO udao;
	private static Logger logger = LoggerFactory.getLogger(UserTest.class);
	
//	@Test
//	public void insertTest() throws Exception{
//		UserDTO udto = new UserDTO();
//		udto.setUser_id("goott27");
//		udto.setUser_pw("qwer123");
//		udto.setUser_name("집가자");
//		udto.setUser_birth("20201112");
//		udto.setUser_email("goott@gott.com");
//		
//        udto.setUser_phone("010123456789");
//        udto.setUser_gender("남성");
//        udao.insertUser(udto);
//        
//		
//		
//		
//	}
	
	
//	@Test // 중복확인 test
//	public void idcheck() throws Exception{
//		
//		String id = "test";
//		String id2 = "rand";
//		
//		udao.idcheck(id);
//		udao.idcheck(id2);	
//	}
	
	@Test
	public void logintest()throws Exception{
		
		UserDTO udto = new UserDTO();
		
		udto.setUser_id("login11");
		
		
		udao.login(udto);
		System.out.println("결과 값 : " + udao.login(udto));
		
		
	}
	
	
	
	
}
