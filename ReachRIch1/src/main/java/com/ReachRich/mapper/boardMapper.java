package com.ReachRich.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ReachRich.domain.boardDTO;

@Mapper
public interface boardMapper {

	//전체 게시글 카운트
	public int boardCount();
	
	//전체 게시글 idx 맥스
	public int boardIdx();
	
	//글전체 목록
	public List<boardDTO> boardList();
	
	//조회수 증가
	public void boardHits(int stock_idx);
	
	//추천
	public void sug(int stock_idx);

	//특정글 검색(view, modify)
	public boardDTO boardSelect(int stock_idx);
	
	//특정글 분류(list, modify)
	public List<boardDTO> boardListSelect(String key);
	
	//특정글 분류 서브
	public List<boardDTO> TestList2(String key, String subkey);
	
	//파일이름 찾기
	public boardDTO selectFlie(int stock_idx);
	
	//등록
	public int boardWrite(boardDTO dto);
	
	//수정
	public int boardModify(boardDTO dto);
	
	//삭제
	public int boardDelete(boardDTO dto);
	//댓글 대댓글 삭제
	public int boardComDel(boardDTO dto);
	public int boardComComDel(boardDTO dto);

	
	
}
