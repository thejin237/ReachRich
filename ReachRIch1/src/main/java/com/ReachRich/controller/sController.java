package com.ReachRich.controller;



import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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

import com.ReachRich.domain.boardDTO;
import com.ReachRich.domain.boardDTOFrom;
import com.ReachRich.domain.commentDTO;
import com.ReachRich.domain.userDTO;
import com.ReachRich.service.BS.boardService;
import com.ReachRich.service.CS.commentService;
import com.ReachRich.service.US.userService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	MultipartFile file;
	
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
		log.info("G.board_list......");
		String rootPath = System.getProperty("user.dir");
		log.info("루트경로 : " + rootPath);
		model.addAttribute("totcount",service.boardCount());
		model.addAttribute("list", service.boardList());
	}
	//추천
	@PostMapping("Sug")
	public String sug(@RequestParam("stock_idx") int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		log.info("suggestion + .....");
		log.info("stock_idx : "+stock_idx);
		
		service.sug(stock_idx, request, response);
		return "redirect:board_view?stock_idx="+stock_idx;
	}
	
	//쿠키를 서비스에서 처리
	@GetMapping("board_hits")
	public String boardHits(@RequestParam("stock_idx") int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		log.info("board_hits......");
		service.boardHits(stock_idx, request, response);
		//	boardDTO image = service.selectFlie(stock_idx);
		return "redirect:board_view?stock_idx="+stock_idx;
	}
	

    @GetMapping("board_view")
	public void boardView(@RequestParam("stock_idx") int stock_idx, Model model) throws
	MalformedURLException {
		
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

	}

	@GetMapping(value = "C:/Users/alfmg/Downloads/upload/{imagename}", produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity<byte[]> userSearch(@PathVariable("imagename") String imagename) throws IOException {
		InputStream imageStream = new FileInputStream("C:/Users/alfmg/Downloads/upload/" + imagename);
		byte[] imageByteArray = IOUtils.toByteArray(imageStream);
		imageStream.close();
		return new ResponseEntity<byte[]>(imageByteArray, HttpStatus.OK);
	}
	
	@PostMapping("board_view")
	public String board_comment(commentDTO dto, @RequestParam("stock_idx") int stock_idx) {
		log.info("board_comment.....");
		dto.setCom_idx(CMservice.cntCM(stock_idx)+1);
		CMservice.insertCM(dto);

		return "redirect:board_view?stock_idx="+stock_idx;
	}
	
	@PostMapping("com_comment")
	public String com_comment(commentDTO dto, @RequestParam("stock_idx") int stock_idx, @RequestParam Map<String, Object> param, HttpServletRequest request) {
		log.info("board_com_comment.....");
		//log.info("user_id : "+dto.getUser_id());
		//log.info("con : "+value);
		//log.info("content : "+ dto.getCom_com_content());
		//log.info("com_idx : "+ dto.getCom_idx());
		//log.info("com_idx : "+ ci);
		//dto.setCom_idx(com_idx2);
		dto.setCom_com_idx(CMservice.cntcom_CM(dto.getCom_idx(),dto.getStock_idx())+1);
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
		CMservice.insertcom_CM(dto);
		return "redirect:board_view?stock_idx="+stock_idx;
	}

	
	@GetMapping("board_write")
	public void boardWrite() {
		log.info("board_write......");
	}
	
	@Autowired
	private FileStore fileStore;
	@PostMapping("board_write")
	public String boardWritePro(boardDTOFrom dtof, RedirectAttributes rttr, @RequestParam("imageFiles") MultipartFile file2) throws IOException{
		log.info("board_write_pro......");
		//dto.setO_img(file.getOriginalFilename());
		 boardDTO dto = new boardDTO();
		 
		int cnt = service.boardCount();
		dto.setStock_idx(cnt+1);
		dto.setStock_sector(dtof.getStock_sector());
		dto.setStock_name(dtof.getStock_name());
		dto.setSubject(dtof.getSubject());
		dto.setUser_name(dtof.getUser_name());
		dto.setContent(dtof.getContent());
		
	    LocalDateTime NowTime = LocalDateTime.now();
	    String formatDate = NowTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	    dtof.setRegdate(formatDate);
		
	    // 첨부파일, 이미지들 처리하는 부분
	   // UploadFile attachFile = fileStore.storeFile(dtof.getAttachFile());
	    List<UploadFile> imageFiles = fileStore.storeFiles(dtof.getImageFiles());
	    //log.info("파일 이름 ? :"+attachFile);
	    log.info("이미지 이름 ? :"+imageFiles);
	    //log.info("이미지 이름 ? :"+imageFiles.get(0).getStoreFilename());
	    
	    //imageFiles.get(0).equals("storeFilename");
	   // dto.setAttachFile(attachFile);
	    dto.setImageFiles(imageFiles);
		


        //String originalFilename = file1.getOriginalFilename();
		//String storeFilename = UUID.randomUUID() + "." + extractExt(originalFilename);
		
		if(!imageFiles.equals(null)) {
			dto.setImageName(imageFiles.get(0).getStoreFilename()); // 업로드 파일 명
		}
//		if(dto.getAttachFile()!=null) {
//			dto.setFileName(dto.getAttachFile().getStoreFilename());
//		}
			
		//file.transferTo(new File("C:/Users/alfmg/Downloads/upload")); // 파일저장
		log.info("내용 : "+dto.getAttachFile());
		
		int row = service.boardWrite(dto);
		rttr.addFlashAttribute("row",row);
		return "redirect:board_list";
	}
    // 확장자 추출
    private String extractExt(String originalFilename) {
        int pos = originalFilename.lastIndexOf(".");
        return originalFilename.substring(pos + 1);
    }
    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource showImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath(filename));
    }
    @GetMapping("/attach/{id}")
    public ResponseEntity<Resource> downloadAttach(@PathVariable int id) throws MalformedURLException {
        boardDTO dto = service.boardSelect(id);

        System.out.println(dto.getAttachFile());
        String storeFilename = dto.getAttachFile().getStoreFilename();
        String uploadFilename = dto.getAttachFile().getUploadFilename();
        System.out.println(fileStore.getFullPath(storeFilename));

        UrlResource urlResource = new UrlResource("file:" + fileStore.getFullPath(storeFilename));

        // 업로드 한 파일명이 한글인 경우 아래 작업을 안해주면 한글이 깨질 수 있음
        String encodedUploadFileName = UriUtils.encode(uploadFilename, StandardCharsets.UTF_8);
        String contentDisposition = "attachment; filename=\"" + encodedUploadFileName + "\"";

        // header에 CONTENT_DISPOSITION 설정을 통해 클릭 시 다운로드 진행
        return ResponseEntity.ok()
                //.header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition)
                .body(urlResource);
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
	
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		String uri = (String)session.getAttribute("uri");
		if(uri != null) {
			return uri;
		}else {
			return "Stock/login";
		}
	}
	
}
