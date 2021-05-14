package com.gblog.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.PostsDTO;

@Repository
public class PostsDAOImpl implements PostsDAO {
	
	@Inject 
	private SqlSession sqlSession;

	@Override
	public void insertPost(PostsDTO pdto) throws Exception {
		sqlSession.insert("insert", pdto);
	}

	@Override
	public PostsDTO read(Integer pid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
