package com.java.library.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardDaoInterface {
	
	// 삽입
	public int boardInsert(Map<String, Object> paramMap);
	
	// 수정
//	public HashMap<String, Object> BoardUpdate(HashMap<String, Object> paramMap);
	
	// 삭제
//	public HashMap<String, Object> BoardDelete(HashMap<String, Object> paramMap);
	
	// 선택
	public List<Map<String, Object>> boardSelect(Map<String, Object> paramMap);
	
	

}
