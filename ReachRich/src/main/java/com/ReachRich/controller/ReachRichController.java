package com.ReachRich.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.ReachRich.service.ReachRichServiceImpl;
import com.ReachRich.util.GmailConfirm;
import com.ReachRich.domain.*;


@Controller
@RequestMapping("reachrich")
public class ReachRichController {
	private static final Logger log = 
			LoggerFactory.getLogger(ReachRichController.class);

	@Autowired
	private ReachRichServiceImpl service;
	
	@GetMapping("reachrich_login")
	public void reachrichLogin() {
		log.info("ReachRichLogin()..............");
	}
	@GetMapping("reachrich_signin")
	public void reachrichSingin() {
		log.info("ReachRichSignin().............");
	}
	@GetMapping("reachrich_board")
	public void reachrichBoard() {
		log.info("ReachRichBoard()..............");
	}
	@GetMapping("reachrich_modify")
	public void reachrichModify() {
		log.info("ReachRichModify()...............");
	}
	@GetMapping("reachrich_profile")
	public void reachrichProfile() {
		log.info("ReachRichProfile()...............");
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
	public @ResponseBody int idCheck(@RequestParam("user_id") String user_id){
		int result = 0;
		if(user_id == "") {
			result = -1;
		}else {			
			result = service.userIdCheck(user_id);
		}
		return result;
	}
	@PostMapping("login")
	public String login(HttpSession session, HttpServletRequest request) {
		
		int row = service.login(request);
		if(row == 1) {
			UserDTO dto = service.loginselect(request);
			session.setAttribute("user", dto);
			return "redirect:/index";
		}else {
			return "";
		}
	}
	@GetMapping("reachrich_logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}


}
