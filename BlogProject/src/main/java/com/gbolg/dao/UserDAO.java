package com.gbolg.dao;

import java.util.List;

import com.gbolg.dto.UserDTO;

public interface UserDAO {
	
	public void insertUser(UserDTO udto) throws Exception;
}
