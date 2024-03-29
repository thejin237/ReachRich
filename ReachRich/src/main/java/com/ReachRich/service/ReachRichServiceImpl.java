package com.ReachRich.service;

import javax.servlet.http.HttpServletRequest;   

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.mapper.ReachRichMapper;
import com.ReachRich.util.UserSHA256;
import com.ReachRich.controller.ReachRichController;
import com.ReachRich.domain.*;

@Service
public class ReachRichServiceImpl {
	private static final Logger log = 
			LoggerFactory.getLogger(ReachRichServiceImpl.class);
	
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
	public int login(HttpServletRequest request) {
		String id=request.getParameter("user_id");
		String passwd = mapper.login(id);
		String pass=UserSHA256.getSHA256(request.getParameter("user_pass"));
		int row = 0;
		if(passwd.equals(pass)) {
			row =1;
		}
		return row;
	}
	public UserDTO loginselect(HttpServletRequest request) {
		String id=request.getParameter("user_id");
		UserDTO dto = mapper.loginselect(id);
		
		return dto;
	}
<<<<<<< HEAD
=======
	public int expassCheck(HttpServletRequest request) {
		String id=request.getParameter("user_id");
		String passwd = mapper.login(id);
		log.info("왜 안돼.............");
		String pass=UserSHA256.getSHA256(request.getParameter("existing_password"));
		int row = 0;
		if(passwd.equals(pass)) {
			row =1;
		}
		return row;
	}
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
	
}
