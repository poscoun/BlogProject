package com.gblog.dao;

import java.util.List;

import com.gblog.dto.GuestbookDTO;

public interface GuestbookDAO {
	
	public void insert(GuestbookDTO gdto) throws Exception;
	public GuestbookDTO read(Integer guest_id) throws Exception;
	public List<GuestbookDTO> list(Integer blog_id) throws Exception;
	public void update(GuestbookDTO gdto) throws Exception;
	public void delete(Integer guest_id) throws Exception;
	public void updateReplyCount(Integer guest_id) throws Exception;

}
