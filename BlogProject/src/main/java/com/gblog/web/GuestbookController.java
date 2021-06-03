package com.gblog.web;

import java.util.List;

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

import com.gblog.dto.BlogDTO;
import com.gblog.dto.GuestbookDTO;
import com.gblog.dto.GuestbookReplyDTO;
import com.gblog.dto.ProfileDTO;
import com.gblog.service.BlogService;
import com.gblog.service.CategoryService;
import com.gblog.service.GuestbookService;
import com.gblog.service.ProfileService;
import com.gblog.service.UserService;

@Controller
@RequestMapping("/guestbook/*")
public class GuestbookController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestbookController.class);
	
	@Inject
	private GuestbookService gsvc;
	
	@Inject
	private CategoryService csvc;
	
	@Inject
	private ProfileService pfsvc;
	
	// 방명록 페이지
	@RequestMapping(value = "/guestbook_form", method = RequestMethod.GET)
	public String guestbookformGET(Model model, HttpSession session, 
								  @RequestParam(value="user_id", required=false) String user_id, 
								  @RequestParam(value="blog_id", required=false) Integer blog_id, 
								  GuestbookDTO gdto,
								  ProfileDTO pdto) throws Exception {
		logger.info("write GET ...");
		
		
		String sessionId = (String)session.getAttribute("user_id");
		session.getAttribute("bdto");
		session.getAttribute("blog_id_session");
		ProfileDTO blogid = pfsvc.read(sessionId);
//	    model.addAttribute("bloglist", bsvc.blogList());
	    model.addAttribute("user_id", sessionId);
		model.addAttribute("blog_id", blogid.getBlog_id());
		model.addAttribute("blog_id_update", blog_id);
		model.addAttribute("blog_id_delete", blog_id);
		
		if(user_id.equals(sessionId)) {
			
	 		model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
			model.addAttribute("bloglist", pfsvc.list());
						
	    }else {
	    	
	 		model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
			model.addAttribute("bloglist", pfsvc.list());
			
	    }
		
		return "/guestbook/guestbook_form";
	}
	
	// 방명록 작성
	@RequestMapping(value = "/guestbook_form", method = RequestMethod.POST)
	public String guestbookformPOST(GuestbookDTO gdto, RedirectAttributes reAttr, @RequestParam(value = "blog_id", required = false) Integer blog_id, @RequestParam(value="user_id", required=false) String user_id,
									HttpSession session, Model model, ProfileDTO pdto) throws Exception {
		
		logger.info("write POST ...");
	    model.addAttribute("bloglist", pfsvc.list());
		String sessionId = (String)session.getAttribute("user_id");
		ProfileDTO blogid = pfsvc.read(sessionId);
		model.addAttribute("blog_id_update", blog_id);
		model.addAttribute("blog_id_delete", blog_id);
		
		if(blog_id.equals(blogid.getBlog_id())) {
//	         model.addAttribute("user_id", user_id);
	         gsvc.write(gdto);
	    }else {
	    	
//	    	 model.addAttribute("user_id", sessionId);
	    	 gdto.setBlog_id(blog_id);
	    	 gdto.setUser_id(sessionId);
	    	 gsvc.write(gdto);

	    }
		
		model.addAttribute("list", gsvc.list(blog_id));
		model.addAttribute("category_list", csvc.CategoryList(user_id));
		model.addAttribute("bloglist", pfsvc.list());
		
		return "/guestbook/guestbook_form";
		
	}
	
	// 수정 페이지
	@RequestMapping(value = "/guestbook_modify", method = RequestMethod.GET)
	public void guestUpdateGET(@RequestParam("guest_id") int guest_id, Model model, 
								@RequestParam(value = "blog_id", required = false) Integer blog_id, 
								@RequestParam(value="user_id", required=false) String user_id,
								HttpSession session
								) throws Exception {
		String sessionId = (String)session.getAttribute("user_id");
		if(user_id.equals(sessionId)) {
			
			model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
			model.addAttribute("bloglist", pfsvc.list());
			
		}else {
			
			model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(sessionId));
			model.addAttribute("bloglist", pfsvc.list());
			
		}
