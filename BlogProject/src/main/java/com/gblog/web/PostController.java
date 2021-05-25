package com.gblog.web;

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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gblog.common.Pagination;
import com.gblog.common.Search;
import com.gblog.dto.PostDTO;
import com.gblog.dto.ReplyDTO;
import com.gblog.service.PostService;

@Controller
@RequestMapping("/post/*")
public class PostController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Inject
	private PostService psvc;
	
	@Resource(name="uploadPath")
    private String uploadPath;
	
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	public String getList(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search
			) throws Exception {
		
		logger.info("list 출력");
		
		//검색
		model.addAttribute("search", search);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = psvc.getPostListCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		// Pagination 객체 생성
		//Pagination pgn = new Pagination();
		//pgn.pageInfo(page, range, listCnt);
		
		// 페이징
		model.addAttribute("pagination", search);
		//게시글 화면 출력
		model.addAttribute("list", psvc.getPostList(search));
		
		return "post/getList";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search
			) throws Exception {
		
		logger.info("list 출력");
		
		//검색
		model.addAttribute("search", search);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = psvc.getPostListCnt(search);
		
		search.pageInfo(page, range, listCnt);
		
		// Pagination 객체 생성
		//Pagination pgn = new Pagination();
		//pgn.pageInfo(page, range, listCnt);
		
		// 페이징
		model.addAttribute("pagination", search);
		//게시글 화면 출력
		model.addAttribute("list", psvc.getPostList(search));
		
		return "post/list";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/replyList", method = RequestMethod.POST)
//	public List<ReplyDTO> replyList(@RequestParam("post_id") int post_id, Model model) 
//			throws Exception{
//		logger.info("...replylist post...");
//		model.addAttribute("reList", psvc.getReplyList(post_id));
//		return psvc.getReplyList(post_id);
//	}

	@RequestMapping(value = "/postForm", method = RequestMethod.GET)
	public String postFormGet(PostDTO pdto, Model model) throws Exception{
		logger.info("...write get...");
		return "post/postForm";
	}
	
	@RequestMapping(value = "/savePost", method = RequestMethod.POST)
	public String savePost(@ModelAttribute("postDTO") PostDTO pdto,
			@RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception {
		
		if(mode.equals("edit")) {
			psvc.updatePost(pdto);
		}else {
			psvc.insertPost(pdto);
		}
		
		return "redirect:/post/list";
	}
	
	@RequestMapping(value = "/postContent", method = RequestMethod.GET)
	public void read(@RequestParam("post_id") int post_id, Model model) throws Exception {
		
		model.addAttribute("postDTO", psvc.getPostContent(post_id));
		model.addAttribute("replyDTO", new ReplyDTO());
		// key(name)을 사용하지 않을 경우 자동으로 클래스명을 소문자로 인식해서 지정해줌
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(@RequestParam("post_id") int post_id,
			@RequestParam("mode") String mode, Model model) throws Exception{
		
		model.addAttribute("postContent", psvc.getPostContent(post_id));
		model.addAttribute("mode", mode);
		model.addAttribute("postDTO", new PostDTO());
		return "post/postForm";
	}
	
	@RequestMapping(value = "/deletePost", method = RequestMethod.GET)
	public String deletePost(RedirectAttributes rttr, @RequestParam("post_id") int post_id) 
			throws Exception {
		psvc.deletePost(post_id);
		return "redirect:/post/list";
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
