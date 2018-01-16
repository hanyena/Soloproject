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

	// 추천도서 데이터 목록 가져오기
	@Override
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap){
		rstMap = new HashMap<String, Object>();
		rstMap.put("recommend", ddi.recommendSelect(paramMap));
		return rstMap;
	}

	// 추천도서 상세페이지 데이터(1개) 가져오기
	@Override
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		rstMap.put("recommendview", ddi.recommendViewSelect(paramMap));
		return rstMap;
	}
	

}
