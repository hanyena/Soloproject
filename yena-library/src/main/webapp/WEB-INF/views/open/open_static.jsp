<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 변수 선언 부분	 -->
<script type="text/javascript">
var board = {
		// 게시판 목록 화면
		createHtml : function() {
			$("#board tbody").empty();
			for (var i = 0; i < data1.length; i++) {
				var tag = "";
				tag += '<tr>';
				tag += '<td><a href="javascript:board.status('+i+');">' + data1[i].title + '</a></td>';
				tag += '<td>' + data1[i].regname + '</td>';
				tag += '<td>' + data1[i].regdate2 + '</td>';
				tag += '<td>' + data1[i].boardcnt + '</td>';
				tag += '</tr>';
				tag += '<tr style="border-top:3px solid red;  ">';
				tag += '<td class="content" colspan="4" style="display:none;">'
				+ '<div>'+data1[i].content+'</div>'
				+ '<div>'+ 	'<button type="button" id="board_write" class="btn btn-default text-white bg-redred writbtn3 boardInput_button" onclick="javascript:board.drop('+data1[i].no+');">삭제</button>'
				+ '<button type="button" id="board_write" class="btn btn-default text-white bg-redred writbtn3 boardInput_button" onclick="javascript:board.modify('+data1[i].no+',2)">수정</button>'
				+'</div>'+'</td>';
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
				data1 = result.board;
				board.createHtml();
			}).fail(function(d) {
				alert("fail");
			});
		},
		// 게시판 글 작성
		write : function() {
			// #writeform의 모든 값을 가져온다
			var formData = $('#writeform').serialize();

			$.ajax({
				url : "${path}/open/json/write.do",
				type : "post",
				data : formData
			}).done(function(data) {
				console.log(data);
			}).fail(function(d) {
				alert("fail");
			});
		},
		// 게시판 클릭 시 해당 번호 값 상세내용 보여주기
		status : function(num) {
			var target = $('.content').eq(num);
			if(target.css("display") == "none" ) {
				target.show();
			} else {
				target.hide();
			}
		},
		// 게시판 글 삭제
	    drop : function(no){
			$.ajax({
				url:"${path}/open/json/delete.do",
				type:"POST",
				data:{
					// 키 : 값
					"no":no
				}
			}).done(function(data){

				if(data.result) {
					alert(data.result);
				}
				if(data.error) {
					alert(data.error);
				}
				board.initData();
			})
		},
		// '/open/updateform.do'화면으로  게시글 번호(no)만 보내기 
		modify : function(no,type) {
			$.ajax({
				url:"${path}/open/updateform.do",
				type:"GET",
				// no값을 가지고 url로 보냄
				data:{
					// 키 : 값
					"no":no,
				}
			}).done(function(data){
				if(data.result) {
					alert(data.result);
				} else {
					board.mainchange(data);
				}
			})
		},
		// 최종으로 글 수정 버튼
		update :  function(){
			// #updateform의 모든 값을 가져온다
			var formData = $('#updateform').serialize();
			$.ajax({
				url:"${path}/open/updateform.do",
				type:"POST",
				// no값을 가지고 url로 보냄
				data: formData
			}).done(function(data){
				if(data.result) {
					alert(data.result);
					location.href = "${path}/open/list.do";
				}
			})
		}, 
		mainchange : function(data) {
			// span8의 부모(row)의 위치를 먼저 찾아놓음
			var parent = $('#main').parent();
			$('#main').remove();
			// 뒷부분에 ajax실행된 후 data부분을 붙여 넣음
			parent.append(data);
		}
	}	
	
</script>


<!-- 실행 부분 -->
<script type="text/javascript">
	$(document).ready(function() {
		var data1 = []; // 데이터 담을 배열 변수 선언
		board.initData();
		
	});
</script>











