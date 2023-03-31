package com.ReachRich.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ReachRich.domain.userDTO;

@Mapper
public interface userMapper {
	
	public int userIdCheck(String userid);
	
	public int Login(userDTO dto);
}
