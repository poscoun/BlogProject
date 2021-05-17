package com.gblog.advice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

// @ControllerAdvice: 현재 클래스가 컨트롤러에서 발생하는 Exception을 전문적으로 처리하는 클래스이다
@ControllerAdvice
public class CommonExceptionAdvice {
	private static final Logger logger=
			LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
//	@ExceptionHandler(Exception.class)
//	public String common(Exception e) {
//		logger.info(e.toString());
//		
//		return null;
//	}
	
	@ExceptionHandler(Exception.class)
	private ModelAndView errMav(Exception e) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/post/exception_view");
		mav.addObject("exception", e);
		return mav;
	}
	
	
}
