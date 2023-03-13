package com.reachrich.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reachrich.Mapper.NewUserMap;

@Service
public class NewUserSerImpl implements NewUserSer {
	
	@Autowired
	private NewUserMap map;
	
	public int userIdCheck(String userid) {
		return map.userIdCheck(userid);
	}

}
