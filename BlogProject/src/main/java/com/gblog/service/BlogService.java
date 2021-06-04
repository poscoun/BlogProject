package com.gblog.service;

import java.util.List;

import com.gblog.dto.BlogDTO;

public interface BlogService {
	
	public void blogInsert(BlogDTO bdto) throws Exception;
	
	public int blogSelect(String user_id) throws Exception;
	
	public List<BlogDTO> blogList() throws Exception;

}
