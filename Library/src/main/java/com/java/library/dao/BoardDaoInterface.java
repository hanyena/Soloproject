package com.java.library.dao;

import java.util.HashMap;
import java.util.List;

public interface BoardDaoInterface {
	
	// 삽입
//	public HashMap<String, Object> BoardInsert(HashMap<String, Object> paramMap);
	
	// 수정
//	public HashMap<String, Object> BoardUpdate(HashMap<String, Object> paramMap);
	
	// 삭제
//	public HashMap<String, Object> BoardDelete(HashMap<String, Object> paramMap);
	
	// 선택
	public List<HashMap<String, Object>> BoardSelect(HashMap<String, Object> paramMap);
	
	

}
