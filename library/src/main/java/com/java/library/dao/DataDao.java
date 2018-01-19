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

	// 추천도서페이지, 상세페이지 데이터 목록 가져오기
	@Override
	public List<Map<String, Object>> recommendSelect(Map<String, Object> paramMap) {
		return session.selectList(NS+"recommendselect", paramMap);
	}

	// 신간안내 데이터 목록 가져오기
	@Override
	public List<Map<String, Object>> newbookSelect(Map<String, Object> paramMap) {
		return session.selectList(NS+"newbookselect", paramMap);
	}

	// 도서검색 데이터 목록 가져오기
	@Override
	public List<Map<String, Object>> searchSelect(Map<String, Object> paramMap) {
		return session.selectList(NS+"searchselect", paramMap);
	}

	
	// 도서 데이터 총 갯수 조회 (페이징용)
	@Override
	public int bookCntSelect(Map<String, Object> paramMap) {
		return session.selectOne(NS+"bookcntselect", paramMap);
	}

	
	

}
