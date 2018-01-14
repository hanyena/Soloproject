package com.java.library.service;

import java.util.Map;

public interface BoardServiceInterface {
	
	// 게시판 목록 가져오기
	public Map<String, Object> boardSelect(Map<String, Object> paramMap);
	
	// 게시판 글쓰기
	public Map<String, Object> boardInsert(Map<String, Object> paramMap);
	
	

}
