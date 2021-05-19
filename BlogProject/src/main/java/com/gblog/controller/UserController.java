package com.gblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.dto.UserDTO;
import com.gblog.service.UserService;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private JavaMailSender mailSender;		
	
	

	@Inject
	private UserService usvc;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public int idcheck(UserDTO udto) throws Exception{
		int result = usvc.idcheck(udto);
		return result;
	}
	
	
	
	
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void insertUser( Model model)throws Exception{
		LOGGER.info("get User register");		
	}
	
	//로그인 페이지 이동
		@RequestMapping(value="/login", method = RequestMethod.GET)
		public void login() {
			
			LOGGER.info("로그인 페이지 진입");
			
		}
	
	
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String insertUser(UserDTO udto) throws Exception{
		LOGGER.info("get User register");	
		LOGGER.info(udto.toString());
		
		int result = usvc.idcheck(udto);     //아이디 중복
		
		
		try {
			if(result ==1) {
				return "/user/join";
			}else if(result ==0) {
				
				
				
				String rawPw = "";			// 인코딩 전 비밀번호
				String encodePw = "";	    // 인코딩 후 비밀번호
				
				rawPw = udto.getUser_pw();
				encodePw = pwEncoder.encode(rawPw);
				udto.setUser_pw(encodePw);
				usvc.insertUser(udto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException();
		}
		return "redirect:/";
	}
	
	
	 //이메일 인증 
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) throws Exception{
		
		 //뷰(View)로부터 넘어온 데이터 확인 
		LOGGER.info("이메일 데이터 전송 확인");
		LOGGER.info("이메일 : " + email);
				
		 //인증번호(난수) 생성 
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		LOGGER.info("인증번호 " + checkNum);
		
		 //이메일 보내기 
		String setFrom = "wl960407@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"인증 번호는 " + checkNum + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";		
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	}
	
	

	
	
	
	
	//로그인
	@RequestMapping(value="/login", method= RequestMethod.POST)
	
	public String login(HttpServletRequest request, UserDTO udto, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
	
		UserDTO lvo = usvc.login(udto);	// 제출한아이디와 일치하는 아이디 있는지 
		
		if(lvo != null) {			// 일치하는 아이디 존재시
			
			rawPw = udto.getUser_pw();		// 사용자가 제출한 비밀번호
			encodePw = lvo.getUser_pw();		// 데이터베이스에 저장한 인코딩된 비밀번호
			
			
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {		// 비밀번호 일치여부 판단
			
				
				
				lvo.setUser_pw("");					// 인코딩된 비밀번호 정보 지움
				session.setAttribute("udto", lvo); 	// session에 사용자의 정보 저장
				return "redirect:/user/join";		// 메인페이지 이동  --> 나중에 메인으로 변경해야함 
				
				
			} else {

				rttr.addFlashAttribute("result", 0);			
				return "redirect:/user/login";	// 로그인 페이지로 이동
				
			}
			
		} else {					// 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			
			rttr.addFlashAttribute("result", 0);			
			return "redirect:/user/login";	// 로그인 페이지로 이동
			
		}
		
	}
	
	
	  /* 이메일 인증 */
//    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
//    @ResponseBody
//    public void mailCheckGET(String email) throws Exception{
//        
//        /* 뷰(View)로부터 넘어온 데이터 확인 */
//        LOGGER.info("이메일 데이터 전송 확인");
//        LOGGER.info("인증번호 : " + email);
//                
//        
//    }
	
	
	
	
	
	
	
	
	
	
}
