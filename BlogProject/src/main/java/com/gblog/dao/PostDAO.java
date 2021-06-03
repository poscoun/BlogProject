package com.gblog.dao;

import java.util.List;

import com.gblog.common.Pagination;
import com.gblog.common.Search;
import com.gblog.dto.PostDTO;
import com.gblog.dto.ReplyDTO;

public interface PostDAO {
	public int insertPost(PostDTO pdto) throws Exception;
	
	public PostDTO read(Integer post_id) throws Exception;
		
	public void update(PostDTO pdto) throws Exception;
	
	public void delete(Integer post_id) throws Exception;
	
	// paging
	// 총 게시글 개수 확인
	public int getPostListCnt(Search sh) throws Exception;
	
	public int getPostListCateCnt(Search sh) throws Exception;
	
	public List<PostDTO> list(Search pgn) throws Exception;
	
	public List<PostDTO> listCatePost(Search pgn) throws Exception;
	
	// 댓글 리스트
	public List<ReplyDTO> replyList(int post_id) throws Exception;
	
	public int insertReply(ReplyDTO rdto) throws Exception;
	
	public int updateReply(ReplyDTO rdto) throws Exception;
	
	public int deleteReply(int rp_id) throws Exception;
	
}
