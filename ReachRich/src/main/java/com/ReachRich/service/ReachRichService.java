package com.ReachRich.service;

import javax.servlet.http.HttpServletRequest;  

import com.ReachRich.domain.*;

public interface ReachRichService {
	
	public int userIdCheck(String id);
	
	public int NewUser(UserDTO dto, HttpServletRequest request);
	
	public int login( HttpServletRequest request);
	
	public UserDTO loginselect(HttpServletRequest request);
	
<<<<<<< HEAD
=======
	public int expassCheck(HttpServletRequest request);
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
}
