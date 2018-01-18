// <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/tag.jsp"%>
<!-- Placed at the end of the document so the pages load faster -->
<script src="${path}/resources/js/jquery-1.8.2.js"></script>
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
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/img/88-1.jpg" />
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
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
				async :  false 
			}).done(function(resultData){
				console.log(resultData);
				util.createHtmlPaging(resultData);
			})
		},
		// 화면생성
		createHtmlPaging : function(result) {
			var tag = "";
			$('#paging').empty();	

			$('#paging').append(tag);	
		}
}

</script>

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

