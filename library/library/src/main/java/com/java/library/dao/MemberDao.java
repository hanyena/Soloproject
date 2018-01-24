package com.java.library.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.library.util.social.naver.NaverProfile;

@Repository
public class MemberDao implements MemberDaoInterface {
	
	private static final String NS = "member.";
	
	@Autowired
	SqlSession session;

	// 로그인한 회원정보를 삽입
	@Override
	public int insertMember(NaverProfile nProfile) {
		 return session.insert(NS + "insert", nProfile);
	}

	// 로그인한 회원정보를 수정
	@Override
	public int updateMember(NaverProfile nProfile) {
		return session.update(NS + "update", nProfile);
		
	}

	@Override
	public NaverProfile selectMember(NaverProfile nProfile) {
		return session.selectOne(NS + "select", nProfile);
	}




}
