package com.gblog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gblog.dao.GuestbookDAO;
import com.gblog.dto.GuestbookDTO;

@Service
public class GuestbookServiceImple implements GuestbookService{
	
	@Inject
	private GuestbookDAO gdao;

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

}
