package com.ReachRich.domain;

import java.util.List;

import com.ReachRich.controller.UploadFile;

import lombok.Data;

@Data
public class boardDTO {
	private int stock_idx;
	private String stock_sector;
	private String stock_name;
	private String stock_number;
	private int suggestion;
	private String subject;
	private int readcnt;
	private String user_name;
	private String content;
	private String imageName;
	private String fileName;
	private String regdate;
	private int Maxcnt;
	
	private UploadFile attachFile;          // 첨부 파일
	private List<UploadFile> imageFiles;    // 첨부 이미지
}
