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

@Service
public class boardServiceImpl implements boardService {
	private static final Logger log = LoggerFactory.getLogger(boardService.class);
	
	@Autowired
	private boardMapper mapper;
	
	@Override
	public int boardCount() {
		log.info("count.service..");
		return mapper.boardCount();
	}

	@Override
	public List<boardDTO> boardList() {
		log.info("boardList()....");
		return mapper.boardList();
	}

	@Override
	public void boardHits(int idx, HttpServletRequest request, HttpServletResponse response) {
		//쿠키 설정
		log.info("boardHits()....");
		
		boolean bool=false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++) {
			info = cookies[i];
			if(info.getName().equals("boardCookie"+idx)) {
				bool = true;
				break;
			}
		}
		String str = "" + System.currentTimeMillis();
		if(!bool) {
			info = new Cookie("boardCookie"+idx,str);
			info.setMaxAge(60*5);
			response.addCookie(info);
			mapper.boardHits(idx);
		}
		
	}
	
	@Override
	public boardDTO boardSelect(int idx) {
		log.info("boardSelect()....");
		return mapper.boardSelect(idx);
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
