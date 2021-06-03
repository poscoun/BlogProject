package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.GuestDAO;
import com.gblog.dao.GuestbookDAO;
import com.gblog.dao.GusetbookReplyDAO;
import com.gblog.dto.GuestDTO;
import com.gblog.dto.GuestbookDTO;
import com.gblog.dto.GuestbookReplyDTO;

@Service
public class GuestbookServiceImple implements GuestbookService{
	
	@Inject
	private GuestbookDAO gdao;
	
	@Inject
	private GusetbookReplyDAO grdao;
	
	@Inject
	private GuestDAO gvdao;

	@Override
	public void write(GuestbookDTO gdto) throws Exception {
		// TODO Auto-generated method stub
		gdao.insert(gdto);
		
	}

	@Override
	public List<GuestbookDTO> list(Integer blog_id) throws Exception {
		// TODO Auto-generated method stub
		return gdao.list(blog_id);
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
		// System.out.println(guest_id);
		return grdao.listreply(guest_id);
	}

	@Override
	public void replyCount(Integer guest_id) throws Exception {
		// TODO Auto-generated method stub
		gdao.updateReplyCount(guest_id);
	}

	@Override
	public void insertdate(GuestDTO gvdto) throws Exception {
		// TODO Auto-generated method stub
		gvdao.insert(gvdto);
	}

	@Override
	public int visitTotal(Integer blog_id) throws Exception {
		// TODO Auto-generated method stub
		return gvdao.visitTotal(blog_id);
	}

	@Override
	public int visitToday(Integer blog_id) throws Exception {
		// TODO Auto-generated method stub
		return gvdao.visitToday(blog_id);
	}

}
