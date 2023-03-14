package com.reachrich.Controller;

import java.io.IOException;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reachrich.Service.NewUserSerImpl;
import com.reachrich.util.GmailConfirm;

@Controller
@RequestMapping("AdminUser")
public class AdminUserController {
	
	@Autowired
	private NewUserSerImpl service;
	
	@GetMapping("NewUser")
	public void NewUser() {
		
	}
	
	
	@PostMapping("idCheck") //int 반환은 불가능
	public @ResponseBody int idCheck(@RequestParam("userid") String userid){
		int result = 0;
		if(userid == "") {
			result = -1;
		}else {			
			result = service.userIdCheck(userid);
		}
		return result;
	}

	@GetMapping("em_check")
	public void em_check(HttpServletRequest request, Model model) throws ServletException, IOException {
		GmailConfirm gc = GmailConfirm.getInstance();
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String authNum = gc.connectEmail(email);
		model.addAttribute("authNum", authNum);
	}
}
