package com.ReachRich.service;

import com.ReachRich.domain.userDTO;

public interface userService {
	
	public int userIdCheck(String userid);
	
	public int Login(userDTO dto);
}
