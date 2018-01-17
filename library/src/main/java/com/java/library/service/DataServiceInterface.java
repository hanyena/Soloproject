package com.java.library.service;

import java.util.Map;

public interface DataServiceInterface {
	
	// 추천도서페이지, 상세페이지  데이터 불러오기
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap);
	
	// 신간안내 데이터 불러오기
	public Map<String, Object> newbookSelect(Map<String, Object> paramMap); 
	
	// 도서검색 데이터 불러오기
	public Map<String, Object> searchSelect(Map<String, Object> paramMap);

}
