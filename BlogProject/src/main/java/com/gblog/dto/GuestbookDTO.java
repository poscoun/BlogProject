package com.gblog.dto;

import java.util.Date;

public class GuestbookDTO {
	private Integer guest_id;
	private String user_id;
	private String guest_content;
	private Date guest_date;
	public Integer getReply_count() {
		return reply_count;
	}

	public void setReply_count(Integer reply_count) {
		this.reply_count = reply_count;
	}

	private Integer reply_count;
	
	public GuestbookDTO() {}

	public Integer getGuest_id() {
		return guest_id;
	}

	public void setGuest_id(Integer guest_id) {
		this.guest_id = guest_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGuest_content() {
		return guest_content;
	}

	public void setGuest_content(String guest_content) {
		this.guest_content = guest_content;
	}

	public Date getGuest_date() {
		return guest_date;
	}

	public void setGuest_date(Date guest_date) {
		this.guest_date = guest_date;
	}


}
