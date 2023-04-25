package com.ReachRich.domain;

import lombok.Data;

@Data
public class UserDTO {
	private String user_id;
	private int user_idx;
	private String user_pass;
	private String user_name;
	private String user_birth;
	private String user_phone;
	private String user_email;
	private String user_gender;
	private String user_grade = "C";
	private int user_wcnt = 0;
	private String interest;
	private String joindate;
}
