package com.reachrich.Mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NewUserMap {
	public int userIdCheck(String userid);
}
