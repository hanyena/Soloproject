package com.java.library.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyLibraryDao implements MyLibraryDaoInterface {
	
private static final String NS = "mylibrary.";
	
	@Resource(name = "sqlSession")
	SqlSession session;

	@Override
	public List<Map<String, Object>> myLibrarySelect(Map<String, Object> paramMap) {
		return session.selectList(NS+"mylibraryselect", paramMap);
	}


}
