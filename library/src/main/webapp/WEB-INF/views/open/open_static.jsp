<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>
<!-- 변수 선언 부분	 -->
<script type="text/javascript">
	var board = {
		// 자바스크립트를 이용한 화면 부분전환용 
		move : function(paramData, param) {
			/*
			 {
				"no" : no,
			 }
			*/
			var json;
			
			if(param == null ) {
				json = {};	
			} else {
				json = param;
			}
			// 변수 json에 키 값을 추가
			json.type = paramData;
			/*
			 {
				"no": no,
				"type" : paramData
			}
			*/
			$.ajax({
				url : "${path}/open/changemain.do",
				type : "POST",
				data : json,
				datatype : "json",
				async : false
			}).done(function(resultData) {
				console.log(resultData);
				if (resultData.result) {
					alert(resultData.result);
				} else {
					alert(paramData);
					//주소를 변한것처럼 사용자를 속임
					history.pushState(null, null, paramData + ".do");
					//메인 화면을 교체함
					board.mainchange(resultData);
				}
			})
		},
		// 게시판 목록 화면생성
		createBoardList : function(data) {
			$("#board tbody").empty();
			for (var i = 0; i < data.length; i++) {
				var tag = "";
				tag += '<tr>';
				tag += '<td><a href="javascript:board.status(' + i + ');">'
						+ data[i].title + '</a></td>';
				tag += '<td>' + data[i].regname + '</td>';
				tag += '<td>' + data[i].regdate2 + '</td>';
				tag += '<td>' + data[i].boardcnt + '</td>';
				tag += '</tr>';
				tag += '<tr style="border-top:3px solid red;  ">';
				tag += '<td class="content" colspan="4" style="display:none;">'
						+ '<div>'
						+ data[i].content
						+ '</div>'
						+ '<div>'
						+ '<button type="button" id="board_write" class="btn btn-default text-white bg-redred writbtn3 boardInput_button" onclick="javascript:board.drop('
						+ data[i].no
						+ ');">삭제</button>'
						+ '<button type="button" id="board_write" class="btn btn-default text-white bg-redred writbtn3 boardInput_button" onclick="javascript:board.modify('
						+ data[i].no + ',2)">수정</button>' + '</div>' + '</td>';
				tag += '</tr>';
				$("#board tbody").append(tag);
			};
		},
		// 게시판 목록들 불러오기
		initData : function() {
			$.ajax({
				url : "${path}/open/json/list.do",
				type : "POST",
				async : false
			}).done(function(result) {
				console.log(result);
				board.createBoardList(result.board);
			}).fail(function(d) {
				alert("fail");
			});
		},
		// 게시판 글 작성 
		write : function() {
			// #writeform의 모든 값을 가져온다
			var formData = $('#writeform').serialize();
			// 			 var formData = $('#writeform')[0];
			// ck자체 들어가 있는 java script 언어
			var ckeditor = CKEDITOR.instances['cont'].getData();
			$('#cont').val(ckeditor);
			var data = new FormData(formData);
			if ($("#title").val() != "" && $("#cont").val() != "") {
				$.ajax({
					url : "${path}/open/json/write.do",
					cache : false,
					processData : false,
					contentType : false,
					type : "post",
					data : data
				}).done(function(data) {
					console.log(data);
					board.move("writeform");
					// 					location.href = "${path}/open/list.do";
				}).fail(function(d) {
					alert("fail");
				});
			} else {
				if ($("#title").val() == null) {
					alert("제목을 입력하세요");
				} else if ($("#cont").val() == null) {
					alert("내용을 입력하세요");
				} else {
					alert("제목 또는 내용 입력하세요");
				}
			}
		},
		// 게시판 글 작성 화면 생성
		writeform : function(){
			board.move("writeform", null);
		},
		// 게시판 클릭 시 해당 번호 값 상세내용 보여주기
		status : function(num) {
			var target = $('.content').eq(num);
			if (target.css("display") == "none") {
				target.show();
			} else {
				target.hide();
			}
		},
		// 게시판 글 삭제
		drop : function(no) {
			$.ajax({
				url : "${path}/open/json/delete.do",
				type : "POST",
				data : {
					// 키 : 값
					"no" : no
				}
			}).done(function(data) {
				if (data.result) {
					alert(data.result);
				}
				if (data.error) {
					alert(data.error);
				}
				board.initData();
			})
		},
		// '/open/modify.do'화면으로  게시글 번호(no)만 보내기 
		modify : function(no, type) {
			board.move("modify", {
				"no" : no
			});
		},
		// 최종으로 글 수정 버튼
		update : function() {
			// #updateform의 모든 값을 가져온다
			var formData = $('#updateform').serialize();
			$.ajax({
				url : "${path}/open/json/update.do",
				type : "POST",
				// formData를 가지고 url로 보냄
				data : formData
			}).done(function(data) {
				if (data.result) {
					alert(data.result);
					board.move("list", null);
					board.initData();
				}
			})
		},
		// span8부분 가져오기
		mainchange : function(data) {
			alert("MAIN CHANGE >>>>>>>"+nowPath);
			
			// span8(id=main) 부분을 변수에 담기
			var parent = $('#main');
			// span8부분을 전체 비워줌
			parent.empty();
			// 뒷부분에 ajax실행된 후 data부분을 붙여 넣음
			parent.append(data);
		}
	}
</script>


<!-- 실행 부분 -->
<script type="text/javascript">
	$(document).ready(function() {
		board.initData();
		alert("(document READY) >>>>>>>>>>>>>"+nowPath);
	});
</script>











