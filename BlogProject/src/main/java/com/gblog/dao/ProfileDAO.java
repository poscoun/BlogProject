package com.gblog.dao;

import java.util.List;

import com.gblog.dto.ProfileDTO;

public interface ProfileDAO {
	public void insert(ProfileDTO pdto) throws Exception;
	
	public ProfileDTO read(String user_id) throws Exception;
	
	public void update(ProfileDTO pdto) throws Exception;
	
	public void delete(String user_id) throws Exception;
	
	public List<ProfileDTO> list() throws Exception;
}
