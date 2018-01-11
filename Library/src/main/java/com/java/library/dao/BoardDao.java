package com.java.library.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInterface {
	
	
	@Resource(name = "sqlSession")
	SqlSession session;

	// 삽입
//	@Override
//	public HashMap<String, Object> BoardInsert(HashMap<String, Object> paramMap) {
//		
//		return null;
//	}

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
	public List<HashMap<String, Object>> BoardSelect(HashMap<String, Object> paramMap) {
		return session.selectList("board.select", paramMap);
	}

}
