package com.ReachRich.controller;


import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriUtils;

import com.ReachRich.service.BoardServiceImpl;
import com.ReachRich.service.CommentServiceImpl;
import com.ReachRich.service.ReachRichServiceImpl;
import com.ReachRich.util.GmailConfirm;
import com.ReachRich.util.UserSHA256;
import com.ReachRich.domain.*;


@Controller
@RequestMapping("reachrich")
public class ReachRichController {
	private static final Logger log = 
			LoggerFactory.getLogger(ReachRichController.class);

	@Autowired
	private ReachRichServiceImpl service;
	
	@Autowired
	private BoardServiceImpl BoardService;
	
	@Autowired
	private CommentServiceImpl CommentService;
	
	@GetMapping("reachrich_login")
	public void reachrichLogin() {
		log.info("ReachRichLogin()..............");
	}
	@GetMapping("reachrich_signin")
	public void reachrichSingin() {
		log.info("ReachRichSignin().............");
	}
	
	
	@GetMapping("reachrich_board_list")
	public void reachrichBoardList(Model model) {
		log.info("G.board_list......");
		String rootPath = System.getProperty("user.dir");
		log.info("루트경로 : " + rootPath);
		model.addAttribute("totcount",BoardService.boardCount());
		model.addAttribute("list", BoardService.boardList());
	}
	@PostMapping("reachrich_board_list")
	public void reachrichBoardList(Model model, @RequestParam("key") String key, @RequestParam("subkey") String subkey) {
		List<BoardDTO> list = null;
		if(key == "" && subkey == "") {
			list = BoardService.boardListSelect(key);
			key = null;
		}else if(subkey == "") {
			list = BoardService.boardListSelect(key);
		}else {			
			list = BoardService.TestList2(key, subkey);
		}

		model.addAttribute("key", key);
		model.addAttribute("subkey", subkey);
		model.addAttribute("list", list);
	}
	@GetMapping("reachrich_board_hits")
	public String ReachRichBoardHits(@RequestParam("stock_idx") int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		log.info("board_hits......");
		BoardService.boardHits(stock_idx, request, response);
		//	boardDTO image = service.selectFlie(stock_idx);
		return "redirect:reachrich_board_view?stock_idx="+stock_idx;
	}
    @GetMapping("reachrich_board_view")
	public void ReachRichBoardView(@RequestParam("stock_idx") int stock_idx, Model model) throws
	MalformedURLException {
		
		log.info("reachrich_board_vlew......");
		BoardDTO dto = BoardService.boardSelect(stock_idx);
		dto.setContent(dto.getContent().replace("/n", "<br>"));
		List<CommentDTO> list = CommentService.CMList(stock_idx); 
		model.addAttribute("board",dto);
		model.addAttribute("list", list);//댓글 부분
		model.addAttribute("cnt", CommentService.cntCM(dto.getStock_idx()));
		int maxcnt = 0;
		List<CommentDTO> com_comList = CommentService.Listcom_CM1();
		model.addAttribute("com_comList", com_comList);

	}
	@PostMapping("reachrich_board_view")
	public String board_comment(CommentDTO dto, @RequestParam("stock_idx") int stock_idx) {
		log.info("board_comment.....");
		dto.setCom_idx(CommentService.cntCM(stock_idx)+1);
		CommentService.insertCM(dto);

		return "redirect:reachrich_board_view?stock_idx="+stock_idx;
	}
	
	@PostMapping("com_comment")
	public String com_comment(CommentDTO dto, @RequestParam("stock_idx") int stock_idx, @RequestParam Map<String, Object> param, HttpServletRequest request) {
		log.info("board_com_comment.....");
		log.info("stoxk-idx : " + dto.getStock_idx());
		
		dto.setCom_com_idx(CommentService.cntcom_CM(dto.getCom_idx(),dto.getStock_idx())+1);
		log.info("택스트 내용 : "+param);
		String com_idx = (String) param.get("com_idx");
		dto.setStock_idx(stock_idx);
		dto.setCom_idx(Integer.parseInt(com_idx));
		dto.setUser_id((String)param.get("user_id"));
		
		String con = null;
		for(int i=1; i<param.size(); i++) {
			if(param.get("text01"+i)!="") {
				con = (String)param.get("text01"+i);
				break;
			}
		}
		dto.setCom_com_content(con);
		CommentService.insertcom_CM(dto);
		return "redirect:reachrich_board_view?stock_idx="+stock_idx;
	}
	
  
	@GetMapping("reachrich_board_write")
	public void reachrichBoardWrite() {
	}
	
