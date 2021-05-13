//package com.goott.project;
//
//import javax.inject.Inject;
//
//
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration         // 스프링 MVC를 테스트하는데 필요한 annotation
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
//public class ControllerTest {
//	
//	private static final Logger logger = LoggerFactory.getLogger(ControllerTest.class);
//	
//	@Inject
//	private WebApplicationContext webAppCtx;
//	
//	private MockMvc mockMvc;  // Tomcat 역할을 대신해줄 객체 
//	
//	@Before
//	public void setUp() {
//		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webAppCtx).build();
//		logger.info("setUp() 호출 ....");
//	}
//	
//	@Test
//	public void testController() {
//		try {
//			mockMvc.perform(MockMvcRequestBuilders.get("/controller"));  // POST, GET  방식 사용 가능
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//			
//
//}