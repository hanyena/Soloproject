package com.java.library.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.DataDaoInterface;
import com.java.library.util.social.naver.NaverLibrarySearch;
import com.java.library.util.social.naver.NaverProfile;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Service
public class DataService implements DataServiceInterface {
	
	@Autowired
	DataDaoInterface ddi;
	
	Map<String, Object> rstMap;

	// 추천도서페이지 데이터 목록 가져오기
	@Override
	public Map<String, Object> recommendSelect(Map<String, Object> paramMap){
		rstMap = new HashMap<String, Object>();
		rstMap.put("recommend", ddi.recommendSelect(paramMap));
		System.out.println(rstMap);
		return rstMap;
	}
	
	// 추천도서 상세페이지 데이터 목록 가져오기
	@Override
	public Map<String, Object> recommendViewSelect(Map<String, Object> paramMap){
		rstMap = new HashMap<String, Object>();
		rstMap.put("recommendview", ddi.recommendViewSelect(paramMap));
		return rstMap;
	}
	

	// 신간안내 데이터 목록 가져오기
	@Override
	public Map<String, Object> newbookSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();		
		
		if(StringUtils.isNotEmpty(paramMap.get("start").toString())) {
			paramMap.put("start", Integer.parseInt(paramMap.get("start").toString()));
		}
		if(StringUtils.isNotEmpty(paramMap.get("viewRow").toString())) {
			paramMap.put("viewRow", Integer.parseInt(paramMap.get("viewRow").toString()));
		}
		rstMap.put("newbook", ddi.newbookSelect(paramMap));
		// 페이징하기 위한 게시물 총 갯수
		rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
		return rstMap;
	}
	

	// 도서 검색 데이터 목록 가져오기
	@Override
	public Map<String, Object> searchSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		
		// var로 선언된 변수들을 int형으로 바꿔줌 => sql문에서 limit가 숫자를 받기 때문(#)
		if(StringUtils.isNotEmpty(paramMap.get("start").toString())) {
			paramMap.put("start", Integer.parseInt(paramMap.get("start").toString()));
		}
		if(StringUtils.isNotEmpty(paramMap.get("viewRow").toString())) {
			paramMap.put("viewRow", Integer.parseInt(paramMap.get("viewRow").toString()));
		}
		// 검색 단어 조회 결과 받기 (반환값 : 자료가 있으면 1, 없으면 0)
		int rstSearch = ddi.searchhistory(paramMap);
		// 자료가 있을 시 library테이블에서 조회에서 데이터 가져오기
		if(rstSearch > 0) {
			rstMap.put("search", ddi.searchSelect(paramMap));
			// 페이징하기 위한 게시물 총 갯수
			rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
			
	    // 자료가 없을 시 searchhistory테이블에 검색한 단어 삽입
		}else {
			ddi.insertSearchWord(paramMap);
			//네이버 도서검색 API를 이용한 검색결과 조회
			JSONObject rstNaverLibraryList = NaverLibrarySearch.dataLabGetLibrary(paramMap);
			if(rstNaverLibraryList.getInt("total") == 1) {
				JSONObject oneLibrary = rstNaverLibraryList.getJSONObject("item");
				NaverLibrarySearch nLibrary = new NaverLibrarySearch(oneLibrary);
				try {
					ddi.insertLibrary(nLibrary);
				} catch (Exception e) {}
			} else {
				JSONArray arr = rstNaverLibraryList.getJSONArray("item");
				for(Object obj : arr) {
					JSONObject library = (JSONObject)obj;
					NaverLibrarySearch nLibrary = new NaverLibrarySearch(library);
					System.out.println(nLibrary);
					// DB에 값이 있을 경우 예외처리
					try {
						ddi.insertLibrary(nLibrary);
					} catch (Exception e) {
						continue;
					}
				}
			}
			// 네이버 책 DB 삽입 완료 
			rstMap.put("search", ddi.searchSelect(paramMap));
			// 페이징하기 위한 게시물 총 갯수
			rstMap.put("bookCnt", ddi.bookCntSelect(paramMap));
		}

		return rstMap;
	}

	

}
