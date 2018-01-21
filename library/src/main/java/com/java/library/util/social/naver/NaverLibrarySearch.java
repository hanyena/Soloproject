package com.java.library.util.social.naver;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.xml.ws.Response;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.json.XML;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class NaverLibrarySearch {
	public static final String CLIENT_ID = "SPL3vA6BqiE0_5piMOVG";
	public static final String CLIENT_SECRET = "dZnzzcEk9Q";
	public static final String SETTING_NAVER_API_URL = "NAVER_API_LIBRARY";
	public static String NAVER_DATALAB_API_URL_JSON = "https://openapi.naver.com/v1/search/book";

	
	public static void dataLabGetLibrary(Map<String,Object> paramMap) {
		String startYear = "";
		String endYear = "";
		String keyField = "";
		String keyWord = "";
		String orderType = "";
		String arraycondition = "";
		/**
		 * @param arraycondition
		 *  - bookname 도서명
		 *  - author 저자
		 *  - publisher 출판사
		 */
		try {
			
			startYear = paramMap.get("startyear").toString();
			endYear = paramMap.get("endyear").toString();
			keyWord = paramMap.get("keyWord").toString();
			arraycondition = paramMap.get("arraycondition").toString();
			
			// String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+ text;
			// // json 결과
			String apiURL = "https://openapi.naver.com/v1/search/book_adv.xml"; 

			
			switch(arraycondition) {
			//도서조건
			case "bookname" :
				keyField = "d_titl";
				break;
			//저자조건
			case "author" :
				keyField = "d_auth";
				break;
			//출판사 조건
			case "publisher" :
				keyField = "d_publ";
				break;
			}
			System.out.println(keyWord);
			if(StringUtils.isNotEmpty(keyWord)) {
				apiURL += "?"+keyField + "="+URLEncoder.encode(keyWord, "UTF-8");
			}
			
			if(StringUtils.isNotEmpty(startYear)) {
				apiURL += "&d_dafr="+startYear;
			}
			
			if(StringUtils.isNotEmpty(endYear)) {
				apiURL += "&d_dato="+endYear;
			}
			
			System.out.println(apiURL);
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
			con.setRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			org.json.JSONObject jsonObj = XML.toJSONObject(response.toString());
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			JsonParser jp = new JsonParser();
			JsonElement je = jp.parse(jsonObj.toString());
			String pretty = gson.toJson(je);
			 System.out.println(gson.toJson(je));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}
	
	public static void main(String[] args) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("startyear", "20101201");
		paramMap.put("endyear", "20180101");
		paramMap.put("arraycondition", "bookname");
		paramMap.put("keyWord", "웬만해선 아무렇지 않다");
		dataLabGetLibrary(paramMap);
	}
}