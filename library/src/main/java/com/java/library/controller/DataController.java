package com.java.library.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.DataServiceInterface;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping(value="/data/")
public class DataController{
	
	@Autowired
	DataServiceInterface dsi;
	
	// 타일즈를 부름
   @RequestMapping(value="newbook.do", method=RequestMethod.GET)
   public String getNewbook(){
      return "data/data_newbook";
   }
   
   // jsp파일을 부름(main에서 직접 부를 때)
   @RequestMapping(value="newbook.do", method=RequestMethod.POST)
   public String postNewbook(){
      return "/data/data_newbook";
   }
   
   @RequestMapping(value="search.do", method=RequestMethod.GET)
   public String getSearch(){
      return "data/data_search";
   }

   @RequestMapping(value="search.do", method=RequestMethod.POST)
   public String postSearch(){
      return "/data/data_search";
   }
   
   
   // 추천 도서 화면 
   @RequestMapping(value="recommend.do", method=RequestMethod.GET)
   public ModelAndView getRecommend(ModelAndView mav){
	   
	   // tiles 화면 매칭 
	   mav.setViewName("data/data_recommend");
	   return mav;
   }	
   
   // 추천 도서 데이터 불러오기
   @RequestMapping(value="recommend.do", method=RequestMethod.POST)
   @ResponseBody
   public String postRecommend(@RequestParam Map<String,Object> paramMap){
 	   // JSONSerializer => MAP은 순서가 없어서 디비에 저장된 값 순서대로 뽑아 쓰기...위해서..(?)
	   return JSONObject.fromObject(JSONSerializer.toJSON(dsi.recommendSelect(paramMap))).toString();
   }   
   
   
   
   
   
   
   
   
 // 여기는 recommendview쪽
   @RequestMapping(value="recommendview.do", method=RequestMethod.GET)
   public String getRecommendView(){
      return "data/data_recommendview";
   }
   
   @RequestMapping(value="recommendview.do", method=RequestMethod.POST)
   //디비에서 삭제했단 결과를 알려주기 위해서 
   @ResponseBody
   public String postRecommendview(){
      return "data/data_recommendview";
   }
   
   
}