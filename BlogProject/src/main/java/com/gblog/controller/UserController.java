package com.gblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gbolg.service.UserService;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/*")
public class UserController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService usvc;
	
	//회원가입
	@RequestMapping(value = "user/insertUser", method = RequestMethod.GET)
	public void insertUser(Model model)throws Exception{
		LOGGER.info("get User register");
	}
	
}