	@Autowired
	private FileStore fileStore;
	@PostMapping("reachrich_board_write")
	public String boardWritePro(BoardDTOFrom dtofrom, RedirectAttributes rttr, @RequestParam("imageFiles") MultipartFile file2) throws IOException{
		log.info("ReachRich_Write_Pro........");
		BoardDTO dto = new BoardDTO();
		int max = BoardService.boardIdx();
		dto.setStock_idx(max+1);
		dto.setStock_sector(dtofrom.getStock_sector());
		dto.setStock_name(dtofrom.getStock_name());
		dto.setSubject(dtofrom.getSubject());
		dto.setUser_name(dtofrom.getUser_name());
		dto.setContent(dtofrom.getContent());
		
		LocalDateTime NowTime = LocalDateTime.now();
		String formatDate = NowTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		dtofrom.setRegdate(formatDate);
		  // 첨부파일, 이미지들 처리하는 부분
		   // UploadFile attachFile = fileStore.storeFile(dtof.getAttachFile());
		    List<UploadFile> imageFiles = fileStore.storeFiles(dtofrom.getImageFiles());
		    //log.info("파일 이름 ? :"+attachFile);
		    log.info("이미지 이름 ? :"+imageFiles);
		    //log.info("이미지 이름 ? :"+imageFiles.get(0).getStoreFilename());
		    
		    //imageFiles.get(0).equals("storeFilename");
		   // dto.setAttachFile(attachFile);
		    dto.setImageFiles(imageFiles);
			


	        //String originalFilename = file1.getOriginalFilename();
			//String storeFilename = UUID.randomUUID() + "." + extractExt(originalFilename);
			
			if(file2.getSize()!=0) {
				dto.setImageName(imageFiles.get(0).getStoreFilename()); // 업로드 파일 명
			}
//			if(dto.getAttachFile()!=null) {
//				dto.setFileName(dto.getAttachFile().getStoreFilename());
//			}
				
			//file.transferTo(new File("C:/Users/alfmg/Downloads/upload")); // 파일저장
			log.info("내용 : "+dto.getAttachFile());
			
			int row = BoardService.boardWrite(dto);
			rttr.addFlashAttribute("row",row);
			return "redirect:reachrich_board_list";
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
	@PostMapping("existing_password_check")
	public void existing_password_check(HttpServletRequest request, Model model,UserDTO dto) {
	log.info(dto.getUser_id());
	log.info(request.getParameter("user_id"));
	log.info(request.getParameter("existing_password"));
	int row = service.expassCheck(request);
	
	
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
		log.info("login1");
		int row = service.login(request);
		if(row == 1) {
			log.info("login2");
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
	
	@GetMapping("reachrich_board_delete")
	public void boardDelete(@RequestParam("stock_idx") int stock_idx, Model model, @RequestParam("imageName") String imagename) {
		log.info("reachrich_board_delete......");
		model.addAttribute("stock_idx",stock_idx);
		model.addAttribute("imagename",imagename);
	}
	
	@PostMapping("reachrich_board_delete")
	public String boardDeletePro(@RequestParam("stock_idx") int stock_idx, BoardDTO dto, RedirectAttributes rttr, @RequestParam("imageName") String imagename) throws IOException {
		log.info("board_delete_pro......");
		Path file = Paths.get("C:/Users/USER/git/ReachRich/ReachRich/files/"+imagename);
		log.info("파일 경로1 : "+file);
		Files.deleteIfExists(file);
		
		int row = BoardService.boardDelete(dto);
		int row1 = BoardService.boardComDel(dto);
		int row2 = BoardService.boardComComDel(dto);
		rttr.addFlashAttribute("row",row);
		return "redirect:reachrich_board_list";
	}
<<<<<<< HEAD

=======
	@GetMapping("reachrich_news")
	public void reachrich_news() {
		log.info("reachrich_new...........");
	}
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b

/*------------------------------------------------------------------------------------------------*/
	
}
