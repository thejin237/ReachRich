package com.reachrich.demo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reachrich.demo.mapper.ReachrichMapper;

@Service
public class ReachrichServicelmpl {
	@Autowired
	private ReachrichMapper mapper;
}
