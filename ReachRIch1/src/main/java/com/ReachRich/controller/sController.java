package com.ReachRich.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ReachRich.domain.boardDTO;
import com.ReachRich.domain.commentDTO;
import com.ReachRich.domain.userDTO;
import com.ReachRich.service.BS.boardService;
import com.ReachRich.service.CS.commentService;
import com.ReachRich.service.US.userService;

@Controller
@RequestMapping("Stock")
public class sController {
	private static final Logger log = LoggerFactory.getLogger(sController.class);
	
	@Autowired
	private boardService service;
	
	@Autowired
	private commentService CMservice;
	
	@Autowired
	public userService UMservice;
	
	@GetMapping("news")
	public void news() {
		 
		log.info("news log...........");
		//ScheduledExecutorService sq = news.news();
		//return "news";
	}
	
	@GetMapping("test")
	public void Test(Model model) {
		List<boardDTO> list = service.boardList();
		model.addAttribute("list", list);
	}
	
	@PostMapping("board_list")
	public void TestList(Model model, @RequestParam("key") String key, @RequestParam("subkey") String subkey) {
		List<boardDTO> list = null;
		if(key == "" && subkey == "") {
			list = service.boardListSelect(key);
			key = null;
		}else if(subkey == "") {
			list = service.boardListSelect(key);
		}else {			
			list = service.TestList2(key, subkey);
		}
		model.addAttribute("key", key);
		model.addAttribute("subkey", subkey);
		model.addAttribute("list", list);
	}

	@GetMapping("board_list")
	public void boardList(Model model) {
		log.info("board_list......");
		
		model.addAttribute("totcount",service.boardCount());
		model.addAttribute("list", service.boardList());
	}
	
	//쿠키를 서비스에서 처리
	@GetMapping("board_hits")
	public String boardHits(@RequestParam("stock_idx") int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		log.info("board_hits......");
		service.boardHits(stock_idx, request, response);
		return "redirect:board_view?stock_idx="+stock_idx;
	}
	
	//추천
	@PostMapping("Sug")
	public String sug(@RequestParam("stock_idx") int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		log.info("suggestion + .....");
		log.info("stock_idx : "+stock_idx);
		
		service.sug(stock_idx, request, response);
		return "redirect:board_view?stock_idx="+stock_idx;
	}
	
	@GetMapping("board_view")
	public void boardView(@RequestParam("stock_idx") int stock_idx, Model model) {
		log.info("board_vlew......");
		boardDTO dto = service.boardSelect(stock_idx);
		dto.setContent(dto.getContent().replace("/n", "<br>"));
		List<commentDTO> list = CMservice.CMList(stock_idx); 
		model.addAttribute("board",dto);
		model.addAttribute("list", list);//댓글 부분
		model.addAttribute("cnt", CMservice.cntCM(dto.getStock_idx()));
		int maxcnt = 0;
		List<commentDTO> com_comList = CMservice.Listcom_CM1();
		model.addAttribute("com_comList", com_comList);
//		for(int i=0; i<list.size(); i++) {
//			maxcnt = CMservice.cntcom_CM(list.get(i).getCom_idx(), stock_idx);
//			for(int x=0; x<maxcnt; x++) {
//				com_comList = CMservice.Listcom_CM(stock_idx, list.get(i).getCom_idx());
//				
//				model.addAttribute("c_com_idx", list.get(i).getCom_idx());
//				model.addAttribute("com_comList", com_comList);
//			}
//		}
	}
	
	@PostMapping("board_view")
	public String board_comment(commentDTO dto, @RequestParam("stock_idx") int stock_idx) {
		log.info("board_comment.....");
		dto.setCom_idx(CMservice.cntCM(stock_idx)+1);
		CMservice.insertCM(dto);
		return "redirect:board_view?stock_idx="+stock_idx;
	}
	
	@PostMapping("com_comment")
	public String com_comment(commentDTO dto) {
		log.info("board_com_comment.....");
		log.info("user_id : "+dto.getUser_id());
		//log.info("content : "+ dto.getCom_com_content());
		//log.info("com_idx : "+ dto.getCom_idx());
		//log.info("com_idx : "+ ci);
		//dto.setCom_idx(com_idx2);
		dto.setCom_com_idx(CMservice.cntcom_CM(dto.getCom_idx(),dto.getStock_idx())+1);
		CMservice.insertcom_CM(dto);
		
		return "redirect:board_view?stock_idx="+dto.getStock_idx();
	}

	
	@GetMapping("board_write")
	public void boardWrite() {
		log.info("board_write......");
	}
	
	@PostMapping("board_write")
	public String boardWritePro(boardDTO dto, RedirectAttributes rttr) {
		log.info("board_write_pro......");
		int row = service.boardWrite(dto);
		rttr.addFlashAttribute("row",row);
		return "redirect:board_write_pro";
	}
	
	@GetMapping("board_write_pro")
	public void boardWriteProPass() {
		log.info("board_write_pro_pass......");
	}
	
	@GetMapping("board_modify")
	public void boardModify(@RequestParam("idx") int idx, Model model) {
		log.info("board_write_pro_pass......");
		model.addAttribute("board",service.boardSelect(idx));
	}
	
	@PostMapping("board_modify")
	public String boardModifyPro(boardDTO dto, RedirectAttributes rttr) {
		log.info("board_modify_pro......");
		int row = service.boardModify(dto);
		rttr.addFlashAttribute("row",row);
		return "redirect:board_modify_pro";
	}
	
	@GetMapping("board_modify_pro")
	public void boardModifyProPass() {
		log.info("board_modify_pro_pass......");
		
	}
	
	@GetMapping("board_delete")
	public void boardDelete(@RequestParam("idx") int idx, Model model) {
		log.info("board_delete......");
		model.addAttribute("idx",idx);
	}
	
	@PostMapping("board_delete")
	public String boardDeletePro(boardDTO dto, RedirectAttributes rttr) {
		log.info("board_delete_pro......");
		int row = service.boardDelete(dto);
		rttr.addFlashAttribute("row",row);
		return "redirect:board_delete_pro";
	}
	
	@GetMapping("board_delete_pro")
	public void boardDeleteProPass() {
		log.info("board_delete_pro_pro......");
		
	}
	
	@GetMapping("login")
	public void Login_OK() {}
	
	@PostMapping("idCheck")
	public @ResponseBody int idCheck(@RequestParam("userid") String userid){
		int result = 0;
		if(userid == "") {
			result = -1;
		}else {			
			result = UMservice.userIdCheck(userid);
		}
		return result;
	}
	
	@PostMapping("login")
	public String login_ok(HttpSession session, Model model, userDTO dto) {
		int row = UMservice.userIdCheck(dto.getUser_id());
		if(row == 1) {
			int row2 = UMservice.Login(dto);
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
				return "/Stock/login";
			}
		}else {
			model.addAttribute("row", row);
			return "/Stock/login";
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
