package com.gblog.dto;

public class BlogDTO {
	private Integer blog_id;
	private String user_id;
	
	public BlogDTO() {}

	public Integer getBlog_id() {
		return blog_id;
	}

	public void setBlog_id(Integer blog_id) {
		this.blog_id = blog_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
