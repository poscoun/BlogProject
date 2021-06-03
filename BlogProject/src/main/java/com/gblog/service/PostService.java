package com.gblog.service;

import java.util.List;

import com.gblog.common.Pagination;
import com.gblog.common.Search;
import com.gblog.dto.PostDTO;
import com.gblog.dto.ReplyDTO;

public interface PostService {
	
	public PostDTO getPostContent(int post_id) throws Exception;
	
	public void insertPost(PostDTO pdto) throws Exception;
	
	public void updatePost(PostDTO pdto) throws Exception;
	
	public void deletePost(int post_id) throws Exception;
	
	// 총 게시글 개수 확인
	public int getPostListCnt(Search sh) throws Exception;
	
	public int getPostListCateCnt(Search sh) throws Exception;
	
	public List<PostDTO> getPostList(Search pgn) throws Exception;
	
	public List<PostDTO> getPostCateList(Search pgn) throws Exception;
	
	// 댓글 리스트
	public List<ReplyDTO> getReplyList(int post_id) throws Exception;
	
	public int insertReply(ReplyDTO rdto) throws Exception;
	
	public int updateReply(ReplyDTO rdto) throws Exception;
	
	public int deleteReply(int rp_id) throws Exception;

}
