package com.java.library.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardDaoInterface {
	
	// 게시글 삽입
	public int boardInsert(Map<String, Object> paramMap);
	
	// 게시글 수정
	public int boardUpdate(Map<String, Object> paramMap);
	
	// 게시글 삭제
	public int boardDelete(Map<String, Object> paramMap);
	
	// 게시글 목록 조회
	public List<Map<String, Object>> boardSelect(Map<String, Object> paramMap);
	
    // 게시글 1개 조회
	public Map<String, Object> boardSelectOne(Map<String, Object> paramMap);
	
	

}
