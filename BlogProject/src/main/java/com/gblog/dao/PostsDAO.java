package com.gblog.dao;

import com.gblog.dto.PostsDTO;

public interface PostsDAO {
	public int insertPost(PostsDTO postsdto) throws Exception;
}
