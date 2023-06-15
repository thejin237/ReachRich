package com.ReachRich.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.domain.BoardDTO;
import com.ReachRich.mapper.BoardMapper;
import com.ReachRich.mapper.CommentMapper;

@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardMapper mapper;
	@Autowired
	private CommentMapper CMmapper;
	
	@Override
	public int boardCount() {
		log.info("count.service..");
		return mapper.boardCount();
	}
	@Override
	public int boardIdx() {
		log.info("BoardIdx.service..");

		return mapper.boardIdx();
	}
	@Override
	public List<BoardDTO> boardList() {
		log.info("BoardList()....");
		List<BoardDTO> list = mapper.boardList();
		int Maxcnt = 0;
		for(int i=0; i<list.size(); i++) {
			Maxcnt = CMmapper.cntCM(list.get(i).getStock_idx());
			list.get(i).setMaxcnt(Maxcnt);
		}
		return list;
	}

	@Override
	public void boardHits(int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		//쿠키 설정
		log.info("BoardHits()....");
		
		boolean bool=false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++) {
			info = cookies[i];
			if(info.getName().equals("BoardCookie"+stock_idx)) {
				bool = true;
				break;
			}
		}
		String str = "" + System.currentTimeMillis();
		if(!bool) {
			info = new Cookie("BoardCookie"+stock_idx,str);
			info.setMaxAge(60*5);
			response.addCookie(info);
			mapper.boardHits(stock_idx);
		}
		
	}
	
	//추천
	@Override
	public void sug(int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		//쿠키 설정
		log.info("Service.BoardSug()....");
		
		boolean bool=false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++) {
			info = cookies[i];
			if(info.getName().equals("BoardCookieSug"+stock_idx)) {
				log.info("Service.BoardSug() : F....");
				bool = true;
				break;
			}
		}
		String str = "" + System.currentTimeMillis();
		if(!bool) {
			log.info("Service.BoardSug() : T....");
			info = new Cookie("BoardCookieSug"+stock_idx,str);
			info.setMaxAge(5);
			response.addCookie(info);
			mapper.sug(stock_idx);
		}
		
	}
	
	@Override
	public List<BoardDTO> BoardListSearch(BoardDTO dto) {
		log.info("BoardListSearch()....");
		log.info("Service search....." + dto.getType() + " / " + dto.getKey());
		return mapper.BoardListSearch(dto);
		
	}
	
	@Override
	public BoardDTO boardSelect(int idx) {
		log.info("BoardSelect()....");
		return mapper.boardSelect(idx);
	}
	//특정글 분류
	@Override
	public List<BoardDTO> boardListSelect(String key) {
		log.info("BoardListSelect()....");
		return mapper.boardListSelect(key);
	}
	
	@Override
	public List<BoardDTO> TestList2(String key, String subkey) {
		log.info("TestList2....");
		return mapper.TestList2(key, subkey);
	}
	
	//파일이름찾기
	@Override
	public BoardDTO selectFlie(int stock_idx) {
		log.info("IMselectFlie....");
		
		return mapper.selectFlie(stock_idx);
	}
	
	@Override
	public int boardWrite(BoardDTO dto) {
		log.info("BoardWrite()....");
		return mapper.boardWrite(dto);
	}
	
	@Override
	public int boardModify(BoardDTO dto) {
		log.info("BoardModify()....");
		return mapper.boardModify(dto);
	}
	
	@Override
	public int boardDelete(BoardDTO dto) {
		log.info("BoardDelete()....");
		return mapper.boardDelete(dto);
	}
	@Override
	public int boardComDel(BoardDTO dto) {
		log.info("BoardComDelete()....");
		return mapper.boardComDel(dto);
	}
	@Override
	public int boardComComDel(BoardDTO dto) {
		log.info("BoardComComDelete()....");
		return mapper.boardComComDel(dto);
	}
}
