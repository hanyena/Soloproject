package com.java.library.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.DataServiceInterface;
import com.java.library.util.social.naver.NaverProfile;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping(value = "/data/")
public class DataController {

	@Autowired
	private static final Logger logger = Logger.getLogger(DataController.class);

	@Autowired
	DataServiceInterface dsi;

	// 신간안내 페이지 화면(타일즈)
	@RequestMapping(value = "newbook.do", method = RequestMethod.GET)
	public ModelAndView newbook(ModelAndView mav){
		mav.setViewName("data/data_newbook");
		return mav;
	}

	
	// 신간안내 페이지 데이터
	@RequestMapping(value = "json/newbook.do", method = RequestMethod.POST)
	// 디비에서 처리된 결과를 알려주기 위해서
	@ResponseBody
	public String getDataNewbook(@RequestParam Map<String, Object> paramMap){
		return JSONObject.fromObject(JSONSerializer.toJSON(dsi.newbookSelect(paramMap))).toString();
	}

	
	// 추천도서 페이지 화면(타일즈)
	@RequestMapping(value = "recommend.do", method = RequestMethod.GET)
	public ModelAndView recommend(ModelAndView mav) {
		// 추천jsp에서 확인해보세용
//		mav.addObject("data", "추천도서");
		// tiles 화면 매칭
		mav.setViewName("data/data_recommend");
		return mav;
	}

	
	// 추천도서 페이지 데이터 불러오기
	@RequestMapping(value = "json/recommend.do", method = RequestMethod.POST)
	@ResponseBody
	public String getDataRecommend(@RequestParam Map<String, Object> paramMap) {
		// JSONSerializer => MAP은 순서가 없어서 디비에 저장된 값 순서대로 뽑아 쓰기...위해서..(?)
		return JSONObject.fromObject(JSONSerializer.toJSON(dsi.recommendSelect(paramMap))).toString();
	}
	

	// 추천도서 페이지 사이드바 부분전환(ajax를 이용한 jsp파일 불러오기)
	@RequestMapping(value = "changemain.do", method = RequestMethod.POST)
	public ModelAndView ajaxChangeMain(ModelAndView mav, @RequestParam Map<String, Object> paramMap) {
		String type = (String) paramMap.get("type");
		if ("newbook".equalsIgnoreCase(type)) {
			mav.setViewName("/data/data_" + type);
		} else if ("recommend".equalsIgnoreCase(type)) {
			mav.setViewName("/data/data_" + type);
		} else if ("search".equalsIgnoreCase(type)) {
			mav.setViewName("/data/data_" + type);
		} else if ("recommendview".equals(type)) {
			mav.setViewName("/data/data_" + type);
		}
//		mav.addObject("data", "추천도서");
		return mav;
	}

	
	// 추천도서 상세페이지 화면(타일즈)
	@RequestMapping(value = "recommendview.do", method = RequestMethod.GET)
	public ModelAndView recommendView(ModelAndView mav) {
		mav.setViewName("data/data_recommendview");
		return mav;
	}

	// 추천도서 상세페이지 데이터
	@RequestMapping(value = "json/recommendview.do", method = RequestMethod.POST)
	@ResponseBody
	public String getDataRecommendview(@RequestParam Map<String, Object> paramMap) {
		return JSONObject.fromObject(JSONSerializer.toJSON(dsi.recommendViewSelect(paramMap))).toString();
	}
	
	
	// 도서검색 페이지 화면(타일즈)
	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public ModelAndView search(ModelAndView mav) {
		mav.setViewName("data/data_search");
		return mav;
	}

	
	// 도서검색 페이지 데이터
	@RequestMapping(value = "json/search.do", method = RequestMethod.POST)
	@ResponseBody
	public String getDataSearch(@RequestParam Map<String, Object> paramMap) {
//		System.out.println(paramMap);
		return dsi.searchSelect(paramMap).toString();
	}
	
	
	// 도서 대여 (rendlibrary에 도서 삽입) 
	@RequestMapping(value = "json/borrow.do", method = RequestMethod.POST)
	@ResponseBody
	public String bookBorrow(@RequestParam Map<String, Object> paramMap, HttpSession session){
		System.out.println(paramMap);
		Map<String, Object> result = new HashMap<String, Object>();
		// 로그인한 사용자의 세션 정보를 가져온다.
		NaverProfile nUserSession = NaverProfile.getSessionNaverProfile(session);
		if (nUserSession != null) {
			paramMap.put("member_id", nUserSession.getId());
			result = dsi.borrowBookInsert(paramMap);
		}else{
			result.put("msg", "네이버 로그인이 필요합니다.");
		}
		return JSONObject.fromObject(JSONSerializer.toJSON(result)).toString();
	}

}