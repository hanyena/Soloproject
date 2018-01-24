package com.java.library.service;

import java.util.Map;

import com.java.library.util.social.naver.NaverProfile;

public interface MemberServiceInterface {

	// 로그인한 회원정보를 삽입 (+수정, 선택)
	public void insertMember(NaverProfile nProfile);

}
