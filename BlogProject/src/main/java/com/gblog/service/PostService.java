package com.gblog.service;

import java.util.List;

import com.gblog.common.Pagination;
import com.gblog.dto.PostDTO;

public interface PostService {
	
	public List<PostDTO> getPostList() throws Exception;
	
	public PostDTO getPostContent(int post_id) throws Exception;
	
	public void insertPost(PostDTO pdto) throws Exception;
	
	public void updatePost(PostDTO pdto) throws Exception;
	
	public void deletePost(int post_id) throws Exception;
	
	// 총 게시글 개수 확인
	public int getPostListCnt() throws Exception;
	
	public List<PostDTO> getPostList(Pagination pgn) throws Exception;

}
