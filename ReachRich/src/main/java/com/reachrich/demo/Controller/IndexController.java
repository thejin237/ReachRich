package com.reachrich.demo.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	private static final Logger log = 
			LoggerFactory.getLogger(ReachrichController.class);

	@RequestMapping(value="/index")
	public String indexdo() {
		return "/index";
	}
}
