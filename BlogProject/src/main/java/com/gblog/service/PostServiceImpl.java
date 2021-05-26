package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.common.Pagination;
import com.gblog.common.Search;
import com.gblog.dao.PostDAO;
import com.gblog.dto.PostDTO;
import com.gblog.dto.ReplyDTO;

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

	@Override
	public void updatePost(PostDTO pdto) throws Exception {
		// TODO Auto-generated method stub
		pdao.update(pdto);
	}

	@Override
	public void deletePost(int post_id) throws Exception {
		// TODO Auto-generated method stub
		pdao.delete(post_id);
	}

	@Override
	public int getPostListCnt(Search sh) throws Exception {
		// TODO Auto-generated method stub
		return pdao.getPostListCnt(sh);
	}

	@Override
	public List<PostDTO> getPostList(Search pgn) throws Exception {
		// TODO Auto-generated method stub
		return pdao.list(pgn);
	}

	@Override
	public List<ReplyDTO> getReplyList(int post_id) throws Exception {
		// TODO Auto-generated method stub
		return pdao.replyList(post_id);
	}

	@Override
	public int insertReply(ReplyDTO rdto) throws Exception {
		// TODO Auto-generated method stub
		return pdao.insertReply(rdto);
	}

	@Override
	public int updateReply(ReplyDTO rdto) throws Exception {
		// TODO Auto-generated method stub
		return pdao.updateReply(rdto);
	}

	@Override
	public int deleteReply(int rp_id) throws Exception {
		// TODO Auto-generated method stub
		return pdao.deleteReply(rp_id);
	}

}
