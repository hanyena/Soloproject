package com.java.library.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {
	
	@Autowired
	BoardDaoInterface bdi;
	
	HashMap<String, Object> map;

	@Override
	public HashMap<String, Object> BoardSelect(HashMap<String, Object> paramMap) {
		map = new HashMap<String, Object>();
		map.put("board", bdi.BoardSelect(paramMap));
		return map;
	}

}
