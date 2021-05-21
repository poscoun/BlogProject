package com.gblog.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gblog.dto.ReplyDTO;
import com.gblog.service.PostService;

@RestController
@RequestMapping(value = "/restPost/*")
public class RestPostController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Inject
	private PostService psvc;
	
	@RequestMapping(value = "/replyList", method = RequestMethod.POST)
	public List<ReplyDTO> replyList(@RequestParam("post_id") int post_id) throws Exception{
		return psvc.getReplyList(post_id);
	}
	
	@RequestMapping(value = "/saveReply", method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody ReplyDTO rdto) throws Exception{
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			psvc.insertReply(rdto);
			result.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	@RequestMapping(value = "/updateReply", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> updateReply(@RequestBody ReplyDTO rdto) throws Exception {

		Map<String, Object> result = new HashMap<>();
		try {
			psvc.updateReply(rdto);
			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
	
	@RequestMapping(value = "/deleteReply", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> deleteReply(@RequestParam("rp_id") int rp_id) throws Exception {

		Map<String, Object> result = new HashMap<>();
		try {
			psvc.deleteReply(rp_id);
			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}

}
