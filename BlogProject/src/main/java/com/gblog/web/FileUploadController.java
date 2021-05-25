package com.gblog.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.gblog.dto.FileUploadDTO;

@Controller
public class FileUploadController {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	@RequestMapping(value="/post/fileUpload")
	public String fileUpload(@ModelAttribute("fileUploadDTO") FileUploadDTO fileUploadDTO , 
			HttpServletRequest request , Model model){
		
		logger.info("upload ..... ");
		
        HttpSession session = request.getSession();
        String rootPath = session.getServletContext().getRealPath("/");
        String attachPath = "upload/";

        MultipartFile upload = fileUploadDTO.getUpload();
        String filename = "";
        String CKEditorFuncNum = "";
        
        if(upload != null){
            filename = upload.getOriginalFilename();
            fileUploadDTO.setFilename(filename);
            CKEditorFuncNum = fileUploadDTO.getCKEditorFuncNum();
            try{
                File file = new File(rootPath + attachPath + filename);
                upload.transferTo(file);
            }catch(IOException e){
                e.printStackTrace();
            }  
        }
            model.addAttribute("filePath",attachPath + filename);          //결과값을
            model.addAttribute("CKEditorFuncNum",CKEditorFuncNum);//jsp ckeditor 콜백함수로 보내줘야함
        return "post/list";
    }

}
