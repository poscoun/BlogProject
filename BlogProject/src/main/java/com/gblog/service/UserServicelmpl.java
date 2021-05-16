package com.gblog.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.UserDAO;
import com.gblog.dto.UserDTO;



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
