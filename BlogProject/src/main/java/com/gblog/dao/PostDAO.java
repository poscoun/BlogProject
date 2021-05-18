package com.gblog.dao;

import java.util.List;

import com.gblog.dto.PostDTO;

public interface PostDAO {
	public void insertPost(PostDTO pdto) throws Exception;
	
	public PostDTO read(Integer post_id) throws Exception;
	
	public List<PostDTO> list() throws Exception;
	
	public void update(PostDTO pdto) throws Exception;
	
	public void delete(Integer post_id) throws Exception;
	
}
