package com.java.library.util.social.naver;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

public class NaverLogin {
	public static final String CLIENT_ID = "qaDsBz29qTp5KqA2mbJZ";
	public static final String CLIENT_SECRET = "JFdVdFSh0j";
	public static final String SETTING_NAVER_API_URL = "NAVER_API_URL";

	/**
	 * 
	 * @author yenaHan 로그인 요청
	 * @param code
	 *            : 네이버 아이디로 로그인 인증에 성공하면 반환받는 인증 코드, 접근 토큰(access token) 발급에 사용
	 * @param state
	 *            : 사이트 간 요청 위조 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰으로 URL 인코딩을 적용한 값
	 * @param error
	 *            : 네이버 아이디로 로그인 인증에 실패하면 반환받는 에러 코드
	 * @param error_description
	 *            : 네이버 아이디로 로그인 인증에 실패하면 반환받는 에러 메시지
	 */
	// 토큰이 나옴
	public static String startRequestAPIURL(ModelAndView mav, HttpSession session) throws UnsupportedEncodingException {
		String redirectURI = URLEncoder.encode("http://localhost:8080/api/naverProc.do", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + CLIENT_ID;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
		mav.addObject(SETTING_NAVER_API_URL, apiURL);
		return apiURL;
	}

	/**
	 * 
	 * @author yenaHan 접근토큰 발급 요청 expires_in만 Integer 나머지 String
	 * @param access_token
	 *            :접근 토큰, 발급 후 expires_in 파라미터에 설정된 시간(초)이 지나면 만료됨
	 * @param refresh_token
	 *            :갱신 토큰, 접근 토큰이 만료될 경우 접근 토큰을 다시 발급받을 때 사용
	 * @param token_type
	 *            :접근 토큰의 타입으로 Bearer와 MAC의 두 가지를 지원
	 * @param expires_in
	 *            :접근 토큰의 유효 기간(초 단위)
	 * @param error
	 *            :에러 코드
	 * @param error_description
	 *            :에러 메시지
	 */
	// callbackAPIURL : 토큰 받은 걸로  로그인 요청을 하고 나서 되돌려 받음
	// 네이버 로그인 했다고 등록함
	public static JSONObject callbackAPIURL(Map<String, Object> paramMap, ModelAndView mav)
			throws UnsupportedEncodingException {
		JSONObject obj = null;
		String code = paramMap.get("code").toString();
		String state = paramMap.get("state").toString();
		String redirectURI = URLEncoder.encode("http://localhost:8080/api/naverSuccess.do", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + CLIENT_ID;
		apiURL += "&client_secret=" + CLIENT_SECRET;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		System.out.println("apiURL=" + apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				sb.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				obj = JSONObject.fromObject(sb.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return obj;
	}
	// 로그인 완료 된 후에 실행되는 정보 수집 
	public static JSONObject getProfile(HttpSession session) {
		NaverProfile nProfile = null;
		JSONObject obj = null;
		if (session != null) {
			nProfile = NaverProfile.getSessionNaverProfile(session);
			if(nProfile != null) {
				String token = nProfile.getAccessToken();// 네이버 로그인 접근 토큰;
				String header = "Bearer " + token; // Bearer 다음에 공백 추가
				try {
					String apiURL = "https://openapi.naver.com/v1/nid/me";
					URL url = new URL(apiURL);
					HttpURLConnection con = (HttpURLConnection) url.openConnection();
					con.setRequestMethod("GET");
					con.setRequestProperty("Authorization", header);
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
					obj = JSONObject.fromObject(response.toString());
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		} 
		return obj;
	}
}
