package com.gblog.web;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dto.CategoryDTO;
import com.gblog.dto.GuestbookDTO;
import com.gblog.service.CategoryService;

@Controller
@RequestMapping(value = "/category/*")
public class CategoryController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CategoryController.class);
	
	@Inject
	private CategoryService csvc;
	
	// 카테고리 리스트
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String CategoryList(Model model) throws Exception {
		LOGGER.info("----- list 출력 -----");
		
		model.addAttribute("CategoryList", csvc.CategoryList());
		
		return "category/category";
		
	}
	
	// 카테고리 생성
	@RequestMapping(value= "/create", method = RequestMethod.GET)
	public void createGET(CategoryController cdto, Model model) throws Exception{
		LOGGER.info("----- create GET -----");
		
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(CategoryDTO cdto, RedirectAttributes reAttr) throws Exception {
		LOGGER.info("----- create POST -----");
		LOGGER.info(cdto.toString());
		
		csvc.Create(cdto);
		
		reAttr.addFlashAttribute("result", "success");
		
		return "redirect:/category/edit";
	}
	
	// 카테고리 에디터
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String CategoryEdit(Model model) throws Exception {
		LOGGER.info("----- edit GET -----");
		
		model.addAttribute("CategoryList", csvc.CategoryList());
		
		return "/category/delete";
	}
	
	// 카테고리 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("category_id") Integer category_id, RedirectAttributes reAttr) throws Exception {
		
		csvc.Delete(category_id);
		
		reAttr.addFlashAttribute("result", "success");
		
		return "redirect:/category/edit";
	}
	
	// 카테고리 디테일 페이지
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void ModifyGET(@RequestParam("category_id") Integer category_id, Model model) throws Exception {

		model.addAttribute(csvc.Read(category_id));
		
	}
	
	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String ModifyPOST(CategoryDTO cdto, RedirectAttributes reAttr) throws Exception {
			
		LOGGER.info("update 처리 중 ....");
			
		csvc.Update(cdto);
			
		return "redirect:/category/edit"; 
	}
	
}
