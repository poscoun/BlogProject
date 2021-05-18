package com.gblog.service;

import java.util.List;

import com.gblog.dto.GuestbookDTO;

public interface GuestbookService {
	
	public void write(GuestbookDTO gdto) throws Exception;
	public GuestbookDTO read(Integer guest_id) throws Exception;
	public List<GuestbookDTO> list() throws Exception;
	public void modify(GuestbookDTO gdto) throws Exception;
	public void remove(Integer guest_id) throws Exception;

}
