package com.java.library.util.social.naver;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

public class NaverProfile {

	private String resultCode = "";
	private String message = "";
	private String id = "";
	private String nickName = "";
	private String name = "";
	private String email = "";
	private String gender = "";
	private String age = "";
	private String birthday = "";
	private String profileImage = "";
	private String accessToken = "";
	private String refreshToken = "";
	private String typeToken = "";
	private Integer expires_in = 0;
	public static final String SESSIONNAME = "UserSession";
	
	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	
	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	
	public String getTypeToken() {
		return typeToken;
	}

	public void setTypeToken(String typeToken) {
		this.typeToken = typeToken;
	}

	public Integer getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(Integer expires_in) {
		this.expires_in = expires_in;
	}

	@Override
	public String toString() {
		return "NaverProfile [resultCode=" + resultCode + ", message=" + message + ", id=" + id + ", nickName="
				+ nickName + ", name=" + name + ", email=" + email + ", gender=" + gender + ", age=" + age
				+ ", birthday=" + birthday + ", profileImage=" + profileImage + ", accessToken=" + accessToken
				+ ", refreshToken=" + refreshToken + ", typeToken=" + typeToken + ", expires_in=" + expires_in + "]";
	}
	
	public static void setSessionNaverProfile(NaverProfile nProfile,HttpSession session) {
		if( session !=null && nProfile != null) {
			session.setAttribute(SESSIONNAME, nProfile);
		}
	}
	public static NaverProfile getSessionNaverProfile(HttpSession session) {
		return (NaverProfile) session.getAttribute(SESSIONNAME);
	}
	
	/**
	 * 
	 * @author yenaHan
	 * 접근토큰 갱신 요청
	 * expires_in만 Integer 나머지 String
	 * @param access_token		:접근 토큰, 발급 후 expires_in 파라미터에 설정된 시간(초)이 지나면 만료됨
	 * @param token_type		:접근 토큰, 발급 후 expires_in 파라미터에 설정된 시간(초)이 지나면 만료됨
	 * @param expires_in		:접근 토큰의 유효 기간(초 단위)
	 * @param error				:에러 코드
	 * @param error_description	:에러 메시지
	 */
	public static void memberDataReset(JSONObject obj, HttpSession session) {
		//https://nid.naver.com/oauth2.0/token?grant_type=refresh_token&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&refresh_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLn
		//신규회원인경우
		if(obj != null && NaverProfile.getSessionNaverProfile(session) != null) {
			NaverProfile nProfile = new NaverProfile();
			
			if(StringUtils.isNotEmpty(obj.getString("nickname"))) {
				nProfile.setNickName(obj.getString("nickname"));
			}
			
			if(StringUtils.isNotEmpty(obj.getString("id"))) {
				nProfile.setId(obj.getString("id"));
			}
			
			if(StringUtils.isNotEmpty(obj.getString("enc_id"))) {
			}
			
			if(StringUtils.isNotEmpty(obj.getString("profile_image"))) {
				nProfile.setProfileImage(obj.getString("profile_image"));
			}
			
			if(StringUtils.isNotEmpty(obj.getString("age"))) {
				nProfile.setAge(obj.getString("age"));
			}
			
			if(StringUtils.isNotEmpty(obj.getString("gender"))) {
				nProfile.setGender(obj.getString("gender"));
			}
			
			if(StringUtils.isNotEmpty(obj.getString("name"))) {
				nProfile.setName(obj.getString("name"));
			}
			
			if(StringUtils.isNotEmpty(obj.getString("email"))) {
				nProfile.setEmail(obj.getString("email"));
			}

			if(StringUtils.isNotEmpty(obj.getString("birthday"))) {
				nProfile.setBirthday(obj.getString("birthday"));
			}
			setSessionNaverProfile(nProfile,session);
		}
	}
	
	/**
	 * 
	 * @author yenaHan
	 * 접근토큰 갱신 요청
	 * expires_in만 Integer 나머지 String
	 * @param access_token		:접근 토큰, 발급 후 expires_in 파라미터에 설정된 시간(초)이 지나면 만료됨
	 * @param token_type		:접근 토큰, 발급 후 expires_in 파라미터에 설정된 시간(초)이 지나면 만료됨
	 * @param expires_in		:접근 토큰의 유효 기간(초 단위)
	 * @param error				:에러 코드
	 * @param error_description	:에러 메시지
	 */
	public static void tokenRefresh(JSONObject obj, HttpSession session) {
		//https://nid.naver.com/oauth2.0/token?grant_type=refresh_token&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&refresh_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLn
		//신규회원인경우
		if(obj != null && NaverProfile.getSessionNaverProfile(session) == null) {
			NaverProfile nProfile = new NaverProfile();
			if(StringUtils.isNotEmpty(obj.getString("access_token"))) {
				nProfile.setAccessToken(obj.getString("access_token"));
			}
			if(StringUtils.isNotEmpty(obj.getString("refresh_token"))) {
				nProfile.setRefreshToken(obj.getString("refresh_token"));
			}
			if(StringUtils.isNotEmpty(obj.getString("token_type"))) {
				nProfile.setTypeToken(obj.getString("token_type"));
			}
			if(obj.getInt("expires_in") > 0) {
				nProfile.setExpires_in(obj.getInt("expires_in"));
			}
			setSessionNaverProfile(nProfile,session);
		} else {
			NaverProfile nProfile = getSessionNaverProfile(session);
			if(StringUtils.isNotEmpty(obj.getString("access_token"))) {
				nProfile.setAccessToken(obj.getString("access_token"));
			}
			if(StringUtils.isNotEmpty(obj.getString("refresh_token"))) {
				nProfile.setRefreshToken(obj.getString("refresh_token"));
			}
			if(StringUtils.isNotEmpty(obj.getString("token_type"))) {
				nProfile.setTypeToken(obj.getString("token_type"));
			}
			if(obj.getInt("expires_in") > 0) {
				nProfile.setExpires_in(obj.getInt("expires_in"));
			}
			setSessionNaverProfile(nProfile,session);
		}
	}
	
	
	/**
	 * 
	 * @author yenaHan
	 * 접근 토큰 삭제 요청
	 */
	public void tokenRemove() {
		//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=jyvqXeaVOVmV&client_secret=527300A0_COq1_XV33cf&access_token=c8ceMEJisO4Se7uGCEYKK1p52L93bHXLnaoETis9YzjfnorlQwEisqemfpKHUq2gY&service_provider=NAVER
	}

}
