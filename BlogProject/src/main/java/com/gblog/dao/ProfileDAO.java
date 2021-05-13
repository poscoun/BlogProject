package com.gblog.dao;

import com.gblog.dto.ProfileDTO;

public interface ProfileDAO {
	public void insert(ProfileDTO pdto) throws Exception;
	
	public ProfileDTO read(String user_id) throws Exception;
	
	public void update(ProfileDTO pdto) throws Exception;
	
}
