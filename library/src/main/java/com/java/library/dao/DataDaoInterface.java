package com.java.library.dao;

import java.util.List;
import java.util.Map;

public interface DataDaoInterface {
	
	// 추천도서페이지
	public List<Map<String, Object>> recommendSelect(Map<String, Object> paramMap);
	
	// 신간안내 데이터 목록 가져오기
	public List<Map<String, Object>> newbookSelect(Map<String, Object> paramMap);

	// 도서검색 데이터 목록 가져오기
	public List<Map<String, Object>> searchSelect(Map<String, Object> paramMap);

	// 도서 데이터 총 갯수 조회(페이징용)
	public int bookCntSelect(Map<String, Object> paramMap);

	// 추천도서 상세페이지 데이터 가져오기
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap);
	

}
