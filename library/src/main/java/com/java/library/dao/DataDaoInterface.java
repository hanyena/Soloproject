package com.java.library.dao;

import java.util.List;
import java.util.Map;

public interface DataDaoInterface {
	
	// 추천도서 데이터 목록 가져오기
	public List<Map<String, Object>> recommendSelect(Map<String, Object> paramMap);
	
	// 추천도서 상세페이지 데이터(1개) 가져오기
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap);
	

}
