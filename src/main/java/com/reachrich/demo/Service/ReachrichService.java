package com.reachrich.demo.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.reachrich.demo.Domain.*;

public interface ReachrichService {
	public int userIdCheck(String id);
	
	public int NewUser(UserDTO dto, HttpServletRequest request);
	
}
