package com.gblog.dao;

import com.gblog.dto.PostsDTO;

public interface PostsDAO {
	public void insertPost(PostsDTO pdto) throws Exception;
	
	public PostsDTO read(Integer pid) throws Exception;
	
}
