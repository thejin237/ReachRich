package com.ReachRich.serviceTest;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ReachRich.service.BS.boardService;



@SpringBootTest
public class BoardServiceTest {
	private static final Logger log = 
			LoggerFactory.getLogger(BoardServiceTest.class);
	
	@Autowired
	private boardService service;
	
	@Test
	public void boardCountTest() {
		log.info("Service total count : " + service.boardCount());
	}
}
