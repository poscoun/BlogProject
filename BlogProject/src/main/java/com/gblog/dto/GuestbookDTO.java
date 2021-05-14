package com.gblog.dto;

import java.util.Date;

public class GuestbookDTO {
	private Integer vis_con_no;
	private String user_id;
	private String vis_content;
	private Date vis_con_date;
	
	public GuestbookDTO() {}

	public Integer getVis_con_no() {
		return vis_con_no;
	}

	public void setVis_con_no(Integer vis_con_no) {
		this.vis_con_no = vis_con_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getVis_content() {
		return vis_content;
	}

	public void setVis_content(String vis_content) {
		this.vis_content = vis_content;
	}

	public Date getVis_con_date() {
		return vis_con_date;
	}

	public void setVis_con_date(Date vis_con_date) {
		this.vis_con_date = vis_con_date;
	}
	
}
