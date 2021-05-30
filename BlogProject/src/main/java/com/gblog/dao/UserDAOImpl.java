package com.gblog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gblog.dto.UserDTO;


@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;
	//회원가입
	@Override
	public void insertUser(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("insertUser", udto);
		
	}
	//아이디 중복확인
	@Override
	public int idcheck(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("idcheck",udto);
	}
	@Override
	public UserDTO login(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login",udto);
	}
	@Override
	public UserDTO idselect(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("idselect", udto);
	}
	@Override
	public UserDTO pwselect(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("pwselect", udto);
	}
	@Override
	public void modify(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		 sqlSession.update("modify", udto);
    }
	
	@Override
	public UserDTO information(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("information",user_id);
	}
	@Override
	public void userupdate(UserDTO udto) throws Exception {
		sqlSession.update("userupdate", udto);
		
	}
	@Override
	public void userdelete(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("userdelete", udto);
		
	}
}
