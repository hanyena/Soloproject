package com.java.library.service;

import java.util.Map;

public interface DataServiceInterface {
	
	// 추천도서 페이지 데이터 불러오기
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap);
	
	// 추천도서 상세페이지 데이터 불러오기
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap);
	

}
