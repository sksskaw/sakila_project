package com.gd.sakila.vo;

import lombok.Data;

@Data
public class PageParam {
	private int beginRow;
	private int rowPerPage;
	private String searchWord;
	private String category;
}