package com.reachrich.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.reachrich.demo.Domain.*;

@Mapper
public interface ReachrichMapper {
	public int userIdCheck(String id);
	
	public int NewUser(UserDTO dto);
	
}	
