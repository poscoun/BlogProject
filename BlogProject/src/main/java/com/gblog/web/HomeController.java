package com.gblog.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gblog.common.UploadFileUtils;
import com.gblog.dto.PostDTO;
import com.gblog.service.PostService;

@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Inject
    private PostService psvc;
    
    @Resource(name="uploadPath")
    private String uploadPath;
    
    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);
        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        
        String formattedDate = dateFormat.format(date);
        
        model.addAttribute("serverTime", formattedDate );
        
        return "home";
    }
    
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(PostDTO pdto, MultipartFile file, Model model) throws Exception{
    	String imgUploadPath = uploadPath + File.separator + "imgUpload";	// 이미지를 업로드할 폴더를 생성
    	String ymdPath = UploadFileUtils.calcPath(imgUploadPath);	// 위의 폴더를 기준으로 연월일 폴더를 생성
    	String fileName = null;	// 기본 경로와 별개로 작성되는 경로 + 파일이름

    	if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
    		// 첨부된 파일이 이름이 없다면
    		fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
    	} else {
    		// 첨부된 파일이 없으면
    		fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
    		// 미리 준비된 none.png파일을 대신 출력함
    	}

    	// post_img에 원본 파일 경로 + 파일명 저장
    	pdto.setPost_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
    	model.addAttribute("pdto", pdto);

    	psvc.insertPost(pdto);
    	
    	return "redirect:/";
    }
}