package com.java.library.service;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.java.library.dao.BoardDaoInterface;

@Service
public class BoardService implements BoardServiceInterface {
	
	@Autowired
	BoardDaoInterface bdi;
	
	Map<String, Object> rstMap;

	// 게시판 목록 가져오기
	@Override
	public Map<String, Object> boardSelect(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		rstMap.put("board", bdi.boardSelect(paramMap));
		rstMap.put("boardCnt", bdi.boardCntSelect(paramMap));
		return rstMap;
	}

	// 게시판 글쓰기
	@Override
	public Map<String, Object> boardInsert(Map<String, Object> paramMap) {
		rstMap = new HashMap<String, Object>();
		// 삽입이 됐을 경우 1, 실패 시 0 반환
		int rstInsertCnt = bdi.boardInsert(paramMap);
		rstMap.put("rstType", rstInsertCnt==1?"성공":"실패");
		return rstMap;
	}

	// 게시판 글 삭제
	@Override
	public Map<String, Object> boardDelete(Map<String, Object> paramMap) {
		// 게시물 한개 받기 
		Map<String, Object> getBoardOne = bdi.boardSelectOne(paramMap);
		
		// delete후 결과 데이터
		rstMap = new HashMap<String,Object>();
//		Map<String,Object> userSession = (HashMap<String, Object>) paramMap.get("UserSession");
		
		//로그인 아직 미개발로 인해 아이디 직접 지정
		String id = "yena";
		
		// 받아온 getBoardOne에서 id값을 꺼내 로그인한 id값 비교
		if(getBoardOne.get("member_id").equals(id)) {
			int rstDeleteCnt = bdi.boardDelete(paramMap);
			if(rstDeleteCnt > 0) {
				rstMap.put("result", "글 삭제가 완료 되었습니다.");
			}else{
				rstMap.put("result", "글 삭제를 실패 하였습니다.");
			}
		}else {
			rstMap.put("error", "아이디가 동일하지 않습니다.");
		}
		return rstMap;
	}
	
	
	// 게시판 글 수정
	@Override
	public Map<String, Object> boardUpdate(Map<String, Object> paramMap){
		// 게시물 한개 받기(게시글이 누구 것인지 확인 하기 위한 )
		Map<String, Object> getBoardOne = bdi.boardSelectOne(paramMap);
		
		// update후 결과 데이터를 담을 변수
		rstMap = new HashMap<String,Object>();
		
		//로그인 아직 미개발로 인해 아이디 직접 지정
		String id = "yena";
		
		// 받아온 getBoardOne에서 id값을 꺼내 로그인한 id값 비교
		if(getBoardOne.get("member_id").equals(id)){
			int rstUpdateCnt = bdi.boardUpdate(paramMap);
			if(rstUpdateCnt > 0){
				rstMap.put("result", "글 수정이 완료되었습니다.");
			}else{
				rstMap.put("result", "글 수정을 실패하였습니다.");
			}
		}else{
			rstMap.put("error", "아이디가 동일하지 않습니다.");
		}
		return rstMap;
	}

	// 게시물 한 개 목록 가져오기
	@Override
	public Map<String, Object> boardSelectOne(Map<String, Object> paramMap) {
		rstMap = bdi.boardSelectOne(paramMap);
		return rstMap;
	}

	// ck에디터 파일업로드 부분
	@Override
	public Map<String, Object> boardUpload(MultipartHttpServletRequest req) {
		rstMap = new HashMap<String, Object>();
		String name = "";
		String origin = "";
		String extension = "";
		Boolean isExtension = false;
		String path = "";
		String path2 = "resources/fileimageUpload/";
		System.out.println(path2 + name);
		int rstSuccessCnt = 0;
		UUID uuid = UUID.randomUUID();
		
		path = req.getSession().getServletContext().getRealPath("/") + path2;
		System.out.println(path);
		System.out.println(path.indexOf(".metadata"));
		if(path.indexOf(".metadata") > -1){
//			path = "C:/Users/GD/git/Soloproject/library/src/main/webapp/" + path2;
			path = "E:/git/library-yena/library/src/main/webapp/" +path2;
			System.out.println(path);
		}
		
		String[] extensions = new String[] { "jpg", "png", "gif", "jpeg" };
		
//		 파일 저장 부분
		try {
			MultipartFile file = null;
			Iterator<String> iter = req.getFileNames();
			while(iter.hasNext()) {
				file = req.getFile(iter.next());
				origin = file.getOriginalFilename();
				extension = origin.substring(origin.lastIndexOf(".") + 1, origin.length()).toLowerCase();
				System.out.println(extension);
				
				// 이미지 여부 검사
				for(int i = 0; i < extensions.length; i++){
					if(extensions[i].equals(extension)){
						isExtension = true;
					}
				}
				
				// 이미지만 파일 저장
				if(isExtension){
					name = uuid + "." + extension;
					byte[] bytes = file.getBytes();
					
					File fDir = new File(path);
		//			 파일 경로 없을 때 폴더 생성하기
					if(!fDir.exists()){
						fDir.mkdirs();
					}
					
					File newFile = new File(path + name);
		//			 경로에 같은 파일이 없을때 파일 생성
					if(!newFile.exists()){
						OutputStream out = new FileOutputStream(newFile);
						out.write(bytes);
						out.close();
					}
					rstSuccessCnt++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 파일 저장 내용 리스트에 담기
			if (rstSuccessCnt > 0) {
				rstMap.put("origin", origin);
				rstMap.put("imgUrl", "/" + path2 + name);
				rstMap.put("rstMsg", "파일 업로드가 성공적으로 완료 되었습니다.");
			} else if (rstSuccessCnt == 0) {
				rstMap.put("imgUrl", "");
				rstMap.put("rstMsg", "파일 업로드가 실패하였습니다.");
			}
		}
		
		return rstMap;
	}

}
