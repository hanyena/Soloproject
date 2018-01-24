package com.java.library.dao;


import com.java.library.util.social.naver.NaverProfile;

public interface MemberDaoInterface {

	// 로그인한 회원정보를 삽입
	public int insertMember(NaverProfile nProfile);

	// 로그인한 회원정보를 수정
	public int updateMember(NaverProfile nProfile);

	// 회원 정보 가져오기
	public NaverProfile selectMember(NaverProfile nProfile);


}
