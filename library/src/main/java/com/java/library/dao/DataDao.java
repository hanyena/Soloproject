package com.java.library.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DataDao implements DataDaoInterface {
	
	private static final String NS = "data.";
	
	@Resource(name = "sqlSession")
	SqlSession session;

	// 추천도서 데이터 목록 가져오기
	@Override
	public List<Map<String, Object>> recommendSelect(Map<String, Object> paramMap) {
		return session.selectList(NS+"recommendselect", paramMap);
	}

	// 추천도서 상세페이지 데이터(1개) 가져오기
	@Override
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap) {
		return session.selectOne(NS+"recommendselect", paramMap);
	}
	
	

}
