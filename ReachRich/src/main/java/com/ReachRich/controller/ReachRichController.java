package com.ReachRich.controller;

import javax.servlet.http.HttpServletRequest;  

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ReachRich.service.ReachRichServicelmpl;
import com.ReachRich.util.GmailConfirm;
import com.ReachRich.domain.*;


@Controller
@RequestMapping("reachrich")
public class ReachRichController {
	private static final Logger log = 
			LoggerFactory.getLogger(ReachRichController.class);

	@Autowired
	private ReachRichServicelmpl service;
	
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
	@GetMapping("em_check")
	public void em_check(HttpServletRequest request, Model model){
		GmailConfirm gc = GmailConfirm.getInstance();
		String email = request.getParameter("email");
		String authNum = gc.connectEmail(email);
		model.addAttribute("authNum", authNum);
	}
	@PostMapping("NewUser")
	public String NewUserPro(UserDTO dto, HttpServletRequest request){
		int row = service.NewUser(dto, request);
		if(row == 1) {
			return "redirect:/index";			
		}else {
			return "";
		}
	}
	@PostMapping("idCheck")
	public @ResponseBody int idCheck(@RequestParam("id") String id){
		int result = 0;
		if(id == "") {
			result = -1;
		}else {			
			result = service.userIdCheck(id);
		}
		return result;
	}

}
