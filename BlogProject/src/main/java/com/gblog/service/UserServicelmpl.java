package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.UserDAO;
import com.gblog.dto.UserDTO;



@Service
public class UserServicelmpl implements UserService{

	@Inject
	private UserDAO udao;
	//회원가입
	@Override
	public void insertUser(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		udao.insertUser(udto);
	
	
		
	}
	@Override
	public int idcheck(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return udao.idcheck(udto);
	}
	@Override
	public UserDTO login(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return udao.login(udto);
	}
	@Override
	public UserDTO idselect(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return udao.idselect(udto);
	}
	@Override
	public UserDTO pwselect(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return udao.pwselect(udto);
	}
	@Override
	public void modify(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		udao.modify(udto);
		
	}
	@Override
	public UserDTO information(UserDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return udao.information(udto);
	}
	
	
	
	
	
	
	
	
	
	

}
