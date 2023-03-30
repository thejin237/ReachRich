package com.ReachRich.service.CS;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ReachRich.domain.commentDTO;
import com.ReachRich.mapper.CM.commentMapper;

@Service
public class commentServiceImpl implements commentService {
	private static final Logger log = LoggerFactory.getLogger(commentService.class);
	
	@Autowired
	public commentMapper mapper;
	
	@Override
	public List<commentDTO> CMList(int stock_idx) {
		log.info("ServiceIM.CMList log......");
		mapper.CMList(stock_idx);
		return mapper.CMList(stock_idx);
	}
	
	@Override
	public int insertCM(commentDTO dto) {
		log.info("ServiceIM.insertCM log......");
		return mapper.insertCM(dto);
	}
	
	@Override
	public int cntCM(int stock_idx) {
		log.info("ServiceIM.cntCM log......");
		return mapper.cntCM(stock_idx);
	}
	
	@Override
	public int cntcom_CM(int com_idx) {
		log.info("ServiceIM.cntcom_CM log......");
		return mapper.cntcom_CM(com_idx);
	}
	
	@Override
	public int insertcom_CM(commentDTO dto) {
		log.info("ServiceIM.insertcom_CM log......");
		return mapper.insertcom_CM(dto);
	}
}
