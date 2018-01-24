package com.java.library.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

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

import com.java.library.service.DataServiceInterface;
import com.java.library.util.social.naver.NaverLogin;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class SiteController{
	
	@Autowired
	DataServiceInterface dsi;
   
	// 'localhost:8080/' 접속 시  url매핑
	@RequestMapping("/")
	public String main(){
		return "redirect:/index.do";
	}   
	
   // 메인
   @RequestMapping("/index.do")
   public ModelAndView site(ModelAndView mav, HttpServletRequest req, HttpServletResponse res, HttpSession session, @RequestParam Map<String, Object> paramMap) throws UnsupportedEncodingException{
	  NaverLogin.startRequestAPIURL(mav,session);
	  // json으로 메인에 추천도서 가져오기 위해 
	  Map<String,Object> rstRecommend = dsi.mainRecommend(paramMap);
	  List<Map<String,Object>> rstBestView = dsi.mainBestView(paramMap);
	  mav.addObject("data", rstRecommend);
	  System.out.println(rstBestView);
	  mav.addObject("bestview", rstBestView);
	  mav.setViewName("main_index");
      return mav;
   }
   
   // 이용안내
   // 타일즈를 불러옴
   @RequestMapping("/guide.do")
   public String guide(){
      return "guide/guide_index";
   }
}