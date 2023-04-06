package com.reachrich.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reachrich.Service.NewUserSerImpl;
import com.reachrich.domain.UserDTO;
import com.reachrich.util.GmailConfirm;

@Controller
@RequestMapping("AdminUser")
public class AdminUserController {
	
	@Autowired
	private NewUserSerImpl service;
	
	@GetMapping("NewUser")
	public void NewUser() {}
	
	@GetMapping("login")
	public void Login_OK() {}

	
	@GetMapping("test")
	public void Test(Model model) {
		List<UserDTO> list = service.TestList("");
		model.addAttribute("list", list);
	}

	@GetMapping("test2")
	public void Test2(Model model){
		List<UserDTO> list = service.TestList("");
		model.addAttribute("list", list);
	}

	@GetMapping("test3")
	public void Test3(){}
	
	@PostMapping("test")
	public void TestList(Model model, @RequestParam("key") String key, @RequestParam("subkey") String subkey) {
		List<UserDTO> list = null;
		if(key == "" && subkey == "") {
			list = service.TestList(key);
			key = null;
		}else if(subkey == "") {
			list = service.TestList(key);
		}else {			
			list = service.TestList2(key, subkey);
		}
		model.addAttribute("key", key);
		model.addAttribute("subkey", subkey);
		model.addAttribute("list", list);
	}

	@PostMapping("test2")
	public @ResponseBody List<UserDTO> TestList2(Model model, @RequestParam("idArray[]") List<String> list2) {
		for(int i=0; i<list2.size(); i++) {
			System.out.println(list2.get(i));
		}
		List<UserDTO> list = service.CheckBoxTest(list2);
		System.out.println(list.size());
		return list;
	}

	@PostMapping("test3")
	public @ResponseBody String TestList3(Model model, @RequestParam("array") List<UserDTO> list) {
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getUser_id());
		}
		return "성공!";
	}
	
	@PostMapping("NewUser")
	public String NewUserPro(UserDTO dto, HttpServletRequest request){
		int row = service.NewUser(dto, request);
		if(row == 1) {
			return "/index";			
		}else {
			return "";
		}
	}
	
	@PostMapping("idCheck")
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
	public void em_check(HttpServletRequest request, Model model){
		GmailConfirm gc = GmailConfirm.getInstance();
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String authNum = gc.connectEmail(email);
		model.addAttribute("authNum", authNum);
	}
	
	@PostMapping("login")
	public String login_ok(HttpSession session, Model model, UserDTO dto) {
		int row = service.userIdCheck(dto.getUser_id());
		if(row == 1) {
			int row2 = service.Login(dto);
			if(row2 == 1) {
				String uri = (String)session.getAttribute("uri");
				session.setAttribute("user_id", dto.getUser_id());
				if(uri != null) {
					return uri;
				}else {
					return "/home";
				}
			}else {
				model.addAttribute("row", row);
				return "/AdminUser/login";
			}
		}else {
			model.addAttribute("row", row);
			return "/AdminUser/login";
		}
	}
	
	
	@PostMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		String uri = (String)session.getAttribute("uri");
		if(uri != null) {
			return uri;
		}else {
			return "/home";
		}
	}
}
