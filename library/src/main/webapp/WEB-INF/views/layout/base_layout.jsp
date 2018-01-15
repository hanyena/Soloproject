<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>
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
			</div>

		</div>
		<hr>
		<tiles:insertAttribute name="copyright" />
	</div>

</body>

</html>
