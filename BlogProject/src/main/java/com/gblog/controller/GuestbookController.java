package com.gblog.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/guestbook/*")
public class GuestbookController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestbookController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "/guestbook/main";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String guestbookformGET(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "/guestbook/guestbook_form";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String guestbookformPOST(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "/guestbook/guestbook_form";
	}

}
