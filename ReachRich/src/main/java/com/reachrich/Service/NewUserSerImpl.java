package com.reachrich.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reachrich.Mapper.NewUserMap;
import com.reachrich.domain.UserDTO;

@Service
public class NewUserSerImpl implements NewUserSer {
	
	@Autowired
	private NewUserMap map;
	
	public int userIdCheck(String userid) {
		return map.userIdCheck(userid);
	}

	public int NewUser(UserDTO dto, HttpServletRequest request) {
		dto.setUser_email(request.getParameter("email1") + "@" + request.getParameter("email2"));
		return map.NewUser(dto);
	}
	
	@Override
	public List<UserDTO> TestList(String key) {
		return map.TestList(key);
	}
	
	@Override
	public List<UserDTO> TestList2(String key, String subkey) {
		return map.TestList2(key, subkey);
	}
	
	@Override
	public int Login(UserDTO dto) {
		return map.Login(dto);
	}
}
