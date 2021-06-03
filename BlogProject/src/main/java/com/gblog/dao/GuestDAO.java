package com.gblog.dao;

import com.gblog.dto.GuestDTO;

public interface GuestDAO {
	
	public void insert(GuestDTO gdto) throws Exception;
	
	public int visitTotal(Integer blog_id) throws Exception;
	
	public int visitToday(Integer blog_id) throws Exception;

}
