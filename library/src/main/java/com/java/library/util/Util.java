package com.java.library.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class Util {

	private static final Logger logger = Logger.getLogger(Util.class);

	public static Map<String, Object> paging(int pageNum, int pageLimitCnt, int limitCnt, int totalCnt) {
		Map<String,Object> rstMap = new HashMap<String,Object>();
		int page = pageNum;
		if(pageNum == 0) {
			pageNum =1;
		}
		//1페이지당 출력 갯수
		int countList = limitCnt;
		//출력할 페이지  번호 갯수  ex) 1- 10 페이지만 보임  11 -20 페이지 보임
		int countPage = pageLimitCnt;
		//총갯수
		int totalCount = totalCnt;
		
		int totalPage = totalCount / countList;
		if (totalCount % countList > 0) {
			totalPage++;
		}
		if (totalPage < page) {
			page = totalPage;
		}
		int startPage = ((page - 1) / 10) * 10 + 1;
		int endPage = startPage + countPage - 1;
		
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		if (startPage > 1) {
			startPage = 1;
		}
		if (page > 1) {
			page = page -1;
		}
		if (page < totalPage) {
			page = page +1;
		}
		if (endPage < totalPage) {
			endPage = totalPage;
		}

		int startrow = (page - 1) * countList + 1;
		int endrow = startrow + countList - 1;
		
		rstMap.put("page", page);
		rstMap.put("countList", countList);
		rstMap.put("countPage", countPage);
		rstMap.put("totalCount", totalCount);
		rstMap.put("totalPage", totalPage);
		rstMap.put("startPage", startPage);
		rstMap.put("endPage", endPage);
		rstMap.put("startrow", startrow);
		rstMap.put("endrow", endrow);
		return rstMap;
	}

	public static void main(String[] args) {
		System.out.println(">>>>>>>");
		System.out.println(paging(2, 10,10, 51));
	}
}
