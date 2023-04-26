package com.ReachRich.service;

import java.util.List; 

import com.ReachRich.domain.CommentDTO;


public interface CommentService {
//	private static commentService CMservice;
//	
//	public static commentService getcommentService() {
//		return CMservice;
//	}
	//댓글 가저오기
	public List<CommentDTO> CMList(int stock_idx);
	
	//댓글 등록
	public int insertCM(CommentDTO dto);
	
	//댓글 수
	public int cntCM(int stock_idx);
	
	//대댓글 수
	public int cntcom_CM(int com_idx, int stock_idx);
	
	//대댓글 등록
	public int insertcom_CM(CommentDTO dto);
	
	//대댓글 불러오기
	public List<CommentDTO> Listcom_CM(int stock_idx, int com_idx);
	
	//대댓글 불러오기
	public List<CommentDTO> Listcom_CM1();
}
