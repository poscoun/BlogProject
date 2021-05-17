package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.PostDTO;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Inject 
	private SqlSession sqlSession;

	@Override
	public void insertPost(PostDTO pdto) throws Exception {
		sqlSession.insert("insert", pdto);
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

}
