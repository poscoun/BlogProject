package com.gblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dto.UserDTO;
import com.gblog.service.UserService;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService usvc;
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void insertUser(UserDTO udto, Model model)throws Exception{
		LOGGER.info("get User register");		
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertUser(UserDTO udto, RedirectAttributes reAttr) throws Exception{
		LOGGER.info("get User register");	
		LOGGER.info(udto.toString());
		
		usvc.insertUser(udto);
		
		reAttr.addFlashAttribute("result", "success"); 
		
		return "home";
		
	}
	
}
