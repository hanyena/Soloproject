package com.java.library.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardServiceInterface {
	
	// 게시판 목록 가져오기
	public Map<String, Object> boardSelect(Map<String, Object> paramMap);
	
	// 게시판 글쓰기
	public Map<String, Object> boardInsert(Map<String, Object> paramMap);
	
	// 게시판 삭제
	public Map<String, Object> boardDelete(Map<String, Object> paramMap);
	
	// 게시판 수정
	public Map<String, Object> boardUpdate(Map<String, Object> paramMap);
	
	// 게시판 한 개 목록 가져오기
	public Map<String, Object> boardSelectOne(Map<String, Object> paramMap);
	
	// 게시판 한 개 목록 가져오기
	public Map<String, Object> boardUpload(MultipartHttpServletRequest req);
	

}
