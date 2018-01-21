package com.java.library.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.DataDaoInterface;
@Service
public class DataService implements DataServiceInterface {
	
	@Autowired
	DataDaoInterface ddi;
	
	Map<String, Object> rstMap;

	// 추천도서페이지 데이터 목록 가져오기
	@Override
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap){
		rstMap = new HashMap<String, Object>();
		rstMap.put("recommend", ddi.recommendSelect(paramMap));
		System.out.println(rstMap);
		return rstMap;
	}
	
	// 추천도서 상세페이지 데이터 목록 가져오기
	@Override
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap){
		rstMap = new HashMap<String, Object>();
		rstMap.put("recommendview", ddi.recommendViewSelect(paramMap));
		return rstMap;
	}
	

	// 신간안내 데이터 목록 가져오기
	@Override
	public Map<String, Object> newbookSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();		
		
		if(StringUtils.isNotEmpty(paramMap.get("start").toString())) {
			paramMap.put("start", Integer.parseInt(paramMap.get("start").toString()));
		}
		if(StringUtils.isNotEmpty(paramMap.get("viewRow").toString())) {
			paramMap.put("viewRow", Integer.parseInt(paramMap.get("viewRow").toString()));
		}
		rstMap.put("newbook", ddi.newbookSelect(paramMap));
		// 페이징하기 위한 게시물 총 갯수
		rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
		return rstMap;
	}
	

	// 도서 검색 데이터 목록 가져오기
	@Override
	public Map<String, Object> searchSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		// var로 선언된 변수들을 int형으로 바꿔줌 => sql문에서 limit가 숫자를 받기 때문(#)
		if(StringUtils.isNotEmpty(paramMap.get("start").toString())) {
			paramMap.put("start", Integer.parseInt(paramMap.get("start").toString()));
		}
		if(StringUtils.isNotEmpty(paramMap.get("viewRow").toString())) {
			paramMap.put("viewRow", Integer.parseInt(paramMap.get("viewRow").toString()));
		}
		// 검색 단어 조회 결과 받기 (반환값 : 자료가 있으면 1, 없으면 0)
		int rstSearch = ddi.searchhistory(paramMap);
		// 자료가 있을 시 library테이블에서 조회에서 데이터 가져오기
		if(rstSearch > 0) {
			rstMap.put("search", ddi.searchSelect(paramMap));
	    // 자료가 없을 시 searchhistory테이블에 검색한 단어 삽입
		}else {
			ddi.insertSearchWord(paramMap);
		}
		// 페이징하기 위한 게시물 총 갯수
		rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
		return rstMap;
	}

	

}
