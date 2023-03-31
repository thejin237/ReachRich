package com.ReachRich.controller;

import java.util.concurrent.ScheduledExecutorService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ReachRich.mapper.BM.boardMapper;
import Method.News;

@Controller
@RequestMapping("Stock")
public class sController {
	private static final Logger log = LoggerFactory.getLogger(sController.class);
	
	@Autowired
	private boardMapper mapper;
	
	@GetMapping("news")
	public void news() {
		News news = new News();
		//ScheduledExecutorService sq = news.news();
		//return news;
	}
}
