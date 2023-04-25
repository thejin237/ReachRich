package com.ReachRich.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.domain.CommentDTO;
import com.ReachRich.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	private static final Logger log = LoggerFactory.getLogger(CommentService.class);
	
	@Autowired
	public CommentMapper mapper;
	
	@Override
	public List<CommentDTO> CMList(int stock_idx) {
		log.info("ServiceIM.CMList log......");
		mapper.CMList(stock_idx);
		return mapper.CMList(stock_idx);
	}
	
	@Override
	public int insertCM(CommentDTO dto) {
		log.info("ServiceIM.insertCM log......");
		return mapper.insertCM(dto);
	}
	
	@Override
	public int cntCM(int stock_idx) {
		log.info("ServiceIM.cntCM log......");
		return mapper.cntCM(stock_idx);
	}
	
	@Override
	public int cntcom_CM(int com_idx, int stock_idx) {
		log.info("ServiceIM.cntcom_CM log......");
		return mapper.cntcom_CM(com_idx, stock_idx);
	}
	
	@Override
	public int insertcom_CM(CommentDTO dto) {
		log.info("ServiceIM.insertcom_CM log......");
		return mapper.insertcom_CM(dto);
	}
	
	@Override
	public List<CommentDTO> Listcom_CM(int stock_idx, int com_idx) {
		log.info("ServiceIM.Listcom_CM log......");
		return mapper.Listcom_CM(stock_idx, com_idx);
	}
	
	@Override
	public List<CommentDTO> Listcom_CM1() {
		log.info("ServiceIM.Listcom_CM log......");
		return mapper.Listcom_CM1();
	}
}
