package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.common.Pagination;
import com.gblog.common.Search;
import com.gblog.dto.PostDTO;
import com.gblog.dto.ReplyDTO;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Inject 
	private SqlSession sqlSession;

	@Override
	public int insertPost(PostDTO pdto) throws Exception {
		return sqlSession.insert("postInsert", pdto);
	}

	@Override
	public PostDTO read(Integer post_id) throws Exception {
		return sqlSession.selectOne("postRead", post_id);
	}

	@Override
	public List<PostDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("list");
	}

	@Override
	public void update(PostDTO pdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("postUpdate", pdto);
	}

	@Override
	public void delete(Integer post_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("postDelete", post_id);
	}

	@Override
	public int getPostListCnt(Search sh) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("listCnt", sh);
	}

	@Override
	public List<PostDTO> list(Search pgn) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("postList", pgn);
	}

	@Override
	public List<ReplyDTO> replyList(int post_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("replyList", post_id);
	}

	@Override
	public int insertReply(ReplyDTO rdto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("replyInsert", rdto);
	}

	@Override
	public int updateReply(ReplyDTO rdto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("replyUpdate", rdto);
	}

	@Override
	public int deleteReply(int rp_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("replyDelete", rp_id);
	}

}
