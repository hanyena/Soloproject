<%@page import="java.net.*"%>
<%@page import="java.math.*"%>
<%@page import="java.security.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>

<!-- Placed at the end of the document so the pages load faster -->
<script src="${path}/resources/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	// json형식으로 바꿔줌
	$(function() {
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
	})
</script>
<script src="${path}/resources/js/bootstrap.js"></script>
<script src="${path}/resources/js/flexslider.js"></script>
<script src="${path}/resources/js/carousel.js"></script>
<script src="${path}/resources/js/jquery.cslider.js"></script>
<script src="${path}/resources/js/slider.js"></script>
<script defer="defer" src="${path}/resources/js/custom.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="${path}/resources/ckeditor/ckeditor.js"></script>
<!-- end: Java Script -->
<link href="${path}/resources/css/bootstrap2.css" rel="stylesheet">
<link href="${path}/resources/css/guide.css" rel="stylesheet">
<link href="${path}/resources/css/newbook.css" rel="stylesheet">
<link href="${path}/resources/css/board.css" rel="stylesheet">
<link href="${path}/resources/css/boardInput.css" rel="stylesheet">
<link href="${path}/resources/css/manager.css" rel="stylesheet">
<link href="${path}/resources/css/search.css" rel="stylesheet">
<link href="${path}/resources/css/borrow.css" rel="stylesheet">
<link href="${path}/resources/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="${path}/resources/img/88-1.jpg" />
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Droid+Serif">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Boogaloo">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Economica:700,400italic">
<!--내가 만든 css영역  -->
<link rel="stylesheet" href="${path}/resources/css/index.css">
<%
	String redirectURI = URLEncoder.encode("http://localhost:8080/api/naverProc.do", "UTF-8");
	SecureRandom random = new SecureRandom();
	// BigInteger : 시간에 따라 랜덤으로 url생성
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + "qaDsBz29qTp5KqA2mbJZ";
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
%>
<script type="text/javascript">
	var naver = {
		openLogin : function() {

			var apiURL = "<%=apiURL%>";
			window.open(apiURL, 'naverloginpop',
							'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550');
		},
		closeLogin : function() {
			opener.parent.location.reload();
			window.close();
		},
		moveLogout : function() {
			var apiURL = "${path}/api/naverlogout.do";
			window.open(apiURL, 'naverloginpop',
							'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550');
// 			window.opener.close();
// 			location.reload();
		}
	}
</script>
