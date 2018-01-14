package com.java.library.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInterface {
	
	
	@Resource(name = "sqlSession")
	SqlSession session;

	// 삽입
	@Override
	public int boardInsert(Map<String, Object> paramMap) {
		return session.insert("board.insert", paramMap);
	}

	// 수정
//	@Override
//	public HashMap<String, Object> BoardUpdate(HashMap<String, Object> paramMap) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	//삭제
//	@Override
//	public HashMap<String, Object> BoardDelete(HashMap<String, Object> paramMap) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	// 선택
	@Override
	public List<Map<String, Object>> boardSelect(Map<String, Object> paramMap) {
		return session.selectList("board.select", paramMap);
	}

}
