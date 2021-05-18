package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.common.Pagination;
import com.gblog.dto.PostDTO;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Inject 
	private SqlSession sqlSession;

	@Override
	public int insertPost(PostDTO pdto) throws Exception {
		return sqlSession.insert("insert", pdto);
	}

	@Override
	public PostDTO read(Integer post_id) throws Exception {
		return sqlSession.selectOne("read", post_id);
	}

	@Override
	public List<PostDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("list");
	}

	@Override
	public void update(PostDTO pdto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("update", pdto);
	}

	@Override
	public void delete(Integer post_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("delete", post_id);
	}

	@Override
	public int getPostListCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("listCnt");
	}

	@Override
	public List<PostDTO> list(Pagination pgn) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("pList", pgn);
	}

}
