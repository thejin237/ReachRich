package com.ReachRich.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.mapper.ReachRichMapper;
import com.ReachRich.util.UserSHA256;
import com.ReachRich.domain.*;

@Service
<<<<<<< HEAD:ReachRich/src/main/java/com/ReachRich/service/ReachRichServicelmpl.java
public class ReachRichServicelmpl {
	
=======
public class ReachRichServiceImpl {
>>>>>>> e5e04fb4bd267a0f9cc829e7e79cf58eff7c3342:ReachRich/src/main/java/com/ReachRich/service/ReachRichServiceImpl.java
	@Autowired
	private ReachRichMapper mapper;
	
	public int userIdCheck(String id) {
		return mapper.userIdCheck(id);
	}

	public int NewUser(UserDTO dto, HttpServletRequest request) {
		dto.setUser_id(request.getParameter("user_id"));
		dto.setUser_pass(UserSHA256.getSHA256(request.getParameter("user_pass")));
		dto.setUser_name(request.getParameter("user_name"));
		dto.setUser_birth(request.getParameter("yy")+request.getParameter("mm")+request.getParameter("dd"));
		dto.setUser_gender(request.getParameter("user_gender"));
		dto.setUser_email(request.getParameter("user_email"));
		dto.setUser_phone(request.getParameter("user_phone"));
		
		return mapper.NewUser(dto);
	}
	
}
