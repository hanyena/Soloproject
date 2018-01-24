package com.java.library.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.MemberServiceInterface;
import com.java.library.util.Util;
import com.java.library.util.social.naver.NaverLogin;
import com.java.library.util.social.naver.NaverProfile;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/api/")
public class ApiController {

	@Autowired
	MemberServiceInterface msi;

	Map<String, Object> rstMap;

	@RequestMapping(value = "naverProc.do")
	/**
	 * 
	 * @param req
	 * @param res
	 * @param session
	 * @param paramMap
	 * @param mav
	 * @return
	 */
	// 진행중...(본격적으로 로그인 실행하는중)
	public String naverLoginProc(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			@RequestParam Map<String, Object> paramMap, ModelAndView mav) throws UnsupportedEncodingException {
		JSONObject nProfileToken = NaverLogin.callbackAPIURL(paramMap, mav);
		System.out.println("네이버 토큰 : " + nProfileToken);
		NaverProfile.tokenRefresh(nProfileToken, session);
		return "redirect:naverSuccess.do";
	}

	@RequestMapping(value = "naverSuccess.do")
	/**
	 * 
	 * @param req
	 * @param res
	 * @param session
	 * @param paramMap
	 * @param mav
	 * @return
	 */
	// 로그인이 완료됐을 때 값을 가져오고 저장
	public ModelAndView naverLoginSuccess(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			@RequestParam Map<String, Object> paramMap, ModelAndView mav) throws UnsupportedEncodingException {
		JSONObject obj = NaverLogin.getProfile(session);
		System.out.println(obj.toString());
		if (obj.getString("resultcode").equalsIgnoreCase("00")
				&& obj.getString("message").equalsIgnoreCase("success")) {
			mav.setViewName("/account/naver_success");
			JSONObject memberObjData = obj.getJSONObject("response");
			memberObjData.put("id", Util.covertEmailToId(memberObjData.getString("email")));
			// 개인 정보를 받아오기 위한 
			NaverProfile.memberDataReset(memberObjData, session);
		} else if (obj.getString("resultcode").equalsIgnoreCase("024") && obj.getString("message").contains("failed")) {
			mav.setViewName("/main/alert");
			mav.addObject("message", obj.getString("message"));
			mav.addObject("status", "Y");
		}
		// session이 있을 경우 알아서 네이버 정보를 우리 서버에서 꺼내옴
		NaverProfile nProfile = NaverProfile.getSessionNaverProfile(session);
		// ip 가져오기
		nProfile.setIp(req.getRemoteAddr());
		// setSessionNaverProfile: session에 다시 저장
		NaverProfile.setSessionNaverProfile(nProfile, session);

		// 로그인한 회원정보를 삽입
		msi.insertMember(nProfile);
		System.out.println(nProfile);
		return mav;
	}

	@RequestMapping(value = "naverlogout.do")
	/**
	 * 
	 * @param req
	 * @param res
	 * @param session
	 * @param paramMap
	 * @param mav
	 * @return
	 */
	public ModelAndView naverLogout(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			@RequestParam Map<String, Object> paramMap, ModelAndView mav) throws UnsupportedEncodingException {
		// 우리 서버 로그아웃
		session.invalidate();
		// 네이버 로그아웃 페이지로 이동
		mav.setViewName("redirect:https://nid.naver.com/nidlogin.logout");
		return mav;
	}
}
