package com.java.library.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.BoardServiceInterface;
import com.java.library.util.HttpUtil;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping(value = "/open/")
public class OpenController {

	@Autowired
	BoardServiceInterface bsi;

	// 게시판 목록 화면 부분(타일즈)
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String board() {
		return "open/board_list";
	}

	// 게시판 목록 데이터 부분
	@RequestMapping(value = "json/list.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardSelect(@RequestParam Map<String, Object> paramMap) {
		// 값을 아예 json형식으로 내보냄
		return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardSelect(paramMap))).toString();
	}

	// board.move로 이동하였을때 write.do로 주소가 변하는데  실제 페이지가 없다면 500 ERROR가 발생하여 임시로 만듬
	@RequestMapping(value = "writeform.do", method = RequestMethod.GET)
	public String boardWriteForm(ModelAndView mav) {
		return "redirect:/open/list.do";
	}
	
	// board.move로 이동하였을때 write.do로 주소가 변하는데  실제 페이지가 없다면 500 ERROR가 발생하여 임시로 만듬
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String boardWrite(ModelAndView mav) {
		return "redirect:/open/list.do";
	}
		
	// board.move로 이동하였을때 modify.do로 주소가 변하는데  실제 페이지가 없다면 500 ERROR가 발생하여 임시로 만듬
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String boardModifyForm(ModelAndView mav) {
		return "redirect:/open/list.do";
	}

	// 게시판 글쓰기 데이터 부분
	@RequestMapping(value = "json/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWrite(@RequestParam Map<String, Object> paramMap, HttpSession session) {
		
		System.out.println("게시판 JSON write.do >>>> : " + paramMap);
		// 로그인한 사용자의 세션 정보를 가져온다.
		Map<String, Object> userSession = (Map<String, Object>) session.getAttribute("UserSession");
		// 로그인 된 상태인 경우 paramMap에 userSession 데이터를 넣는다.
		if (userSession != null) {
			paramMap.putAll(userSession);
			paramMap.put("member_id", "yena");
			paramMap.put("boardlist_no", 2);
			paramMap.put("regname", "한예나");
			// 로그인 전인경우는 테스트를 위해 임의로 회원정보를 넣는다.
		} else {
			paramMap.put("member_id", "yena");
			paramMap.put("boardlist_no", 2);
			paramMap.put("regname", "한예나");
		}
		// JSONSerializer => MAP은 순서가 없어서 디비에 저장된 값 순서대로 뽑아 쓰기...위해서..(?)
		return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardInsert(paramMap))).toString();
	}
	
	
	// 게시판 ck에디터 이미디 파일 업로드
	@RequestMapping("/fileimageUpload")
	public void imgUpload(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session, @RequestParam HashMap<String, Object> paramMap) {
		
//		List<String> ImgList = new ArrayList<String>();
		
		// 이전 이미지 업로드 쿠키 초기화 부분 
//		Cookie[] cookies = req.getCookies();
//		if(cookies != null){
//			for(int i = 0; i < cookies.length; i++){
//				if("origin".equals(cookies[i].getName())){
//					Cookie cookie = cookies[i];
//					System.out.println(cookie.getName());
//					cookie.setMaxAge(0);
//					res.addCookie(cookie);
//				}
//			}
//		}
		// 세션 초기화
//		session.invalidate();
//		System.out.println(session.getAttribute("origin"));
//		if(session.getAttribute("origin") != null) {
//			ImgList = (List<String>) session.getAttribute("origin"); 
//		}
		
		Map<String, Object> resultMap = bsi.boardUpload(req);
		System.out.println(resultMap);
		
		// 이미지 업로드 쿠키 생성 부분
//		if(resultMap.get("origin") != null){
//			System.out.println("origin : " + resultMap.get("origin"));
//			Cookie info = new Cookie("origin", resultMap.get("origin").toString());
//			info.setMaxAge(24*60*60);
//			info.setPath("/");
//			res.addCookie(info);
//		}
		// 세션 값 담기
//		ImgList.add(resultMap.get("origin").toString());
//		session.setAttribute("origin", ImgList);
		
		// 초기값 설정 부분
		PrintWriter printWriter = null;
		
		// 리턴값 설정 부분
		try {
			/* ck에서 지정된 약속
			 * <script type='text/javascript'>
			 * 	 window.parent.CKEDITOR.tools.callFunction(
			 * 내용	  몇건                         이미지주소         결과메세지 반환
			 * 값	'콜백의 식별 ID 값', '파일의 URL', '전송완료 메시지'
			 *   );</script>
			 */
			String printMsg = "";
			printMsg += "<script type='text/javascript'>";
			printMsg += "window.parent.CKEDITOR.tools.callFunction(";
			printMsg += "'" + paramMap.get("CKEditorFuncNum") + "',"; 
			printMsg += "'" + resultMap.get("imgUrl") + "',";
			printMsg += "'" + resultMap.get("rstMsg") + "');";
			printMsg += "</script>";
			System.out.println(printMsg);
			// 전송완료 메세지 한글 깨짐 방지
			res.setCharacterEncoding("UTF-8");
			// 
			printWriter = res.getWriter();
			printWriter.println(printMsg);
			// flush() : 파일 남아 있는거 보내라 (마저보내라)
			printWriter.flush(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// close() : 화면 출력 객체 종료
			printWriter.close(); 
		}
				
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


	// 게시판 데이터 수정 부분(데이터 부분)
	@RequestMapping(value = "json/update.do", method = RequestMethod.POST)
	@ResponseBody
	public String postBoardUpdate(@RequestParam Map<String, Object> paramMap) {
		// JSONSerializer => MAP은 순서가 없어서 디비에 저장된 값 순서대로 뽑아 쓰기...위해서..(?)
		return JSONObject.fromObject(JSONSerializer.toJSON(bsi.boardUpdate(paramMap))).toString();
	}
	

	// 부분전환(ajax를 이용한 jsp파일 불러오기)
	@RequestMapping(value = "changemain.do", method = RequestMethod.POST)
	public ModelAndView ajaxChangeMain(ModelAndView mav, @RequestParam Map<String, Object> paramMap) {
		System.out.println(paramMap);
		String type = (String) paramMap.get("type");
		if ("list".equalsIgnoreCase(type)) {
			mav.setViewName("/open/board_" + type);
		} else if ("writeform".equalsIgnoreCase(type)) {
			mav.setViewName("/open/board_" + type);
		/** 게시판 데이터 수정 부분(화면부분) */
		} else if ("modify".equalsIgnoreCase(type)) {
			// 아이디 값을 비교하여 수정버튼이 작동되게 하는 조건
			Map<String, Object> rstMap = bsi.boardSelectOne(paramMap);
			// 로그인 임의의 아이디
			String id = "yena";
			System.out.println("DB HOW USER : " + rstMap);
			if (rstMap.get("member_id").equals(id)) {
				// addObject : 화면(jsp)에 DB에서 갖고 온 데이터를 보냄
				mav.addObject("data", rstMap);
				// tiles대신 ajax로 jsp만 가져옴 <= 부분전환을 하기 위해
				mav.setViewName("/open/board_" + type);
			} else {
				rstMap = new HashMap<String, Object>();
				rstMap.put("result", "본인글이 아닙니다.");
				mav = HttpUtil.returnJson(rstMap);
			}
//		} else if ("".equals(type)) {
//			mav.setViewName("/open/data_" + type);
		}
		return mav;
	}
	
	
	
	
	
	
	
//	// 게시판 데이터 수정 부분(화면부분)
//	@RequestMapping(value = "update.do", method = RequestMethod.GET)
//	public ModelAndView getBoardUpdate(ModelAndView mav, @RequestParam Map<String, Object> paramMap) {
//		
//		// 아이디 값을 비교하여 수정버튼이 작동되게 하는 조건
//		Map<String, Object> rstMap = bsi.boardSelectOne(paramMap);
//		// 로그인 임의의 아이디
//		String id = "yena";
//		if (rstMap.get("member_id").equals(id)) {
//			// addObject : 화면(jsp)에 DB에서 갖고 온 데이터를 보냄
//			mav.addObject("data", rstMap);
//			// tiles대신 ajax로 jsp만 가져옴 <= 부분전환을 하기 위해
//			mav.setViewName("/open/board_update");
//		} else {
//			rstMap = new HashMap<String, Object>();
//			rstMap.put("result", "본인글이 아닙니다.");
//			mav = HttpUtil.returnJson(rstMap);
//		}
//		return mav;
//	}
}