package com.gblog.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.gblog.common.Search;

import com.gblog.dto.GuestDTO;

import com.gblog.dto.PostDTO;
import com.gblog.dto.ProfileDTO;
import com.gblog.dto.ReplyDTO;
import com.gblog.service.CategoryService;
import com.gblog.service.GuestbookService;
import com.gblog.service.PostService;
import com.gblog.service.ProfileService;
import com.gblog.service.UserService;

@Controller
@RequestMapping("/post/*")
public class PostController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Inject
	private PostService psvc;
	
	@Inject
	private GuestbookService gsvc;
	
	@Inject
	private CategoryService csvc;
	
	@Inject
	private UserService usvc;
	
	@Inject
	private ProfileService pfsvc;
	
	
	@Resource(name="uploadPath")
    private String uploadPath;
	
	@RequestMapping(value = "/homeList", method = RequestMethod.GET)
	   public String homeList(Model model, HttpServletRequest request,
	         @RequestParam(required = false, defaultValue = "1") int page,
	         @RequestParam(required = false, defaultValue = "1") int range,
	         @RequestParam(required = false) String keyword,
	         @ModelAttribute("search") Search search,
	         @RequestParam(value="user_id", required = false) String user_id,
	         @RequestParam(value="blog_id", required = false) Integer blogid,
	         HttpSession session, GuestDTO gdto	
	         ) throws Exception {
	      
	      logger.info("list 출력");
	      
	      //검색
	      model.addAttribute("search", search);
	      search.setKeyword(keyword);
	      //int listCnt = psvc.getPostListCnt(search);
	      //search.pageInfo(page, range, listCnt);
	      //model.addAttribute("pagination", search);
	      
	      String sessionId = (String)session.getAttribute("user_id");
	      if(sessionId == null) {
	    	  int listCnt = psvc.getPostListCnt(search);
    		  search.pageInfo(page, range, listCnt);
    		  model.addAttribute("pagination", search);
    		  model.addAttribute("list", psvc.getPostList(search));
    		  model.addAttribute("user_id", user_id);
    		  model.addAttribute("category_list", csvc.CategoryList(user_id));
    		  
	     	      
	      }else {
	    	  
	    	  if(user_id != null) {
	    		  
	    		  search.setUser_id(user_id);
	    		  
	    		  model.addAttribute("user_id", user_id);
	    		  model.addAttribute("category_list", csvc.CategoryList(user_id));
	    		  
	    		  ProfileDTO blog_id = pfsvc.read(user_id);
	    		  System.out.println(blog_id);
	    		  
	    		  model.addAttribute("blog_id", blog_id.getBlog_id());
	    		  
	    		  int listCnt = psvc.getPostListCnt(search);
	    		  search.pageInfo(page, range, listCnt);
	    		  model.addAttribute("pagination", search);
	    		  model.addAttribute("list", psvc.getPostList(search));
	    		  
	    		  gdto.setBlog_id(blogid);
	    		  gsvc.insertdate(gdto);
	    		  int totalcount = gsvc.visitTotal(blogid);
	    		  int todaycount = gsvc.visitToday(blogid);
	    		  
	    		  session.setAttribute("totalCount", totalcount);
	    		  session.setAttribute("todayCount", todaycount);
	    		  
	    	  }else {
	    		  search.setUser_id(sessionId);
	    		  model.addAttribute("category_list", csvc.CategoryList(sessionId));
	    		  
	    		  ProfileDTO pdto = pfsvc.read(sessionId);
	    		  
	    		  model.addAttribute("blog_id", pdto.getBlog_id());
	    		  
	    		  int listCnt = psvc.getPostListCnt(search);
	    		  search.pageInfo(page, range, listCnt);
	    		  model.addAttribute("pagination", search);
	    		  model.addAttribute("list", psvc.getPostList(search));
	    		  
	    		  gdto.setBlog_id(pdto.getBlog_id());
	    		  gsvc.insertdate(gdto);
	    		  int totalcount = gsvc.visitTotal(pdto.getBlog_id());
	    		  int todaycount = gsvc.visitToday(pdto.getBlog_id());
	    		  
	    		  session.setAttribute("totalCount", totalcount);
	    		  session.setAttribute("todayCount", todaycount);
	    	  }
	    	  
	      }
	      
	      session.getAttribute("udto");
	      
	      model.addAttribute("userlist", usvc.userList());
	      model.addAttribute("bloglist", pfsvc.list());
	      
	      session.getAttribute("bdto");
	      

	      
	      // 전체 게시글 개수
//	      int listCnt = psvc.getPostListCnt(search);
	      
//	      model.addAttribute("blog_id", blogid);
	      
//	      search.pageInfo(page, range, listCnt);
	      
	      // 페이징
//	      model.addAttribute("pagination", search);
	      //게시글 화면 출력
//	      model.addAttribute("list", psvc.getPostList(search));
      
	     
	       //model.addAttribute("category_list", csvc.CategoryList(user_id));
	      
	      return "post/homeList";
	   }
	
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	public String getList(Model model, HttpServletRequest request,
			@RequestParam Integer category_id,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search,
			@RequestParam(value="user_id", required=false) String user_id,
			@RequestParam(value="blog_id", required = false) Integer blogid,
			HttpSession session ) throws Exception {
		
		logger.info("list 출력");
		
		//검색
		model.addAttribute("search", search);
		search.setKeyword(keyword);
		search.setCategory_id(category_id);
		System.out.println(keyword +" and " + category_id);
		
		String sessionId = (String)session.getAttribute("user_id");
		if(user_id != null) {
		//int category_id = Integer.parseInt(request.getParameter("category_id"));
			
			model.addAttribute("user_id", user_id);
			model.addAttribute("category_id", category_id);
			model.addAttribute("categoryOne", csvc.Read(category_id));
			model.addAttribute("category_list", csvc.CategoryList(user_id));
		}else {
			model.addAttribute("user_id", sessionId);
			model.addAttribute("category_id", category_id);
			model.addAttribute("categoryOne", csvc.Read(category_id));
			model.addAttribute("category_list", csvc.CategoryList(sessionId));
			
			
		}
		
		
		// 전체 게시글 개수
		int listCnt = psvc.getPostListCateCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		// Pagination 객체 생성
		//Pagination pgn = new Pagination();
		//pgn.pageInfo(page, range, listCnt);
		
		// 페이징
		model.addAttribute("pagination", search);
		//게시글 화면 출력
		
		model.addAttribute("bloglist", pfsvc.list());		// 유저 리스트 
		
		model.addAttribute("list", psvc.getPostCateList(search));
	    
		return "post/getList";
	}
	
	@RequestMapping(value = "/postForm", method = RequestMethod.GET)
	public String postFormGet(PostDTO pdto, Model model, HttpServletRequest request) throws Exception{
		logger.info("...write get...");
		
		HttpSession session = request.getSession();
		session.getAttribute("udto");
		
		String user_id = (String)session.getAttribute("user_id");
		
		
		model.addAttribute("CategoryList", csvc.CategoryList(user_id));
		
		return "post/postForm";
	}
	
	@RequestMapping(value = "/savePost", method = RequestMethod.POST)
	public String savePost(@ModelAttribute("postDTO") PostDTO pdto,
			@RequestParam("mode") String mode,
			//@RequestParam("category_id") int category_id,
			RedirectAttributes rttr, Model model, HttpSession session) throws Exception {
		
		//pdto.setCategory_id(category_id);
		System.out.println("writer: "+pdto.getUser_id());
		String user_id = (String)session.getAttribute("user_id");
		
		
		if(mode.equals("edit")) {
			psvc.updatePost(pdto);
		}else {
			psvc.insertPost(pdto);
		}
		model.addAttribute("CategoryList", csvc.CategoryList(user_id));
		
		//return "redirect:/post/getList?category_id="+category_id;
		return "redirect:/post/homeList";
	}
	
	// test
	@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("postDTO") PostDTO pdto,
			@RequestParam("post_id") String post_id,			
			RedirectAttributes rttr) throws Exception {
		
			psvc.updatePost(pdto);

		//return "redirect:/post/postContent?post_id="+post_id;
		return "redirect:/post/homeList";
	}
	
	@RequestMapping(value = "/postContent", method = RequestMethod.GET)
	   public void read(@RequestParam("post_id") int post_id, Model model,
	         @RequestParam(value="user_id", required=false) String user_id,
	         @RequestParam(value="blog_id", required = false) Integer blogid,
	        // @RequestParam(value="category_id", required = false) Integer category_id,
	         HttpServletRequest request) throws Exception {
	      
	      HttpSession session = request.getSession();
	      session.getAttribute("udto");
	      
	      //System.out.println(category_id);

	      String sessionId = (String)session.getAttribute("user_id");
	      
	      if(user_id != null) {
	       		model.addAttribute("user_id", user_id);
//	         	model.addAttribute("category_list", csvc.CategoryList(user_id));
	      }else {
	    	  	model.addAttribute("user_id", sessionId);
//		    	model.addAttribute("category_list", csvc.CategoryList(sessionId));
	      }
		  
	      // sidebar - member
	      model.addAttribute("bloglist", pfsvc.list());
	      
	      model.addAttribute("postDTO", psvc.getPostContent(post_id));
	      model.addAttribute("replyDTO", new ReplyDTO());
	      model.addAttribute("replyList", psvc.getReplyList(post_id));
	      
	   }
	
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(@RequestParam("post_id") int post_id,
			@RequestParam("mode") String mode, Model model, HttpSession session) throws Exception{
		
		String user_id = (String)session.getAttribute("user_id");
		model.addAttribute("postContent", psvc.getPostContent(post_id));
		model.addAttribute("mode", mode);
		model.addAttribute("postDTO", new PostDTO());
		model.addAttribute("CategoryList", csvc.CategoryList(user_id));
		return "post/postEdit";
	}
	
	@RequestMapping(value = "/deletePost", method = RequestMethod.GET)
	public String deletePost(RedirectAttributes rttr, @RequestParam("post_id") int post_id,
			@RequestParam(required = false) Integer category_id) 
			throws Exception {
		psvc.deletePost(post_id);

		if(category_id == null) {
			return "redirect:/post/homeList";
		}
		return "redirect:/post/getList?category_id="+category_id;
	}
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		logger.info("post CKEditor img upload");
		System.out.println("post CkEditor ck upload");
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();  // out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");

			printWriter.flush();

		} catch (IOException e) { e.printStackTrace();
		} finally {
			try {
				if(out != null) { out.close(); }
				if(printWriter != null) { printWriter.close(); }
			} catch(IOException e) { e.printStackTrace(); }
		}

		return; 
	}
	


}
