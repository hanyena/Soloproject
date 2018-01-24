package com.java.library.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.library.util.social.naver.NaverLibrarySearch;

@Repository
public class DataDao implements DataDaoInterface {
	
	private static final String NS = "data.";
	
	@Resource(name = "sqlSession")
	SqlSession session;

	// 추천도서페이지  목록 가져오기
	@Override
	public List<Map<String, Object>> recommendSelect(Map<String, Object> paramMap) {
		return session.selectList(NS+"recommendselect", paramMap);
	}
	
	// 추천도서 상세페이지 데이터 가져오기
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap) {
		return session.selectOne(NS+"recommendviewselect", paramMap);
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

	// 도서 검색 단어 조회
	@Override
	public int searchhistory(Map<String, Object> paramMap) {
		return session.selectOne(NS+"searchhistory", paramMap);
	}

	// 도서 검색 단어 삽입
	@Override
	public int insertSearchWord(Map<String, Object> paramMap) {
		return session.insert(NS+"insertsearchword", paramMap);
	}
	
    // 도서 정보 삽입
	@Override
	public void insertLibrary(NaverLibrarySearch nLibrary) {
		session.insert(NS+"insertlibrary", nLibrary);
	}

	// 메인화면에 추천도서 1개 가져오기
	@Override
	public Map<String, Object> mainRecommend(Map<String, Object> paramMap) {
		return session.selectOne(NS+"mainrecommend", paramMap);
	}

	// 대여할 책 rentlibrary에 삽입
	@Override
	public int borrowBookInsert(Map<String, Object> paramMap) {
		return session.insert(NS+"borrowbookinsert", paramMap);
	}

	@Override
	public List<Map<String, Object>> mainBestView(Map<String, Object> paramMap) {
		return session.selectList(NS+"mainbestview", paramMap);
	}

}