//		System.out.println(blog_id);
		model.addAttribute("user_id", user_id);
		model.addAttribute("blog_id_update", blog_id);
		model.addAttribute(gsvc.read(guest_id));
		
	}
	
	// 수정 처리
	@RequestMapping(value = "/guestbook_modify", method = RequestMethod.POST)
	public String guestUpdatePOST(GuestbookDTO gdto, RedirectAttributes reAttr, Model model, HttpSession session, 
								@RequestParam(value="blog_id", required=false) Integer blog_id, 
								@RequestParam(value="user_id", required=false) String user_id
								) throws Exception {
		
		logger.info("update 처리 중 ....");
		
		model.addAttribute("user_id", user_id);
		model.addAttribute("blog_id_update", blog_id);
//		Integer blogid = bsvc.blogSelect(sessionId);
		model.addAttribute("blog_id_delete", blog_id);
		
		
		gsvc.modify(gdto);
		
		return "redirect:guestbook_form?user_id="+user_id+"&blog_id="+blog_id;
	}
	
	// 삭제 처리
	@RequestMapping(value = "/guestbook_del", method = RequestMethod.GET)
	public String guestbookDel(@RequestParam("guest_id") int guest_id, RedirectAttributes reAttr, Model model, HttpSession session,
							   @RequestParam(value = "blog_id", required = false) Integer blog_id, 
							   @RequestParam(value="user_id", required=false) String user_id) throws Exception {
		
		String sessionId = (String)session.getAttribute("user_id");
		model.addAttribute("blog_id_delete", blog_id);
//		Integer blogid = bsvc.blogSelect(sessionId);
		model.addAttribute("blog_id_update", blog_id);
		model.addAttribute("blog_id_delete", blog_id);
		
		
		gsvc.remove(guest_id);
		
		if(user_id.equals(sessionId)) {
			
			model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
			model.addAttribute("bloglist", pfsvc.list());
			
		}else {
			
			model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
			model.addAttribute("bloglist", pfsvc.list());
		}
		
		return "redirect:guestbook_form?user_id="+user_id+"&blog_id="+blog_id;
		
	}
	
	// 답글 윈도우 창
	@RequestMapping(value = "/guestbook_reply", method = RequestMethod.GET)
	public String guestbookReplyGET(@RequestParam("guest_id") int guest_id, @RequestParam("user_id") String user_id, RedirectAttributes reAttr, Model model,
									@RequestParam("blog_id") Integer blog_id) throws Exception {
		
		model.addAttribute("reply_list", gsvc.listReply(guest_id));
		model.addAttribute("guest_id", guest_id);
		model.addAttribute("user_id", user_id);
		model.addAttribute("blog_id", blog_id);
		
		return "/guestbook/guestbook_reply";
		
	}
	
	// 답글 처리
	@RequestMapping(value = "/guestbook_reply", method = RequestMethod.POST)
	public String guestbookReplyPOST(@RequestParam("guest_id") int guest_id, RedirectAttributes reAttr, GuestbookReplyDTO gdto,
									 @RequestParam("guest_rp_id") String guest_rp_id,
									 @RequestParam(value = "blog_id", required = false) Integer blog_id,
									 @RequestParam(value="user_id", required=false) String user_id,
									 HttpSession session, Model model) throws Exception {
		gdto.setGuest_id(guest_id);
		gdto.setGuest_rp_id(guest_rp_id);
		gsvc.writeReply(gdto);
		gsvc.replyCount(guest_id);
		
		String sessionId = (String)session.getAttribute("user_id");
		model.addAttribute("blog_id", blog_id);
		
		if(guest_rp_id.equals(sessionId)) {
			
			model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
			model.addAttribute("bloglist", pfsvc.list());
			
		}else {
			
			model.addAttribute("list", gsvc.list(blog_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
			model.addAttribute("bloglist", pfsvc.list());
		}
		
		return "/guestbook/guestbook_form";
	}

}
