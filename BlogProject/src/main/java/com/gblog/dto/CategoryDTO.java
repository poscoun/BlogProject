package com.gblog.dto;

import lombok.Data;

@Data
public class CategoryDTO {
	private int category_id;
	private int post_id;
	private String category_name;
	private int post_count;
	
}
