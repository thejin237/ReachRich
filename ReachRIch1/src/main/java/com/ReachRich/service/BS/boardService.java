package com.ReachRich.service.BS;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ReachRich.domain.boardDTO;

public interface boardService {
	//전체 글 수
	public int boardCount();
	
	//글전체 목록
	public List<boardDTO> boardList();
	
	//조회수 증가
	public void boardHits(int stock_idx, HttpServletRequest request, HttpServletResponse response);
	
	//추천
	public void sug(int stock_idx, HttpServletRequest request, HttpServletResponse response);
	
	//특정글 검색(view, modify)
	public boardDTO boardSelect(int idx);
	
	//특정글 분류(list, modify)
	public List<boardDTO> boardListSelect(String key);
	
	//특정글 분류 서브
	public List<boardDTO> TestList2(String key, String subkey);
	
	//등록
	public int boardWrite(boardDTO dto);
	
	//수정
	public int boardModify(boardDTO dto);
	
	//삭제
	public int boardDelete(boardDTO dto);
}
