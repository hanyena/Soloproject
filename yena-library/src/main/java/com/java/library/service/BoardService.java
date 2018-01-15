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
	
	Map<String, Object> rstMap;

	// 게시판 목록 가져오기
	@Override
	public Map<String, Object> boardSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		rstMap.put("board", bdi.boardSelect(paramMap));
		return rstMap;
	}

	// 게시판 글쓰기
	@Override
	public Map<String, Object> boardInsert(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		// 삽입이 됐을 경우 1, 실패 시 0 반환
		int rstInsertCnt = bdi.boardInsert(paramMap);
		rstMap.put("rstType", rstInsertCnt==1?"성공":"실패");
		return rstMap;
	}

	// 게시판 글 삭제
	@Override
	public Map<String, Object> boardDelete(Map<String, Object> paramMap) {
		// 게시물 한개 받기 
		Map<String, Object> getBoardOne = bdi.boardSelectOne(paramMap);
		
		// delete후 결과 데이터
		rstMap = new HashMap<String,Object>();
//		Map<String,Object> userSession = (HashMap<String, Object>) paramMap.get("UserSession");
		
		//로그인 아직 미개발로 인해 아이디 직접 지정
		String id = "yena";
		
		// 받아온 getBoardOne에서 id값을 꺼내 로그인한 id값 비교
		if(getBoardOne.get("member_id").equals(id)) {
			int rstDeleteCnt = bdi.boardDelete(paramMap);
			if(rstDeleteCnt > 0) {
				rstMap.put("result", "글 삭제가 완료 되었습니다.");
			}else{
				rstMap.put("result", "글 삭제를 실패 하였습니다.");
			}
		}else {
			rstMap.put("error", "아이디가 동일하지 않습니다.");
		}
		return rstMap;
	}
	
	
	// 게시판 글 수정
	@Override
	public Map<String, Object> boardUpdate(Map<String, Object> paramMap){
		// 게시물 한개 받기(게시글이 누구 것인지 확인 하기 위한 )
		Map<String, Object> getBoardOne = bdi.boardSelectOne(paramMap);
		
		// update후 결과 데이터를 담을 변수
		rstMap = new HashMap<String,Object>();
		
		//로그인 아직 미개발로 인해 아이디 직접 지정
		String id = "yena";
		
		// 받아온 getBoardOne에서 id값을 꺼내 로그인한 id값 비교
		if(getBoardOne.get("id").equals(id)) {
			int rstUpdateCnt = bdi.boardUpdate(paramMap);
			if(rstUpdateCnt > 0){
				rstMap.put("result", "글 수정이 완료되었습니다.");
			}else{
				rstMap.put("result", "글 수정을 실패하였습니다.");
			}
		}else{
			rstMap.put("error", "아이디가 동일하지 않습니다.");
		}
		return rstMap;
	}

	// 게시물 한 개 목록 가져오기
	@Override
	public Map<String, Object> boardSelectOne(Map<String, Object> paramMap) {
		rstMap = bdi.boardSelectOne(paramMap);
		return rstMap;
	}

}
