package com.ReachRich.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ReachRich.domain.CommentDTO;

@Mapper
public interface CommentMapper {
	//댓글 가저오기
	public List<CommentDTO> CMList(int stock_idx);
	
	//댓글 등록
	public int insertCM(CommentDTO dto);
	
	//댓글 수
	public int cntCM(int stock_idx);
	
	//대댓글 수
	public int cntcom_CM(int com_idx);
	
	//대댓글 등록
	public int insertcom_CM(CommentDTO dto);
}