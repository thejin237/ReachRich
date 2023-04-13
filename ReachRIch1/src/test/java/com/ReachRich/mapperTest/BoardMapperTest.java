package com.ReachRich.mapperTest;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ReachRich.mapper.boardMapper;



@SpringBootTest
public class BoardMapperTest {
	private static final Logger log = 
			LoggerFactory.getLogger(BoardMapperTest.class);
	
	@Autowired
	private boardMapper mapper;
	
	@Test
	public void boardCountTest() {
		log.info("Total Count : " + mapper.boardCount());
	}
}
