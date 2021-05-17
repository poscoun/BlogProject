package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.ProfileDTO;

@Repository
public class ProfileDAOImpl implements ProfileDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(ProfileDTO pdto) throws Exception {
		sqlSession.insert("insert", pdto);

	}

	@Override
	public ProfileDTO read(String user_id) throws Exception {
		return sqlSession.selectOne("read", user_id);
	}

	@Override
	public void update(ProfileDTO pdto) throws Exception {
		sqlSession.update("update", pdto);
	}

	@Override
	public void delete(String user_id) throws Exception {
		sqlSession.delete("delete", user_id);
	}

	@Override
	public List<ProfileDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("list");
	}

}
