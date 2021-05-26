package com.gblog.dao;

import java.util.List;

import com.gblog.dto.ProfileDTO;

public interface ProfileDAO {
	public void insertProfile(ProfileDTO pdto) throws Exception;
	
	public ProfileDTO readProfile(String user_id) throws Exception;
	
	public void updateProfile(ProfileDTO pdto) throws Exception;
	
	public void deleteProfile(String user_id) throws Exception;
	
	public List<ProfileDTO> listProfile() throws Exception;
}
