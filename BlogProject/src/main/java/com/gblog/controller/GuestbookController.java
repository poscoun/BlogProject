package com.gblog.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dto.GuestbookDTO;
import com.gblog.service.GuestbookService;

@Controller
@RequestMapping("/guestbook/*")
public class GuestbookController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestbookController.class);
	
	@Inject
	private GuestbookService gsvc;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "/guestbook/main";
	}
	
	
	@RequestMapping(value = "/guestbook_form", method = RequestMethod.GET)
	public String guestbookformGET(GuestbookDTO gdto ,Model model, RedirectAttributes reAttr) throws Exception {
		logger.info("write GET ...");
		
		
		model.addAttribute("list", gsvc.list());
		
		return "/guestbook/guestbook_form";
		
	}
	
	@RequestMapping(value = "/guestbook_form", method = RequestMethod.POST)
	public String guestbookformPOST(GuestbookDTO gdto, RedirectAttributes reAttr) throws Exception {
		logger.info("write POST ...");
		
		gsvc.write(gdto);
		
		return "redirect:/guestbook/guestbook_form";
	}
	
	// 수정 페이지
	@RequestMapping(value = "/guestbook_modify", method = RequestMethod.GET)
	public void guestUpdateGET(@RequestParam("guest_id") int guest_id, Model model) throws Exception {
		
		model.addAttribute(gsvc.read(guest_id));
		
	}
	
	// 수정 처리
	@RequestMapping(value = "/guestbook_modify", method = RequestMethod.POST)
	public String guestUpdatePOST(GuestbookDTO gdto, RedirectAttributes reAttr) throws Exception {
		
		logger.info("update 처리 중 ....");
		
		gsvc.modify(gdto);
		
		return "redirect:/guestbook/guestbook_form"; 
	}
	
	@RequestMapping(value = "/guestbook_del", method = RequestMethod.GET)
	public String guestbookDel(@RequestParam("guest_id") int guest_id, RedirectAttributes reAttr) throws Exception {
		
		gsvc.remove(guest_id);
		
		return "redirect:/guestbook/guestbook_form";
		
	}

}
