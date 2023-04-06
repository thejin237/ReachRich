package com.reachrich.Controller;

import java.lang.reflect.Member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/home.do")
	public String index(HttpServletRequest request, Model model) {
		return "/home";
	}
	
}
