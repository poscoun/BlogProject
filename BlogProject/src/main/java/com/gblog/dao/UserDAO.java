package com.gblog.dao;



import java.util.List;

import com.gblog.dto.UserDTO;

public interface UserDAO {
	
	public void insertUser(UserDTO udto) throws Exception;
	
	public int idcheck(UserDTO udto) throws Exception;
	
	public UserDTO login(UserDTO udto) throws Exception;

		
	//아이디 찾기
	public UserDTO idselect(UserDTO udto) throws Exception;
	
	//비번 찾기
	public UserDTO pwselect(UserDTO udto)throws Exception;
	
	//비밀번호 뭐지?? 새로 발급 ㄱㄱ 
	public void modify(UserDTO udto) throws Exception;
	
	//회원정보요
	public UserDTO information(UserDTO udto) throws Exception;
}
