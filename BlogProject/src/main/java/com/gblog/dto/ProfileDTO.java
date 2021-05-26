package com.gblog.dto;

import java.util.Date;

public class ProfileDTO {
	private String user_id;
	private String profile_content;
	private String profile_photo;
	private String profile_sns;
	private String profile_phone;
	private Date profile_date;
	
	public ProfileDTO() {}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProfile_content() {
		return profile_content;
	}

	public void setProfile_content(String profile_content) {
		this.profile_content = profile_content;
	}

	public String getProfile_photo() {
		return profile_photo;
	}

	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}

	public String getProfile_sns() {
		return profile_sns;
	}

	public void setProfile_sns(String profile_sns) {
		this.profile_sns = profile_sns;
	}

	public String getProfile_phone() {
		return profile_phone;
	}

	public void setProfile_phone(String profile_phone) {
		this.profile_phone = profile_phone;
	}

	public Date getProfile_date() {
		return profile_date;
	}

	public void setProfile_date(Date profile_date) {
		this.profile_date = profile_date;
	}
	
	
	
}
