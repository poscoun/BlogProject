package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.GuestbookDAO;
import com.gblog.dao.GusetbookReplyDAO;
import com.gblog.dto.GuestbookDTO;
import com.gblog.dto.GuestbookReplyDTO;

@Service
public class GuestbookServiceImple implements GuestbookService{
	
	@Inject
	private GuestbookDAO gdao;
	private GusetbookReplyDAO grdao;

	@Override
	public void write(GuestbookDTO gdto) throws Exception {
		// TODO Auto-generated method stub
		gdao.insert(gdto);
		
	}

	@Override
	public List<GuestbookDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return gdao.list();
	}

	@Override
	public void modify(GuestbookDTO gdto) throws Exception {
		// TODO Auto-generated method stub
		gdao.update(gdto);
		
	}

	@Override
	public void remove(Integer guest_id) throws Exception {
		// TODO Auto-generated method stub
		gdao.delete(guest_id);
	}

	@Override
	public GuestbookDTO read(Integer guest_id) throws Exception {
		// TODO Auto-generated method stub
		return gdao.read(guest_id);
	}

	@Override
	public void writeReply(GuestbookReplyDTO grdto) throws Exception {
		// TODO Auto-generated method stub
		grdao.insert(grdto);
	}

	@Override
	public List<GuestbookReplyDTO> listReply(Integer guest_id) throws Exception {
		// TODO Auto-generated method stub
		return grdao.list(guest_id);
	}
	

}
