package com.gblog.service;

import java.util.List;

import com.gblog.dto.PostDTO;

public interface PostService {
	
	public List<PostDTO> getPostList() throws Exception;

}
