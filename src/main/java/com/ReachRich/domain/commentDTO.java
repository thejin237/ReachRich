package com.ReachRich.domain;

import lombok.Data;

@Data
public class commentDTO {
	private int com_idx; 
	private int stock_idx;
	private String user_id;
	private String com_content;
	private String regdate;
	
	private int com_com_idx;
	private String com_com_content;
}
