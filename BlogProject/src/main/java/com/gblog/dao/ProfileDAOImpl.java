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
	public void insertProfile(ProfileDTO pdto) throws Exception {
		sqlSession.insert("insertProfile", pdto);

	}

	@Override
	public ProfileDTO readProfile(String user_id) throws Exception {
		return sqlSession.selectOne("readProfile", user_id);
	}

	@Override
	public void updateProfile(ProfileDTO pdto) throws Exception {
		sqlSession.update("updateProfile", pdto);
	}

	@Override
	public void deleteProfile(String user_id) throws Exception {
		sqlSession.delete("deleteProfile", user_id);
	}

	@Override
	public List<ProfileDTO> listProfile() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("listProfile");
	}

}
