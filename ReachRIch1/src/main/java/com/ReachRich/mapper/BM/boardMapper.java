package com.ReachRich.mapper.BM;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface boardMapper {
	//전체 글 수
	public int BoardCount();
}
