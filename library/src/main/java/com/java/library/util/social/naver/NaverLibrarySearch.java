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
import org.json.XML;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import net.sf.json.JSONObject;

public class NaverLibrarySearch {
	public static final String CLIENT_ID = "SPL3vA6BqiE0_5piMOVG";
	public static final String CLIENT_SECRET = "dZnzzcEk9Q";
	public static final String SETTING_NAVER_API_URL = "NAVER_API_LIBRARY";
	public static String NAVER_DATALAB_API_URL_JSON = "https://openapi.naver.com/v1/search/book";

	private String image = "";
	private String author = "";
	private String price = "";
	private String isbn = "";
	private String link = "";
	private String discountprice = "";
	private String publisher = "";
	private String description = "";
	private String title = "";
	private String pubdate = "";
	
	
	public NaverLibrarySearch(JSONObject obj) {
		                          // 네이버에서 검색한 결과들
		if(StringUtils.isNotEmpty(obj.getString("image"))) {
			this.image = obj.getString("image");
		}
		
		if(StringUtils.isNotEmpty(obj.getString("author"))) {
			this.author = obj.getString("author");
		}
		
		if(StringUtils.isNotEmpty(obj.getString("price"))) {
			this.price = obj.getString("price");
		}
		
		if(StringUtils.isNotEmpty(obj.getString("isbn"))) {
			this.isbn = obj.getString("isbn");
		}
		
		if(StringUtils.isNotEmpty(obj.getString("link"))) {
			this.link = obj.getString("link");
		}
		
		if(StringUtils.isNotEmpty(obj.getString("discount"))) {
			this.discountprice = obj.getString("discount");
		}
		
		if(StringUtils.isNotEmpty(obj.getString("publisher"))) {
			this.publisher = obj.getString("publisher");
		}
	
		if(StringUtils.isNotEmpty(obj.getString("description"))) {
			this.description = obj.getString("description");
		}
		
		if(StringUtils.isNotEmpty(obj.getString("title"))) {
			this.title = obj.getString("title");
		}	
		
		if(StringUtils.isNotEmpty(obj.getString("pubdate"))) {
			this.pubdate = obj.getString("pubdate");
		}	
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDiscountprice() {
		return discountprice;
	}

	public void setDiscountprice(String discountprice) {
		this.discountprice = discountprice;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public static String getClientId() {
		return CLIENT_ID;
	}

	public static String getClientSecret() {
		return CLIENT_SECRET;
	}

	public static String getSettingNaverApiUrl() {
		return SETTING_NAVER_API_URL;
	}
	
	@Override
	public String toString() {
		return "NaverLibrarySearch [image=" + image + ", author=" + author + ", price=" + price + ", isbn=" + isbn
				+ ", link=" + link + ", Discountprice=" + discountprice + ", publisher=" + publisher + ", description="
				+ description + ", title=" + title + ", pubdate=" + pubdate + "]";
	}

	// 네이버에 책에 검색을 하여 데이터를 요청하고 결과를 받아옴
	public static JSONObject dataLabGetLibrary(Map<String,Object> paramMap) {
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
//			String pretty = gson.toJson(je);
//			System.out.println(gson.toJson(je));
			JSONObject convertObj = JSONObject.fromObject(gson.toJson(je));
			convertObj = convertObj.getJSONObject("rss");
			convertObj = convertObj.getJSONObject("channel");
			return convertObj;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return null;
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