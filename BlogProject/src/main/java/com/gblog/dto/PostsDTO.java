package com.gblog.dto;

import java.util.Date;

public class PostsDTO {
	private int post_id;
	private String post_subj;
	private String post_content;
	private Date post_reg;
	private String user_id;
	
	public PostsDTO(int post_id, String post_subj, String post_content, Date post_reg, String user_id) {
		super();
		this.post_id = post_id;
		this.post_subj = post_subj;
		this.post_content = post_content;
		this.post_reg = post_reg;
		this.user_id = user_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getPost_subj() {
		return post_subj;
	}

	public void setPost_subj(String post_subj) {
		this.post_subj = post_subj;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public Date getPost_reg() {
		return post_reg;
	}

	public void setPost_reg(Date post_reg) {
		this.post_reg = post_reg;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
