package com.ReachRich.service.BS;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.mapper.BM.boardMapper;

@Service
public class boardServiceImpl implements boardService {
	private static final Logger log = LoggerFactory.getLogger(boardService.class);
	
	@Autowired
	private boardMapper mapper;
	
	@Override
	public int BoardCount() {
		log.info("count.service..");
		return mapper.BoardCount();
	}

}
