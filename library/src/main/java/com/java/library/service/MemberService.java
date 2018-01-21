package com.java.library.service;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.BoardDaoInterface;
import com.java.library.dao.MemberDaoInterface;
import com.java.library.util.social.naver.NaverProfile;

@Service
public class MemberService implements MemberServiceInterface {
	@Autowired
	MemberDaoInterface mdi;

	Map<String,Object> rstMap;

	// 로그인한 회원정보를 삽입 (+수정, 선택)
	@Override
	public void insertMember(NaverProfile nProfile) {
		NaverProfile np = mdi.selectMember(nProfile);
		if(np != null) {
			mdi.insertMember(nProfile);
		} else {
			mdi.updateMember(nProfile);
		}
	}
	
//	@Override
//	public Map<String, Object> getMember(Map<String, Object> paramMap) {
//		
//		rstMap = mdao.getMemberOne(paramMap);
//		
//		if(rstMap != null) {
//			rstMap.put("code", 200);
//			rstMap.put("result", "회원조회 성공하였습니다.");
//		} else {
//			rstMap.put("code", 500);
//			rstMap.put("result", "해당하는 회원이 없습니다. 가입 또는 아이디 비밀번호 찾기를 이용하시기 바랍니다.");
//		}
//		return rstMap;
//	}
	
	

}
