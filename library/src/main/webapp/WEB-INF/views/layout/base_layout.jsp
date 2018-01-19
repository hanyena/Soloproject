<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="GotYa Free Bootstrap Theme" />
	<meta name="keywords"
		content="Template, Theme, web, html5, css3, Bootstrap" />
	<meta name="author" content="Łukasz Holeczek from creativeLabs" />
	<!--반응형 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript">
	var data1 = []; // 데이터 담을 배열 변수 선언
	var page = 1; // 현재 페이지 값
	var viewRow = 5; // 화면에 보여질 행 갯수
	var totCnt = 0;
	var start = 0, end = 0;
	var util = {
			// 페이징 목록들 불러오기
// 			initPaging : function(){
// 				$.ajax({
// 					url : "${path}/open/json/list.do",
// 					type : "POST",
// 					data : {
// 						"start" : start,
// 						"viewRow" : viewRow
// 					},
// 					datetype : "json",
// 					async : false
// 				}).done(function(resultData){
// 					console.log(resultData);
// 					totCnt = resultData.boardCnt;
// 					util.createHtmlPaging(resultData);
// 				})
// 			},
			// 페이징 번호 화면 생성
			createHtmlPaging : function(result){
				var paging = totCnt / viewRow;
				console.log(paging);
				$("#paging").empty(); // ul 태그의 자식들를 초기화가 필요하다.
				for(var i = 0; i < paging; i++){
					var tag = "";
				        tag += '<li class = "page-item atag_a">'
							+ '<a class="page-link" href="#'+(i + 1)+'">'
							+ (i + 1)
							+ '</a>';
						tag +='</li>';
				$("#paging").append(tag);
				}
				
			   // page의 변수를 이용하여 a 태그의 인덱스 값을 구하여 bg 클래스를 적용한다.
// 				$(".page-item a").eq(page - 1); 
				
				// 페이지 전환 이벤트를 작성 한다.
				$(".page-item a").off().on("click", function(){ 
				   // a 태그 중에 몇번째 페이지인지 알면 리스트 화면를 다시 보여 줄 수 있다. page 변수 활용 할것!
				   page = $(this).text();
				   end = (viewRow * page); // 10 * 2 = 20 
				   start = (end - viewRow); // 20 - 10 = 10
				   setTimeout(function(){
				   // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
				   board.initData(); 
				   // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
				   }, 100); 
				});
			}
	}
	</script>

    <!-- 현재 jsp경로나타내기  --> 
	<script type="text/javascript">
		var nowFolder = '<tiles:getAsString name="url1" ignore="true"/>';
		var nowPath = '<tiles:getAsString name="url2" ignore="true"/>';
		// indexOf() :  괄호 안에 문자의 시작 인덱스
		// substring() :  괄호 안 문자열 추출 
		nowPath = nowPath.substring(nowPath.indexOf("_")+1);
	</script>
	
	<tiles:insertAttribute name="static" ignore="true" />
	<tiles:insertAttribute name="pagestatic" ignore="true" />
	<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<!-- 최근 본 목록 -->
	<tiles:insertAttribute name="newview" />
	<div class="container">
		<tiles:insertAttribute name="header" />
		<!--start: Row -->
		<div class="row">

			<div id="side" class="span4" style="background-color: pink;">
				<!-- start: Sidebar -->
				<div id="sidebar">
					<tiles:insertAttribute name="sidebar" />
				</div>
				<!-- end: Sidebar -->
			</div>

			<div id="main" class="span8">
				<tiles:insertAttribute name="body" />
				<tiles:insertAttribute name="paging" />
			</div>

		</div>
		<hr>
		<tiles:insertAttribute name="copyright" />
	</div>

</body>

</html>
