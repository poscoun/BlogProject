package com.gblog.dao;

import java.util.List;

import com.gblog.common.Pagination;
import com.gblog.dto.PostDTO;

public interface PostDAO {
	public int insertPost(PostDTO pdto) throws Exception;
	
	public PostDTO read(Integer post_id) throws Exception;
	
	public List<PostDTO> list() throws Exception;
	
	public void update(PostDTO pdto) throws Exception;
	
	public void delete(Integer post_id) throws Exception;
	
	// paging
	// 총 게시글 개수 확인
	public int getPostListCnt() throws Exception;
	
	public List<PostDTO> list(Pagination pgn) throws Exception;
	
}
