package com.gblog.service;

import com.gblog.dto.UserDTO;

public interface UserService {
	
	public void insertUser(UserDTO udto) throws Exception;
	
	public int idcheck(UserDTO udto) throws Exception;	

}
