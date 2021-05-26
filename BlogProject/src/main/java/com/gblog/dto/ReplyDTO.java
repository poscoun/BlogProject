package com.gblog.dto;

import java.util.Date;

public class ReplyDTO {
	private int rp_id;
	private String rp_writer;
	private String rp_content;
	private Date rp_reg;
	private int post_id;
	
	public ReplyDTO() {
	}
	
	public ReplyDTO(int rp_id, String rp_writer, String rp_content, Date rp_reg, int post_id) {
		super();
		this.rp_id = rp_id;
		this.rp_writer = rp_writer;
		this.rp_content = rp_content;
		this.rp_reg = rp_reg;
		this.post_id = post_id;
	}

	public int getRp_id() {
		return rp_id;
	}

	public void setRp_id(int rp_id) {
		this.rp_id = rp_id;
	}

	public String getRp_writer() {
		return rp_writer;
	}

	public void setRp_writer(String rp_writer) {
		this.rp_writer = rp_writer;
	}

	public String getRp_content() {
		return rp_content;
	}

	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}

	public Date getRp_reg() {
		return rp_reg;
	}

	public void setRp_reg(Date rp_reg) {
		this.rp_reg = rp_reg;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
		
}
