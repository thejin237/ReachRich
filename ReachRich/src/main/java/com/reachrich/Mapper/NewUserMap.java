package com.reachrich.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.reachrich.domain.UserDTO;

@Mapper
public interface NewUserMap {
	public int userIdCheck(String userid);
	
	public int NewUser(UserDTO dto);
}
