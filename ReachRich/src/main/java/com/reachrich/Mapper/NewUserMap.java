package com.reachrich.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.reachrich.domain.UserDTO;

@Mapper
public interface NewUserMap {
	public int userIdCheck(String userid);
	
	public int NewUser(UserDTO dto);
	
	public List<UserDTO> TestList(String key);
	
	public List<UserDTO> TestList2(String key, String subkey);
	
	public int Login(UserDTO dto);

	public List<UserDTO> CheckBoxTest(List<String> list);
}
