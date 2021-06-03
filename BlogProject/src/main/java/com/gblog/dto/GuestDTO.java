package com.gblog.dto;

import java.util.Date;

public class GuestDTO {
	
	private Date guest_vis_date;
	private Integer blog_id;
	
	public GuestDTO() {}

	public Date getGuest_vis_date() {
		return guest_vis_date;
	}

	public void setGuest_vis_date(Date guest_vis_date) {
		this.guest_vis_date = guest_vis_date;
	}

	public Integer getBlog_id() {
		return blog_id;
	}

	public void setBlog_id(Integer blog_id) {
		this.blog_id = blog_id;
	}
	
}
