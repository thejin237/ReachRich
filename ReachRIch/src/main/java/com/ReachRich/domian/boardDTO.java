package com.ReachRich.domian;

import lombok.Data;

@Data
public class boardDTO {
	private int stock_idx;
	private String stock_sector;
	private String stock_name;
	private int suggestion;
	private int readcnt;
	private String user_name;
	private String content;
	private String image;
	private String regdate;
}
