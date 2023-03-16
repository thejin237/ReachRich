package com.reachrich.Service;

import javax.servlet.http.HttpServletRequest;

import com.reachrich.domain.UserDTO;

public interface NewUserSer {
	public int userIdCheck(String userid);
	
	public int NewUser(UserDTO dto, HttpServletRequest request);
}
