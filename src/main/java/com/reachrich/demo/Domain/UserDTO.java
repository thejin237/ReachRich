package com.reachrich.demo.Domain;

import lombok.Data;

@Data
public class UserDTO {
	private String id; 
	private int user_idx;
	private String pswd1;
	private String name;
	private String birth;
	private String mobile;
	private String email;
	private String gender;
	private String user_grade = "C";
	private int user_wcnt = 0;
	private String interest;
	private String joindate;
}
