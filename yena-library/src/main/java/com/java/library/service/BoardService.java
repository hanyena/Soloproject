package com.java.library.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {
	
	@Autowired
	BoardDaoInterface bdi;
	
	Map<String, Object> map;

	@Override
	public Map<String, Object> boardSelect(Map<String, Object> paramMap) {
		map = new HashMap<String, Object>();
		map.put("board", bdi.boardSelect(paramMap));
		return map;
	}

	@Override
	public Map<String, Object> boardInsert(Map<String, Object> paramMap) {
		map = new HashMap<String, Object>();
		// 삽입이 됐을 경우 1, 실패 시 0 반환
		int rstInsertCnt = bdi.boardInsert(paramMap);
		map.put("rstInsertCnt", rstInsertCnt);
		return map;
	}

}
