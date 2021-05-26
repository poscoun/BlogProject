package com.gblog.dao;

public interface GuestDAO {
	
	public void insert() throws Exception;
	
	public int visitTotal() throws Exception;
	
	public int visitToday() throws Exception;

}
