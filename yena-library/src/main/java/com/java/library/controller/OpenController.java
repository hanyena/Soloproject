package com.java.library.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/board_data")
	@ResponseBody
	public String boardSelect(@RequestParam Map<String,Object> paramMap,HttpServletRequest req, HttpServletResponse res) {
		// 값을 JSON으로 변환
		return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardSelect(paramMap))).toString();
	}

	// 게시판 글쓰기 화면 부분
	@RequestMapping("boardwrite.do")
	public String BoardInsert(ModelAndView mav) {
		return "open/board_write";
	}


}