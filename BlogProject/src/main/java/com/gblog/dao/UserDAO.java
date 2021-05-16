package com.gblog.dao;

import java.util.List;

import com.gblog.dto.UserDTO;

public interface UserDAO {
	
	public void insertUser(UserDTO udto) throws Exception;
}
