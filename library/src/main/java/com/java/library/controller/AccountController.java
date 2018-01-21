package com.java.library.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.library.service.MemberServiceInterface;
import com.java.library.util.ConverterUtil;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping(value="/account/")
public class AccountController{

	@Autowired
	MemberServiceInterface msi;
	
	private static final String CLIENT_ID = "qaDsBz29qTp5KqA2mbJZ";
	private static final String CLIENT_SECRET = "JFdVdFSh0j";
	
	@RequestMapping(value="login.do",method=RequestMethod.GET) 
	@ResponseBody
	public String login(@RequestParam Map<String,Object> paramMap,HttpSession session) {
		Map<String,Object> userSessionMap = new HashMap<String,Object>();
		paramMap.put("id", "yena");
		paramMap.put("password", "yena456");
		session.setAttribute("UserSession", msi.getMember(paramMap));
		String plainString = JSONObject.fromObject(JSONSerializer.toJSON(session.getAttribute("UserSession"))).toString();
		String convertString = plainString.trim();
		System.out.println(plainString);
		System.out.println(convertString);
		return plainString;
	}
	@RequestMapping(value="login.do",method=RequestMethod.POST) 
	public String loginProcess(@RequestParam Map<String,Object> paramMap) {
		
		return "";
	}
	
	@RequestMapping(value="popup/login.do",method=RequestMethod.GET) 
	public ModelAndView popupLogin(ModelAndView mav,@RequestParam Map<String,Object> paramMap,HttpServletRequest req, HttpServletResponse res) {
		mav.setViewName("/account/popup/account_login");
		mav.addObject("port",req.getRemotePort());
		mav.addObject("hostname",req.getRemoteHost());
		mav.addObject("addr",req.getRemoteAddr());
		return mav;
	}
}