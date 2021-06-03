package com.gblog.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gblog.dto.GuestDTO;
import com.gblog.dto.GuestbookDTO;
import com.gblog.dto.GuestbookReplyDTO;

public interface GuestbookService {
	
	public void write(GuestbookDTO gdto) throws Exception;
	public GuestbookDTO read(Integer guest_id) throws Exception;
	public List<GuestbookDTO> list(Integer blog_id) throws Exception;
	public void modify(GuestbookDTO gdto) throws Exception;
	public void remove(Integer guest_id) throws Exception;
	public void replyCount(Integer guest_id) throws Exception;
	
	public void writeReply(GuestbookReplyDTO grdto) throws Exception;
	public List<GuestbookReplyDTO> listReply(Integer guest_id) throws Exception;
	
	public void insertdate(GuestDTO gvdto) throws Exception;
	public int visitTotal(Integer blog_id) throws Exception;
	public int visitToday(Integer blog_id) throws Exception;

}
