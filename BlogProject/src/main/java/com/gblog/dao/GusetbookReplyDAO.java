package com.gblog.dao;

import java.util.List;

import com.gblog.dto.GuestbookReplyDTO;

public interface GusetbookReplyDAO {
	
	public void insert(GuestbookReplyDTO gdto) throws Exception;
	
	public List<GuestbookReplyDTO> listreply(Integer guest_id) throws Exception;

}
