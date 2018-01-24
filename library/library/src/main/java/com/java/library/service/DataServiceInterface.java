package com.java.library.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

public interface DataServiceInterface {
	


	// 추천도서 페이지  데이터 불러오기
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap);
	
	// 추천도서 상세페이지 데이터 가져오기
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap);
	
	// 신간안내 데이터 불러오기
	public Map<String, Object> newbookSelect(Map<String, Object> paramMap); 
	
	// 도서검색 데이터 불러오기
	public JSONObject searchSelect(Map<String, Object> paramMap);
	
	// 메인추천도서 데이터 불러오기
	public Map<String, Object> mainRecommend(Map<String, Object> paramMap);

	// 대여 도서 삽입
	public Map<String, Object> borrowBookInsert(Map<String, Object> paramMap);

	public List<Map<String, Object>> mainBestView(Map<String, Object> paramMap);
	
	

}
