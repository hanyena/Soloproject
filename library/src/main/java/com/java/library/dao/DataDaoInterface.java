package com.java.library.dao;

import java.util.List;
import java.util.Map;

public interface DataDaoInterface {
	
	// 추천도서 데이터 가져오기
	public List<Map<String, Object>> recommendSelect(Map<String, Object> paramMap);
	

}
