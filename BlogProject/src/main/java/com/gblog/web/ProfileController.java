package com.gblog.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dto.ProfileDTO;
import com.gblog.service.ProfileService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProfileController.class);
	
	@Inject
	private ProfileService psvc;
	
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	   public void list(Model model) throws Exception {
	      LOGGER.info(".... list 출력 ....");
	      
	      model.addAttribute("list", psvc.list());
	   }
	 
	 
	 @RequestMapping(value = "/read", method = RequestMethod.GET)
	 public void read(@RequestParam("user_id") String user_id, Model model) throws Exception{
		 
		 model.addAttribute(psvc.read(user_id));
	 }
	 

	
	 @RequestMapping(value = "/modify", method = RequestMethod.GET)
	 public void modifyGET(@RequestParam("user_id") String user_id, Model model) throws Exception{
		 LOGGER.info(".... modifyGET ....");
		 
		 model.addAttribute(psvc.read(user_id));
	 }
	 
	 @RequestMapping(value = "/modify", method = RequestMethod.POST)
	 public String modifyPOST (ProfileDTO pdto, RedirectAttributes reAttr) throws Exception{
		 LOGGER.info(".....modifyPOST.....");
		 

		 
		 
		 psvc.modify(pdto);
		 
		 reAttr.addFlashAttribute("result", "수정되었습니다.");
		 
		 return "redirect:/profile/list";
	 }
	 
	 
	 
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delPage(@RequestParam("user_id") String user_id) throws Exception{
		 	LOGGER.info(".....remove.....");
		 
			psvc.remove(user_id);	
			
			return "redirect:/profile/list";
			
		}
	 

	 
	 

}
