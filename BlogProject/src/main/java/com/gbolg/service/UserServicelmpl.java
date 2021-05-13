package com.gbolg.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gbolg.dao.UserDAO;
import com.gbolg.dto.UserDTO;



@Service
public class UserServicelmpl implements UserService{

	@Inject
	private UserDAO udao;
	
	@Override
	public void insertUser(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		udao.insertUser(udto);
	
	
		
	}

}
