package com.ReachRich.service;

import javax.servlet.http.HttpServletRequest;

import com.ReachRich.domain.*;

public interface ReachRichService {
	public int userIdCheck(String id);
	
	public int NewUser(UserDTO dto, HttpServletRequest request);
	
}
