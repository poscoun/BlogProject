package com.gblog.web;

import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dto.ProfileDTO;
import com.gblog.service.ProfileService;
import com.gblog.utils.UploadFileUtils;



@Controller
@RequestMapping("/profile/*")
public class ProfileController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProfileController.class);
	
	@Inject
	private ProfileService psvc;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET(ProfileDTO pdto, Model model) throws Exception{
		LOGGER.info("....write GET....");
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ProfileDTO pdto, MultipartFile file, RedirectAttributes reAttr) throws Exception{
		LOGGER.info("....write POST....");
		LOGGER.info(pdto.toString());
		
		 String imgUploadPath = uploadPath + File.separator + "imgUpload";
		 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		 String fileName = null;

		 if(file != null) {
		  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 } else {
		  fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		 }

		 pdto.setProfile_photo(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		 pdto.setProfile_photo(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		psvc.write(pdto);
		
		reAttr.addFlashAttribute("result", "success");
		
		return "redirect:/profile/list"; 
	}
	
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
	 public String modifyPOST (ProfileDTO pdto, MultipartFile file, RedirectAttributes reAttr) throws Exception{
		 LOGGER.info(".....modifyPOST.....");
		 
		 String imgUploadPath = uploadPath + File.separator + "imgUpload";
		 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		 String fileName = null;

		 if(file != null) {
		  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 } else {
		  fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		 }

		 pdto.setProfile_photo(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		 pdto.setProfile_photo(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		 
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
