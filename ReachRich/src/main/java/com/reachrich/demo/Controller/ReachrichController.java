package com.reachrich.demo.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reachrich.demo.Service.ReachrichServicelmpl;

@Controller
@RequestMapping("Reachrich")
public class ReachrichController {
	private static final Logger log = 
			LoggerFactory.getLogger(ReachrichController.class);

	@Autowired
	private ReachrichServicelmpl service;
	
	@GetMapping("reachrich_login")
	public void reachrichLogin() {
		log.info("ReachRichLogin()..............");
	}
	@GetMapping("reachrich_singin")
	public void reachrichSingin() {
		log.info("ReachRichSingin()..............");
	}
	@GetMapping("reachrich_board")
	public void reachrichBoard() {
		log.info("ReachRichBoard()..............");
	}
}
