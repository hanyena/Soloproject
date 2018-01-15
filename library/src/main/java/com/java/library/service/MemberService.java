package com.java.library.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.BoardDaoInterface;
import com.java.library.dao.MemberDaoInterface;

@Service
public class MemberService implements MemberServiceInterface {
	@Autowired
	MemberDaoInterface mdao;

	Map<String,Object> rstMap;
	
	@Override
	public Map<String, Object> getMember(Map<String, Object> paramMap) {
		
		rstMap = mdao.getMemberOne(paramMap);
		
		if(rstMap != null) {
			rstMap.put("code", 200);
			rstMap.put("result", "회원조회 성공하였습니다.");
		} else {
			rstMap.put("code", 500);
			rstMap.put("result", "해당하는 회원이 없습니다. 가입 또는 아이디 비밀번호 찾기를 이용하시기 바랍니다.");
		}
		return rstMap;
	}
	
	

}
