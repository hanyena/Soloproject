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
var util = {
		// 페이징 목록들 불러오기
		initPaging : function(pageNum, pageLimitCnt, limitCnt, totalCnt){
			$.ajax({
				url : "${path}/api/paging.do",
				type : "POST",
				data : {
					"pageNum" : pageNum,
					"pageLimitCnt" : pageLimitCnt,
					"limitCnt" : limitCnt,
					"totalCnt" : totalCnt
				},
				async : false

			}).done(function(resultData){
				console.log(resultData);
				util.createHtmlPaging(resultData);
			})
		},
		// 화면생성
		createHtmlPaging : function(result) {
			var tag = "";
			
			var countList = result.countList;
			var countPage = result.countPage;
			var endPage = result.endPage;
			var endrow = result.endrow;
			var page = result.page;
			var startPage = result.startPage;
			var startrow = result.startrow;
			var totalCount = result.totalCount;
			var totalPage = result.totalPage;
			
			$('#paging').empty();	
			alert(result.totalCount);
			console.log('찍었습니다.');

			tag += '							<div class="col-xs-12"  >';
			tag += '								<ul class="pagination pagination-lg ">';
			tag += '									<%-- 왼쪽 페이징 화살표  // 페이지 번호가 1보다 같거나 작은 경우  클릭 불가--%>';
												if(page <=1) {
			tag += '										<li class="disabled">';
			tag += '											<a href="#">';
			tag += '												<span class="glyphicon glyphicon-chevron-left"> </span>';
			tag += '											</a>';
			tag += '										</li>';
													}
												<%-- 왼쪽 페이징 화살표  // 페이지 번호가 1보다 클경우 이전으로 돌아갈 수 있게--%>
												if(page > 1) {
			tag += '										<li class="">';
			tag += '										<a href="javascript:ajaxpage()">';
			tag += '												<span class="glyphicon glyphicon-chevron-left"> </span>';
			tag += '											</a>';
			tag += '										</li>';
												}
												<%-- 페이지 총 번호 // 1,2,3,4,5등 총 페이지 수만큼 반복문--%>
												for( var a = startPage-1 ;a <= endPage; a++) {
													if(a==page) {
			tag += '											<li class="active">';
			tag += '											<a href="javascript:ajaxpage()">';
			tag += 													a;			
			tag += '												</a>';
			tag += '											</li>';
													}
													if(a!=page) {
			tag += '											<li class="">';
			tag += '												<a href="javascript:ajaxpage()">'+a+'</a>';
			tag += '											</li>';
													}
												<%-- 오른쪽 화살표 페이징 // 현재 페이징 번호가 최대 페이징 수 보다 클경우 클릭 불가 --%>
													if(page>=totalPage) {
			tag += '											<li class="disabled">';
			tag += '												<a href="#">'; 
			tag += '													<span class="glyphicon glyphicon-chevron-right"></span>';
			tag += '												</a>';
			tag += '											</li>';
													}
												<%-- 오른쪽 화살표 페이징 // 현재 페이징 번호가 최대 페이징 수 보다 작을 경우 클릭 가능 --%>
													if(page < totalPage) {
			tag += '										<li class="">';
			tag += '											<a href="javascript:ajaxpage()">';
			tag += '												<span class="glyphicon glyphicon-chevron-right"> </span>';
			tag += '											</a>';
			tag += '										</li>';
													}
			tag += '								</ul>';
												}

			$('#paging').append(tag);	
		}
}

</script>
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
