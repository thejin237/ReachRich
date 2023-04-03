package com.ReachRich.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ReachRich.domain.UserDTO;

@Mapper
public interface UserMapper {
	
	public int userIdCheck(String userid);
	
	public int Login(UserDTO dto);
}
