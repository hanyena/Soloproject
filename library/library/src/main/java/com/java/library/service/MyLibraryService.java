package com.java.library.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.library.dao.BoardDaoInterface;
import com.java.library.dao.MyLibraryDaoInterface;
import com.java.library.util.social.naver.NaverProfile;

@Service
public class MyLibraryService implements MyLibrarayServiceInterface {
	
	
	@Autowired
	MyLibraryDaoInterface mldi;
	Map<String, Object> rstMap;
	

	@Override
	public Map<String, Object> myLibrarySelect(Map<String, Object> paramMap,HttpSession session) {
		rstMap = new HashMap<String, Object>();
		
		NaverProfile nProfile = NaverProfile.getSessionNaverProfile(session);
		paramMap.put("member_id", nProfile.getId());

		rstMap.put("rent", mldi.myLibrarySelect(paramMap));
		return rstMap;
	}

}
