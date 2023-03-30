package com.ReachRich.service.BS;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.domain.boardDTO;
import com.ReachRich.mapper.BM.boardMapper;
import com.ReachRich.mapper.CM.commentMapper;

@Service
public class boardServiceImpl implements boardService {
	private static final Logger log = LoggerFactory.getLogger(boardService.class);
	
	@Autowired
	private boardMapper mapper;
	@Autowired
	private commentMapper CMmapper;
	
	@Override
	public int boardCount() {
		log.info("count.service..");
		return mapper.boardCount();
	}

	@Override
	public List<boardDTO> boardList() {
		log.info("boardList()....");
		List<boardDTO> list = mapper.boardList();
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
		log.info("boardHits()....");
		
		boolean bool=false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++) {
			info = cookies[i];
			if(info.getName().equals("boardCookie"+stock_idx)) {
				bool = true;
				break;
			}
		}
		String str = "" + System.currentTimeMillis();
		if(!bool) {
			info = new Cookie("boardCookie"+stock_idx,str);
			info.setMaxAge(60*5);
			response.addCookie(info);
			mapper.boardHits(stock_idx);
		}
		
	}
	
	//추천
	@Override
	public void sug(int stock_idx, HttpServletRequest request, HttpServletResponse response) {
		//쿠키 설정
		log.info("Service.boardSug()....");
		
		boolean bool=false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++) {
			info = cookies[i];
			if(info.getName().equals("boardCookieSug"+stock_idx)) {
				bool = true;
				break;
			}
		}
		String str = "" + System.currentTimeMillis();
		if(!bool) {
			info = new Cookie("boardCookieSug"+stock_idx,str);
			response.addCookie(info);
			mapper.sug(stock_idx);
		}
		
	}
	
	@Override
	public boardDTO boardSelect(int idx) {
		log.info("boardSelect()....");
		return mapper.boardSelect(idx);
	}
	//특정글 분류
	@Override
	public List<boardDTO> boardListSelect(String key) {
		log.info("boardListSelect()....");
		return mapper.boardListSelect(key);
	}
	
	@Override
	public List<boardDTO> TestList2(String key, String subkey) {
		log.info("TestList2....");
		return mapper.TestList2(key, subkey);
	}
	
	@Override
	public int boardWrite(boardDTO dto) {
		log.info("boardWrite()....");
		return mapper.boardWrite(dto);
	}
	
	@Override
	public int boardModify(boardDTO dto) {
		log.info("boardModify()....");
		return mapper.boardModify(dto);
	}
	
	@Override
	public int boardDelete(boardDTO dto) {
		log.info("boardDelete()....");
		return mapper.boardDelete(dto);
	}
}
