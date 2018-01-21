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

import com.java.library.util.Util;
import com.java.library.util.social.naver.NaverLogin;
import com.java.library.util.social.naver.NaverProfile;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/api/")
public class ApiController{


	
	@RequestMapping(value="naverProc.do")
	/**
	 * 
	 * @param req
	 * @param res
	 * @param session
	 * @param paramMap
	 * @param mav
	 * @return
	 */
	public String naverLoginProc(HttpServletRequest req, HttpServletResponse res, HttpSession session, @RequestParam Map<String,Object> paramMap, ModelAndView mav) throws UnsupportedEncodingException {
		JSONObject nProfileToken = NaverLogin.callbackAPIURL(paramMap,mav);
		System.out.println("네이버 토큰 : " + nProfileToken);
		NaverProfile.tokenRefresh(nProfileToken, session);
		return "redirect:naverSuccess.do";
	}
	
	@RequestMapping(value="naverSuccess.do")
	/**
	 * 
	 * @param req
	 * @param res
	 * @param session
	 * @param paramMap
	 * @param mav
	 * @return
	 */
	public ModelAndView naverLoginSuccess(HttpServletRequest req, HttpServletResponse res, HttpSession session, @RequestParam Map<String,Object> paramMap, ModelAndView mav) throws UnsupportedEncodingException {
		JSONObject obj = NaverLogin.getProfile(session);
		System.out.println(obj.toString());
		if(obj.getString("resultcode").equalsIgnoreCase("00") && obj.getString("message").equalsIgnoreCase("success")) {
			mav.setViewName("/account/naver_success");
			JSONObject memberObjData = obj.getJSONObject("response");
			memberObjData.put("id", Util.covertEmailToId(memberObjData.getString("email")));
			NaverProfile.memberDataReset(memberObjData, session);
		} else if(obj.getString("resultcode").equalsIgnoreCase("024") && obj.getString("message").contains("failed")) {
			mav.setViewName("/main/alert");
			mav.addObject("message",obj.getString("message"));	
			mav.addObject("status","Y");
		}
		NaverProfile nProfile = NaverProfile.getSessionNaverProfile(session);
		
		
		System.out.println(nProfile);
		return mav;
	}
}

