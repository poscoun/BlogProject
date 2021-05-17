package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.PostDAO;
import com.gblog.dto.PostDTO;

@Service
public class PostServiceImpl implements PostService{

	@Inject
	private PostDAO pdao;
	
	@Override
	public List<PostDTO> getPostList() throws Exception {
		return pdao.list();
	}

	@Override
	public void insertPost(PostDTO pdto) throws Exception {
		// TODO Auto-generated method stub
		pdao.insertPost(pdto);
	}

	@Override
	public PostDTO getPostContent(int post_id) throws Exception {
		// TODO Auto-generated method stub
		return pdao.read(post_id);
	}

}
