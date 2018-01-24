<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>
<!-- 변수 선언 부분	 -->
<script type="text/javascript">
	var data = {
		// 자료마당 사이드바 부분전환 화면
		move : function(paramData) {
			console.log(paramData);
			$.ajax({
				url : "${path}/data/changemain.do",
				type : "POST",
				data : {
					type : paramData
				},
				async : false
			}).done(function(resultData) {
// 				console.log("11"+resultData);
// 				console.log("URL MOVE : "+paramData);
				$('.active').removeClass("active");
				$('#' + paramData).addClass("active");
// 				nowPath = paramData ;	
				resultData += '<ul id="paging" class="pagination justify-content-center text-center">';
				resultData += '</ul>';
				//메인 화면을 교체함
				data.mainchange(resultData);
				//주소를 변한것처럼 사용자를 속임
				history.pushState(null, null, paramData + ".do");
				//사이드바가 추천도서일 때 부분전환
				switch (paramData) {
				case "recommend":
// 					alert(paramData);
					data.initDataRecommend();
				}
			})
		},
		// 추천도서 목록 화면 생성
		createhtmlRecommend : function(data) {
			$(".recommend_ul").empty();
			$.each(data, function(index, element) {
				var tag = "";
				tag += '<li class="recommend_li">';
				tag += '<div style="float: left">';
				tag += '<a href="#">'
					+ '<img src="'+element.image+'" style="width: 75px; height: 113px;">'
					+ '</a>';
				tag += '</div>';
				tag += '<div class="p_p_p">';
				tag += '<h3 class="cardne">'
					+ '<a href="javascript:data.initDataRecommendView('
					+ element.no + ');">' + element.title
					+ '</a>' + '</h3>';
				tag += '<p class="author">' + element.author
						+ '</p>';
				tag += '<p class="proInfo">'
						+ element.publisher + '</p>';
				tag += '<p class="location">' + element.price
						+ '</p>';
				tag += '</div>';
				tag += '</div>';
				tag += '</li>';
				$(".recommend_ul").append(tag);
			})
		},
		// 추천도서 상세페이지 화면 생성
		createhtmlRecommendView : function(data) {
			$(".recommendview_li").empty();
				var tag = "";
				tag += '<div style="float: left">';
				tag += '<a href="#">'
						+ '<img src="'+data.image+'" style="width: 75px; height: 113px;">'
						+ '</a>';
				tag += '</div>';
				tag += '<div class="p_p_p">';
				tag += '<h3>' + '<a href="#">' + data.title
						+ '</a>' + '</h3>';
				tag += '<p class="author">' + data.author
						+ '</p>';
				tag += '<p class="proInfo">'
						+ data.publisher + '</p>';
				tag += '<p >' + data.description + '</p>';
				tag += '</div>';
				tag += '</div>';
				$(".recommendview_li").append(tag);
		},
		// span8부분 가져오기
		mainchange : function(paramData) {
			// span8(id=main) 부분을 변수에 담기
			var parent = $('#main');
			// span8부분을 전체 비워줌
			parent.empty();
			// 뒷부분에 ajax실행된 후 data부분을 붙여 넣음
			parent.append(paramData);
			
		},
		// 추천도서 데이터 불러오기
		initDataRecommend : function() {
			$.ajax({
				url : "${path}/data/json/recommend.do",
				type : "POST",
				data : {
					"start":start*1,
					"viewRow":viewRow*1
				},
				async : false
			}).done(function(resultData) {
				console.log(resultData);
				data.createhtmlRecommend(resultData.recommend);
			}).fail(function(d) {
				alert("fail");
			});
		},
		// 추천도서 상세페이지 데이터 불러오기
		initDataRecommendView : function(no) {
			$.ajax({
				url : "${path}/data/json/recommendview.do",
				type : "POST",
				data : {
					"no" : no
				},
				async : false
			}).done(function(result) {
				//상세페이지 레이아웃을 가져옴. 
				data.move("recommendview");
				data.menuSelectCSS();
				data.createhtmlRecommendView(result.recommendview);
			}).fail(function(d) {
				alert("fail");
			});
		},
		// 사이드바 메뉴가 선택되었을때 색상을 입힌다.
		menuSelectCSS : function() {
			// 해당 클릭 메뉴마다 이벤트 설정
			// addClass : 클래스 추가.
			if(nowPath == "recommendview") {
				nowPath = "recommend";
			}
			$('#' + nowPath).addClass("active");
		},
		// 신간안내페이지 검색 시 데이터 목록 화면 생성
		createhtmlNewbook : function(data){
			$('#newbooklist').empty();
			$.each(data, function(index, element) {
				var tag = "";
				tag += '<ul class="newbook_ul">';
				tag += '<li class="recommend_li">';
				tag += '<div style="float: left">';
				tag += '<a href="#">'
					+ '<img src="'+element.image+'" style="width: 75px; height: 113px;">'
					+ '</a>';
				tag += '</div>';
				tag += '<h3>' + '<a href="#">' + element.title + '</a>' + '</h3>';
				tag += '<p class="author">' + element.author + '</p>';
				tag += '<p class="proInfo">'+ element.publisher + '</p>';
				tag += '<p class="location">' + element.price + '</p>';
				tag += '</div>';
				tag += '</li>';
				tag += '</ul>';
				$('#newbooklist').append(tag);
			})
		},
		// 신간안내 데이터 불러오기
		initDataNewbook : function() {
			$.ajax({
				url : "${path}/data/json/newbook.do",
				type : "POST",
				data : {
					"start":start,
					"viewRow":viewRow
				},
				async : false
			}).done(function(resultData) {
				console.log(resultData);
				data.createhtmlNewbook(resultData.newbook);
				totCnt = resultData.bookCnt;
				console.log(totCnt);
				util.createHtmlPaging(resultData);
			}).fail(function(d) {
				alert("fail");
			});
		},
		// 도서검색페이지 검색 시 데이터 목록 화면 생성
		createhtmlSearch : function(){
			$('#searchlist').empty();
// 			$.each(data, function(index, element) {});
			
			if(location.hash == ""){
				start = 0;
			}
			end = data.dataSource.length > (start + 10) ? (start + 10) : data.dataSource.length;
			console.log(data.dataSource);
			for(var i = start; i < end; i++){
				var tag = "";
				tag += '<ul class="search_ul">';
				tag += '<li class="search_li">';
				tag += '<div style="float: left">';
				tag += '<a href="#">';
				if(data.dataSource[i].image != ""){
					tag += '<img src="'+data.dataSource[i].image+'" style="width: 75px; height: 113px;">';
				} else {
					tag += '<img src="/resources/img/no_image.png" style="width: 75px; height: 113px;">';
				}
				tag += '</a>';
				tag += '</div>';
				tag += '<div class="p_p_p">'
				tag += '<h3 class="cardne">' + '<a href="#">' + data.dataSource[i].title + '</a>' + '</h3>';
				tag += '<p class="author">' + data.dataSource[i].author + '</p>';
				tag += '<p class="proInfo">'+ data.dataSource[i].publisher + '</p>';
				tag += '<p class="location">' + data.dataSource[i].price
				tag += '<button type="button" style="float: right" onclick="javascript:data.borrow('+i+');">'+ "대여" +'</button>'
				tag += '</p>';
				tag += '</div>';
				tag += '</div>';
				tag += '</li>';
				tag += '</ul>';
				$('#searchlist').append(tag);
// 				console.log(data.dataSource[i].no);
			}
		},
		// 도서검색 데이터 불러오기
		initDataSearch : function() {
			// cdn.jsp에  serializeObjectd에 의해서 작동
			var formDatatoJson = $('#librarySearch').serializeObject();
// 			formDatatoJson.start = 0;
// 			formDatatoJson.viewRow = viewRow;
// 			console.log(formDatatoJson);
			$.ajax({
				url : "${path}/data/json/search.do",
				type : "POST",
				data : formDatatoJson,
				datatype : "json",
				async : false
			}).done(function(resultData) {
				console.log(resultData);
				totCnt = resultData.total;
				// 개수가 1개일 때 배열값으로 만들어주기 위y
				if(totCnt > 1){
					data.dataSource = resultData.item;
				} else {
					data.dataSource.push(resultData.item);
				}			
				console.log(totCnt);
				util.createHtmlPaging();
				data.createhtmlSearch();
			}).fail(function(d) {
				alert("fail");
			});
		},
		// no : 해당 도서의 db 번호
		borrow : function(index){
			var param = {
					title : data.dataSource[index].title
			}
			$.ajax({
				url : "${path}/data/json/borrow.do",
				type : "POST",
				data : param,
				async :false
			}).done(function(resultData){
				console.log(resultData);
				if(resultData.msg){
					alert(resultData.msg);
				} else {
					if(resultData.status == 1){
						alert("대여가 되었습니다.");
					} else {
						alert("대여 진행 중 실패하였습니다.");
					}
				}
			}).fail(function(d){
				alert("실패");
			});
		},
		dataSource : [],
		viewRow : function(){
			viewRow = $("#booksize").val();
			console.log("viewRow : ", viewRow);
		}
	}
</script>
<!-- 실행 부분 -->
<script type="text/javascript">
	$(document).ready(function() {
		data.menuSelectCSS();
		if(nowPath == "recommend"){
			data.initDataRecommend();
		}
	});
</script>
