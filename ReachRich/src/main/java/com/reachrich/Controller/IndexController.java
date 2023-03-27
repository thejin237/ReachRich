package com.reachrich.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping(value = "/home")
	public String index() {
		return "home";
	}
	
}
