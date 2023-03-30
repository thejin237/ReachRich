package com.ReachRich.service.CS;

import java.util.List;

import com.ReachRich.domain.commentDTO;


public interface commentService {
//	private static commentService CMservice;
//	
//	public static commentService getcommentService() {
//		return CMservice;
//	}
	//댓글 가저오기
	public List<commentDTO> CMList(int stock_idx);
	
	//댓글 등록
	public int insertCM(commentDTO dto);
	
	//댓글 수
	public int cntCM(int stock_idx);
	
	//대댓글 수
	public int cntcom_CM(int com_idx);
	
	//대댓글 등록
	public int insertcom_CM(commentDTO dto);
}
