<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title><tiles:getAsString name="title" defaultValue="aaaa"/></title>
<tiles:insertAttribute name="static" ignore="true"/>
<tiles:insertAttribute name="pagestatic" ignore="true" />
</head>

<body>
	<!-- 최근 본 목록 -->
<!-- 	<div class="newview"> -->
<!-- 		<div id="newview_div"></div> -->

	</div>
	<div class="container">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="copyright" />
	</div>
</body>

</html>
