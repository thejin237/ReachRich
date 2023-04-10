package com.ReachRich.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class boardDTOFrom {
	private int stock_idx;
	private String stock_sector;
	private String stock_name;
	private int suggestion;
	private String subject;
	private int readcnt;
	private String user_name;
	private String content;
	private String imageName;
	private String fileName;
	private String regdate;
	private int Maxcnt;
	
    private MultipartFile attachFile;          // 첨부 파일
    private List<MultipartFile> imageFiles;    // 첨부 이미지
}
