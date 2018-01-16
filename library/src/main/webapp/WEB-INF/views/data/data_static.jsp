<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>
<!-- 변수 선언 부분	 -->
<script type="text/javascript">
	var data = {
		// 자료마당 사이드바 부분전환 화면
		move : function(paramData) {
			$.ajax({
				url : "${path}/data/changemain.do",
				type : "POST",
				data : {
					type : paramData
				},
				async : false
			}).done(function(resultData) {
				$('.active').removeClass("active");
				$('#'+paramData).addClass("active");	
				data.mainchange(resultData);
				history.pushState(null,null,paramData+".do");
			})
		},
		// 추천도서 목록 화면 생성
		recreateHtml : function(data) {
			$(".recommend_ul").empty();
			for (var i = 0; i < data.length; i++){
				var tag = "";
				tag += '<li class="recommend_li" onclick="location.href=(${path}/data/recommendview.do)">';
				tag += '<div style="float: left">';
                tag += '<a href="#">' + '<img src="${path}/resources/img/뻐큐.jpg" style="width: 75px; height: 113px;">' + '</a>';
				tag += '</div>'
				tag += '<h3>'+ '<a href="#">'+ data[i].title +'</a>' +'</h3>';
				tag += '<p class="author">'+ data[i].author + '</p>';
				tag += '<p class="proInfo">'+ data[i].publisher +'</p>';
				tag += '<p class="location">' + data[i].price + '</p>';
                tag += '</div>';
                tag += '</li>';
				$(".recommend_ul").append(tag);
			};
		},
		// 추천도서 상세페이지 화면 생성
		reviewcreateHtml : function(data) {
			$(".recommendview_li").empty();
			for (var i = 0; i < data.length; i++){
				var tag = "";
				tag += '<div style="float: left">';
                tag += '<a href="#">' + '<img src="${path}/resources/img/뻐큐.jpg" style="width: 75px; height: 113px;">' + '</a>';
				tag += '</div>'
				tag += '<h3>'+ '<a href="#">'+ data[i].title +'</a>' +'</h3>';
				tag += '<p class="author">'+ data[i].author + '</p>';
				tag += '<p class="proInfo">'+ data[i].publisher +'</p>';
				tag += '<p >' + data[i].discription + '</p>';
                tag += '</div>';
				$(".recommendview_li").append(tag);
			};
		},
		// 추천도서 데이터 불러오기
		initData : function() {
			$.ajax({
				url : "${path}/data/json/recommend.do",
				type : "POST",
				async : false
			}).done(function(result) {
				console.log(result);
				data.recreateHtml(result.recommend);
			}).fail(function(d){
				alert("fail");
			});
		},
		// span8부분 가져오기
		mainchange : function(paramData) {
			// span8의 부모(row)의 위치를 먼저 찾아놓음
			var parent = $('#main');
			parent.empty();
			// 뒷부분에 ajax실행된 후 data부분을 붙여 넣음
			parent.append(paramData);
		}
	}
</script>
<!-- 실행 부분 -->
<script type="text/javascript">
$(document).ready(function() {
	// 해당 클릭 메뉴마다 이벤트 설정
	// addClass : 클래스 추가.
	$('#'+nowPath).addClass("active");
	data.initData();
});
</script>
