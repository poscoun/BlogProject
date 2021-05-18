package com.gblog.dao;



import com.gblog.dto.UserDTO;

public interface UserDAO {
	
	public void insertUser(UserDTO udto) throws Exception;
	
	public int idcheck(UserDTO udto) throws Exception;
	
	public UserDTO login(UserDTO udto) throws Exception;

		
}
