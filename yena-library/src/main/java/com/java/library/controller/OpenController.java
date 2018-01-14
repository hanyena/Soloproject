package com.java.library.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.BoardServiceInterface;
import com.java.library.util.HttpUtil;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping(value="/open/")
public class OpenController {
	
	@Autowired
	BoardServiceInterface bsi;

	// 게시판 목록 화면 부분
	@RequestMapping("list.do")
	public String board(ModelAndView mav) {
		return "open/board_list";
	}

	// 게시판 목록 데이터 부분
	@RequestMapping("json/list.do")
	@ResponseBody
	public String boardSelect(@RequestParam Map<String,Object> paramMap){
		// 값을 아예 json형식으로 내보냄
		return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardSelect(paramMap))).toString();
	}

	
	// 게시판 글쓰기 화면 부분
	@RequestMapping("writeform.do")
	public String boardInsert(ModelAndView mav) {
		return "open/board_write";
	}
	
	
    // 게시판 글쓰기 데이터 부분
    @RequestMapping("json/write.do")
    @ResponseBody
    public String boardWrite(@RequestParam Map<String,Object> paramMap){
	    // JSONSerializer => MAP은 순서가 없어서 디비에 저장된 값 순서대로 뽑아 쓰기...위해서..(?)
	 	return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardInsert(paramMap))).toString();
    }
   
    // 게시판 데이터 삭제 부분
    @RequestMapping("json/delete.do")
    // 디비에서 삭제했단 결과를 알려주기 위해서 
    @ResponseBody
    public String boardDelete(@RequestParam Map<String, Object> paramMap, HttpSession session) {
 	   // UserSession에 있는 데이터들을 모두가져와 paramMap에 담아줌
       // paramMap.putAll((Map<String,Object>)session.getAttribute("UserSession"));
  	   return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardDelete(paramMap))).toString();
    }
   
    // 게시판  데이터 수정 부분(화면부분)
    @RequestMapping(value="updateform.do", method=RequestMethod.GET)
    public ModelAndView getBoardUpdate(ModelAndView mav, @RequestParam Map<String,Object> paramMap){
        
        // 아이디 값을 비교하여 수정버튼이 작동되게 하는 조건
    	Map<String, Object> rstMap = bsi.boardSelectOne(paramMap);
    	// 로그인 임의의 아이디
    	String id = "yena";
    	if(rstMap.get("id").equals(id)) {
    		// addObject : 화면(jsp)에 DB에서 갖고 온 데이터를 보냄
    	    mav.addObject("data",rstMap);
    	    // tiles대신 ajax로 jsp만 가져옴 <= 부분전환을 하기 위해
    	    mav.setViewName("/open/board_update");
    	} else {
    		rstMap = new HashMap<String,Object>();
    		rstMap.put("result", "본인글이 아닙니다.");
    		mav = HttpUtil.returnJson(rstMap);
    	}
	    return mav;
    }
    
    // 게시판  데이터 수정 부분(데이터 부분)
    @RequestMapping(value="updateform.do", method=RequestMethod.POST)
    @ResponseBody
    public String postBoardUpdate(ModelAndView mav, @RequestParam Map<String,Object> paramMap){
    	// JSONSerializer => MAP은 순서가 없어서 디비에 저장된 값 순서대로 뽑아 쓰기...위해서..(?)
    	return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardUpdate(paramMap))).toString();
  
    }
   
   
}