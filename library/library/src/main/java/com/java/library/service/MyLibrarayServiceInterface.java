package com.java.library.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MyLibrarayServiceInterface {

	public Map<String, Object> myLibrarySelect(Map<String, Object> paramMap, HttpSession session);

}
