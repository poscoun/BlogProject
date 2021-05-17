package com.gblog.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gblog.service.ProfileService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProfileController.class);
	
	@Inject
	private ProfileService psvc;
	
	@RequestMapping(value="/profileRead", method = RequestMethod.GET)
	public void read(@RequestParam("user_id") String user_id, Model model) throws Exception{
		
		model.addAttribute(psvc.read(user_id));

	}
	
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	   public void list(Model model) throws Exception {
	      LOGGER.info(".... list 출력 ....");
	      
	      model.addAttribute("list", psvc.list());
	   }
	
	
	

}
