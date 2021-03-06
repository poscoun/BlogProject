package com.gblog.advice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {
	private static final Logger logger=
			LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
//	@ExceptionHandler(Exception.class)
//	public String errorException(Model model, Exception e) {
//		logger.info("@ControllerAdvice 방식 \n###exception : " + e.getMessage());
//		model.addAttribute("exception", e);
//		return "error/exception_view";
//	}
	
	@ExceptionHandler(Exception.class)
	private ModelAndView errMav(Exception e) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/error/exception_view");
		mav.addObject("exception", e);
		return mav;
	}
	
	
}
