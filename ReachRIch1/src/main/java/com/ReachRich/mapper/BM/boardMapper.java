package com.ReachRich.mapper.BM;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ReachRich.domain.boardDTO;

@Mapper
public interface boardMapper {
	//전체 게시글 카운트
	public int boardCount();
	
	//글전체 목록
	public List<boardDTO> boardList();
	
	//조회수 증가
	public void boardHits(int idx);
	
	//특정글 검색(view, modify)
	public boardDTO boardSelect(int idx);
	
	//등록
	public int boardWrite(boardDTO dto);
	
	//수정
	public int boardModify(boardDTO dto);
	
	//삭제
	public int boardDelete(boardDTO dto);
	
}
