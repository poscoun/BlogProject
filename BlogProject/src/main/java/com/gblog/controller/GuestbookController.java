package com.gblog.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dto.GuestbookDTO;
import com.gblog.dto.GuestbookReplyDTO;
import com.gblog.service.GuestbookService;

@Controller
@RequestMapping("/guestbook/*")
public class GuestbookController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestbookController.class);
	
	@Inject
	private GuestbookService gsvc;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		gsvc.insertdate();
		int totalcount = gsvc.visitTotal();
		int todaycount = gsvc.visitToday();
		
		session.setAttribute("totalCount", totalcount);
		session.setAttribute("todayCount", todaycount);
		
		return "/guestbook/main";
	}
	
	// 방명록 페이지
	@RequestMapping(value = "/guestbook_form", method = RequestMethod.GET)
	public String guestbookformGET(Model model) throws Exception {
		logger.info("write GET ...");
		
		model.addAttribute("list", gsvc.list());
		
		return "/guestbook/guestbook_form";
		
	}
	
	// 방명록 작성
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
	
	// 삭제 처리
	@RequestMapping(value = "/guestbook_del", method = RequestMethod.GET)
	public String guestbookDel(@RequestParam("guest_id") int guest_id, RedirectAttributes reAttr) throws Exception {
		
		gsvc.remove(guest_id);
		
		return "redirect:/guestbook/guestbook_form";
		
	}
	
	// 답글 윈도우 창
	@RequestMapping(value = "/guestbook_reply", method = RequestMethod.GET)
	public String guestbookReplyGET(@RequestParam("guest_id") int guest_id, RedirectAttributes reAttr, Model model) throws Exception {
		// System.out.println(guest_id);
		model.addAttribute("reply_list", gsvc.listReply(guest_id));
		model.addAttribute("guest_id", guest_id);
		
		return "/guestbook/guestbook_reply";
		
	}
	
	// 답글 처리
	@RequestMapping(value = "/guestbook_reply", method = RequestMethod.POST)
	public String guestbookReplyPOST(@RequestParam("guest_id") int guest_id, RedirectAttributes reAttr, GuestbookReplyDTO gdto) throws Exception {
		
		gdto.setGuest_id(guest_id);
		gsvc.writeReply(gdto);
		gsvc.replyCount(guest_id);
		
		return "redirect:/guestbook/guestbook_form";
	}

}
