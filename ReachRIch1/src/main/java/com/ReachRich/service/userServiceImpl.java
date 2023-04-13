package com.ReachRich.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.domain.userDTO;
import com.ReachRich.mapper.userMapper;

@Service
public class userServiceImpl implements userService {
	private static final Logger log = LoggerFactory.getLogger(userService.class);
	
	@Autowired
	public userMapper mapper;
	
	@Override
	public int userIdCheck(String userid) {
		log.info("IM.userIdCheck log.......");
		return mapper.userIdCheck(userid);
	}
	
	@Override
	public int Login(userDTO dto) {
		log.info("IM.Login log.......");
		return mapper.Login(dto);
	}
}
