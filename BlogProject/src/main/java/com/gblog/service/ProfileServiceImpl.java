package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.ProfileDAO;
import com.gblog.dto.ProfileDTO;

@Service
public class ProfileServiceImpl implements ProfileService {
	
	@Inject
	private ProfileDAO pdao;

	@Override
	public void write(ProfileDTO pdto) throws Exception {
		// TODO Auto-generated method stub
		pdao.insert(pdto);
	}

	@Override
	public ProfileDTO read(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return pdao.read(user_id);
	}

	@Override
	public void modify(ProfileDTO pdto) throws Exception {
		// TODO Auto-generated method stub
		pdao.update(pdto);
	}

	@Override
	public void remove(String user_id) throws Exception {
		// TODO Auto-generated method stub
		pdao.delete(user_id);
	}

	@Override
	public List<ProfileDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return pdao.list();
	}

}
