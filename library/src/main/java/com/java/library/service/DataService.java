package com.java.library.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.DataDaoInterface;
@Service
public class DataService implements DataServiceInterface {
	
	@Autowired
	DataDaoInterface ddi;
	
	Map<String, Object> rstMap;

	// 추천도서페이지, 상세페이지 데이터 목록 가져오기
	@Override
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap){
		rstMap = new HashMap<String, Object>();
		rstMap.put("recommend", ddi.recommendSelect(paramMap));
		// 페이징하기 위한 게시물 총 갯수
		rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
		System.out.println(rstMap);
		return rstMap;
	}

	// 신간안내 데이터 목록 가져오기
	@Override
	public Map<String, Object> newbookSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		rstMap.put("newbook", ddi.newbookSelect(paramMap));
		// 페이징하기 위한 게시물 총 갯수
//		rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
		return rstMap;
	}

	// 도서 검색 데이터 목록 가져오기
	@Override
	public Map<String, Object> searchSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		rstMap.put("search", ddi.searchSelect(paramMap));
		// 페이징하기 위한 게시물 총 갯수
		rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
		return rstMap;
	}

	

}
