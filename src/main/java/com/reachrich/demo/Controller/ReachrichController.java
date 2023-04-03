package com.reachrich.demo.Controller;

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

import com.reachrich.demo.Service.ReachrichServicelmpl;
import com.reachrich.demo.util.GmailConfirm;
import com.reachrich.demo.Domain.*;


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
