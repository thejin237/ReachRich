package com.ReachRich.mapper;

import org.apache.ibatis.annotations.Mapper;  

import com.ReachRich.domain.*;


@Mapper
public interface ReachRichMapper {
	public int userIdCheck(String id);
	
	public int NewUser(UserDTO dto);
	
	public String login(String id);
	
	public UserDTO loginselect(String id);
}	
