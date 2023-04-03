package com.reachrich.demo.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reachrich.demo.mapper.ReachrichMapper;
import com.reachrich.demo.util.UserSHA256;
import com.reachrich.demo.Domain.*;

@Service
public class ReachrichServicelmpl {
	@Autowired
	private ReachrichMapper mapper;
	
	public int userIdCheck(String id) {
		return mapper.userIdCheck(id);
	}

	public int NewUser(UserDTO dto, HttpServletRequest request) {
		dto.setId(request.getParameter("id"));
		dto.setPswd1(UserSHA256.getSHA256(request.getParameter("pswd1")));
		dto.setName(request.getParameter("name"));
		dto.setBirth(request.getParameter("yy")+request.getParameter("mm")+request.getParameter("dd"));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		dto.setMobile(request.getParameter("mobile"));
		
		
		
		return mapper.NewUser(dto);
	}
	
}
