package com.java.library.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao implements MemberDaoInterface {
	
	private static final String NS = "member.";
	
	@Autowired
	SqlSession session;

	@Override
	public Map<String, Object> getMemberOne(Map<String, Object> paramMap) {
		return session.selectOne(NS+"getMemberOne",paramMap);
	}


}
