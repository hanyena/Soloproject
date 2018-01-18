package com.java.library.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInterface {
	
	private static final String NS = "board.";
	
	@Resource(name = "sqlSession")
	SqlSession session;

	// 게시판 삽입
	@Override
	public int boardInsert(Map<String, Object> paramMap) {
		return session.insert(NS+"insert", paramMap);
	}

	// 게시판삭제
	@Override
	public int boardDelete(Map<String, Object> paramMap) {
		return session.update(NS+"delete", paramMap);
	}

	// 게시판 선택
	@Override
	public List<Map<String, Object>> boardSelect(Map<String, Object> paramMap) {
		return session.selectList(NS+"select", paramMap);
	}

	// 게시글 1개 조회
	@Override
	public Map<String, Object> boardSelectOne(Map<String, Object> paramMap) {
		return session.selectOne(NS+"selectOne", paramMap);
	}

	// 게시판 수정
	@Override
	public int boardUpdate(Map<String, Object> paramMap) {
		return session.update(NS+"update", paramMap);
	}

	// 게시판 글 총 갯수
	@Override
	public int boardCntSelect(Map<String, Object> paramMap) {
		return session.selectOne(NS+"boardcntSelect", paramMap);
	}

}
