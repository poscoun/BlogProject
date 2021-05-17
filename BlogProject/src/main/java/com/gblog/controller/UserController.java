package com.gblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public int idcheck(UserDTO udto) throws Exception{
		int result = usvc.idcheck(udto);
		return result;
	}
	
	
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void insertUser( Model model)throws Exception{
		LOGGER.info("get User register");		
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertUser(UserDTO udto) throws Exception{
		LOGGER.info("get User register");	
		LOGGER.info(udto.toString());
		
		int result = usvc.idcheck(udto);
		try {
			if(result ==1) {
				return "/user/join";
			}else if(result ==0) {
				
				
				
				String rawPw = "";			// 인코딩 전 비밀번호
				String encodePw = "";	    // 인코딩 후 비밀번호
				
				rawPw = udto.getUser_pw();
				encodePw = pwEncoder.encode(rawPw);
				udto.setUser_pw(encodePw);
				usvc.insertUser(udto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException();
		}
		return "redirect:/";
		
		
		
	}
	
	
	
	
	
	
	
	
}
