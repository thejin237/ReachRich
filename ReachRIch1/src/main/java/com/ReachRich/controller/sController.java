package com.ReachRich.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ReachRich.domain.boardDTO;
import com.ReachRich.service.BS.boardService;

@Controller
@RequestMapping("Stock")
public class sController {
	private static final Logger log = LoggerFactory.getLogger(sController.class);
	
	@Autowired
	private boardService service;
	
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
		model.addAttribute("list",service.boardList());
	}
	
	//쿠키를 서비스에서 처리
	@GetMapping("board_hits")
	public String boardHits(@RequestParam("stock_idx") int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		log.info("board_hits......");
		service.boardHits(stock_idx, request, response);
		return "redirect:board_view?stock_idx="+stock_idx;
	}
	
	@GetMapping("board_view")
	public void boardView(@RequestParam("stock_idx") int stock_idx, Model model) {
		log.info("board_vlew......");
		boardDTO dto = service.boardSelect(stock_idx);
		dto.setContent(dto.getContent().replace("/n", "<br>"));
		model.addAttribute("board",dto);
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
}