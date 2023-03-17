package com.ReachRich.domain;

import lombok.Data;

@Data
public class commentDTO {
	private int com_idx; 
	private int stock_idx;
	private String user_id;
	private String com_content;
	private int regdate;
}
