package com.gblog.service;

import java.util.List;

import com.gblog.dto.UserDTO;

public interface UserService {
	
	public void insertUser(UserDTO udto) throws Exception;
	
	public int idcheck(UserDTO udto) throws Exception;
	
	public UserDTO login(UserDTO udto) throws Exception;
	
	public UserDTO idselect(UserDTO udto) throws Exception;
	
	public UserDTO pwselect(UserDTO udto)throws Exception;
	
	public void modify(UserDTO udto) throws Exception;
}
