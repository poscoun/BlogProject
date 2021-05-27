package com.gblog.web;

import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dao.ProfileDAO;
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
		 
		 
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
			  
			  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			  // gdsImg에 원본 파일 경로 + 파일명 저장
			  pdto.setProfile_photo(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			  
			 } else {  // 첨부된 파일이 없으면
			  fileName = File.separator + "images" + File.separator + "none.png";
			  // 미리 준비된 none.png파일을 대신 출력함
			  
			  pdto.setProfile_photo(fileName);
			 
			 }
		 
		psvc.write(pdto);
		
		reAttr.addFlashAttribute("result", "success");
		
		return "redirect:/profile/list"; 
	}
	
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void list(Model model, HttpServletRequest request) throws Exception {
	      LOGGER.info(".... list 출력 ....");
	      
	      HttpSession session = request.getSession();
	      session.getAttribute("udto");
	      
	      model.addAttribute("list", psvc.list());
	   }
	 
	 @RequestMapping(value = "/read", method = RequestMethod.GET)
	 public void read(@RequestParam("user_id") String user_id, Model model, HttpServletRequest request) throws Exception{
		 
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

		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
			  
			  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			  // gdsImg에 원본 파일 경로 + 파일명 저장
			  pdto.setProfile_photo(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			  
			 } else {  // 첨부된 파일이 없으면
			  fileName = File.separator + "images" + File.separator + "none.png";
			  // 미리 준비된 none.png파일을 대신 출력함
			  
			  pdto.setProfile_photo(fileName);
			 
			 }
		 
		 psvc.modify(pdto);
		 
		 reAttr.addFlashAttribute("result", "수정되었습니다.");
		 
		 
		 
		 return "redirect:/profile/list ";
	 }
	 
	 @RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delPage(@RequestParam("user_id") String user_id) throws Exception{
		 	LOGGER.info(".....remove.....");
		 
			psvc.remove(user_id);	
			
			return "redirect:/profile/write";
			
		}

	 
	 
	 

}
