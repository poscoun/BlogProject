package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import com.gblog.dao.PostDAO;
import com.gblog.dto.PostDTO;

public class PostSeriveImpl implements PostService{

	@Inject
	private PostDAO pdao;
	
	@Override
	public List<PostDTO> getPostList() throws Exception {
		return pdao.list();
	}

}
