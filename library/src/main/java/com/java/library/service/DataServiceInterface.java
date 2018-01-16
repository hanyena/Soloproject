package com.java.library.service;

import java.util.Map;

public interface DataServiceInterface {
	
	// 추천도서 페이지 데이터 불러오기
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap);
	

}
