package com.java.library.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
   @RequestMapping(value="json/newbook.do", method=RequestMethod.POST)
   @ResponseBody
   public String postNewbook(){
      return "";
   }
   
   @RequestMapping(value="search.do", method=RequestMethod.GET)
   public String getSearch(){
      return "data/data_search";
   }

   @RequestMapping(value="json/search.do", method=RequestMethod.POST)
   @ResponseBody
   public String getDataSearch(){
      return "";
   }
   
   // 추천 도서 화면 
   @RequestMapping(value="recommend.do", method=RequestMethod.GET)
   public ModelAndView getRecommend(ModelAndView mav){
	   mav.addObject("data", "추천도서");
	   // tiles 화면 매칭 
	   mav.setViewName("data/data_recommend");
	   return mav;
   }	
   
   // 추천 도서 화면 
   @RequestMapping(value="changemain.do", method=RequestMethod.POST)
   public ModelAndView ajaxChangeMain(ModelAndView mav,@RequestParam Map<String,Object> paramMap){
	   String type = (String) paramMap.get("type");
	   if("newbook".equalsIgnoreCase(type)) {
		   mav.setViewName("/data/data_"+type);
	   } else if("recommend".equalsIgnoreCase(type)) {
		   mav.setViewName("/data/data_"+type);
	   } else if("search".equalsIgnoreCase(type)) {
		   mav.setViewName("/data/data_"+type);
	   }
	   mav.addObject("data", "추천도서");
	   // tiles 화면 매칭 
	   return mav;
   }
   
   // 추천 도서 데이터 불러오기
   @RequestMapping(value="json/recommend.do", method=RequestMethod.POST)
   @ResponseBody
   public String jsonRecommendData(@RequestParam Map<String,Object> paramMap){
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