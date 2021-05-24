package com.gbolg.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gblog.dto.PostDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class Log4jTest {
	
	private static final Logger log = LoggerFactory.getLogger(Log4jTest.class);
	
	@Test
	public static void main(String[] args) {
		new Log4jTest().test();
	}
	public void test() {
		PostDTO p= new PostDTO();
		p.setPost_content("testetset");
		
		log.info("info");
	}
}
