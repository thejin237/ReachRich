package com.reachrich.domain;

import lombok.Data;

@Data
public class UserDTO {
	private String user_id; 
	private int user_idx;
	private String user_pass;
	private String user_phone1;
	private String user_phone2;
	private String user_phone3;
	private String user_email;
	private String user_grade = "C";
	private int user_wcnt = 0;
	private String interest;
	private String joindate;
}
