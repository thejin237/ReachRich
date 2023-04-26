package com.ReachRich.service;

import java.util.List; 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ReachRich.domain.BoardDTO;

public interface BoardService {
	//전체 글 수
	public int boardCount();
	//전체 idx 맥스값
	public int boardIdx();
	
	//글전체 목록
	public List<BoardDTO> boardList();
	
	//조회수 증가
	public void boardHits(int stock_idx, HttpServletRequest request, HttpServletResponse response);
	
	//추천
	public void sug(int stock_idx, HttpServletRequest request, HttpServletResponse response);
	
	//특정글 검색(view, modify)
	public BoardDTO boardSelect(int idx);
	
	//특정글 분류(list, modify)
	public List<BoardDTO> boardListSelect(String key);
	
	//특정글 분류 서브
	public List<BoardDTO> TestList2(String key, String subkey);
	
	//파일이름찾기
	public BoardDTO selectFlie(int stock_idx);
	
	//등록
	public int boardWrite(BoardDTO dto);
	
	//수정
	public int boardModify(BoardDTO dto);
	
	//삭제
	public int boardDelete(BoardDTO dto);
	//댓글 대댓글 삭제
	public int boardComDel(BoardDTO dto);
	public int boardComComDel(BoardDTO dto);
}
