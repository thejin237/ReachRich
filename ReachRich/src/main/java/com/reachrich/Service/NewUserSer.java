package com.reachrich.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.reachrich.domain.UserDTO;

public interface NewUserSer {
	public int userIdCheck(String userid);
	
	public int NewUser(UserDTO dto, HttpServletRequest request);
	
	public List<UserDTO> TestList(String key);

	public List<UserDTO> TestList2(String key, String subkey);
	
	public int Login(UserDTO dto);
}
