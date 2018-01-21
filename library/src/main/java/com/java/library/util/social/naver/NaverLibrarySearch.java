package com.java.library.util.social.naver;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.ws.Response;

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

   public static void dataLabGetLibrary() {
           try {
               String text = URLEncoder.encode("비트", "UTF-8");
//               String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+ text; // json 결과
               String apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?d_titl="+ text; // xml 결과
               URL url = new URL(apiURL);
               HttpURLConnection con = (HttpURLConnection)url.openConnection();
               con.setRequestMethod("GET");
               con.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
               con.setRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);
               int responseCode = con.getResponseCode();
               BufferedReader br;
               if(responseCode==200) { // 정상 호출
                   br = new BufferedReader(new InputStreamReader(con.getInputStream()));
               } else {  // 에러 발생
                   br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
               }
               String inputLine;
               StringBuffer response = new StringBuffer();
               while ((inputLine = br.readLine()) != null) {
                   response.append(inputLine);
               }
               br.close();
               System.out.println(response.toString());
              org.json.JSONObject jsonObj = XML.toJSONObject(response.toString());

              System.out.println(jsonObj.toString());
              
              
              Gson gson = new GsonBuilder().setPrettyPrinting().create();
              JsonParser jp = new JsonParser();
              JsonElement je = jp.parse(jsonObj.toString());
              String pretty =gson.toJson(je);
              System.out.println(pretty);
              
           } catch (Exception e) {
               System.out.println(e);
           }
           
   }
   public static void main(String[] args) {
      dataLabGetLibrary();
      
   }
}