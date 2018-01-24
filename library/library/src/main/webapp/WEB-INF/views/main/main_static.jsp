<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>
<script type="text/javascript">
// 	var main={
// 			// 추천도서 데이터 불러오기
// 			initDataRecommend : function() {
// 				$.ajax({
// 					url : "${path}/data/json/recommend.do",
// 					type : "POST"
// 				}).done(function(resultData){
// 					console.log(resultData);
// 					main.createhtmlRecommend(resultData.recommend);
// 				}).fail(function(d) {
// 					alert("실패");
// 				});
// 			},
// 			// 추천도서 목록 화면 생성
// 			createhtmlRecommend : function(data) {
// 				console.log(data);
// 				$(".main_recommend").empty();
// 					var tag = "";
// 					tag += '<div style="float: left">';
// 					tag += '<a href="${path}/data/recommend.do"><img src="'<c:out value="'+${data.content}+'"/>'" style="width: 75px; height: 113px;"></a>';  
// 					tag += '</div>';
// 					tag += '<div>';
					
// 					tag += '<h3>'
// 						+ '<a href="${path}/data/recommend.do">' 
// 						+ '<c:out value="'+${data.content}+'"/>'
// 						+ '</a>' + '</h3>';
// 					tag += '<p style="
// 					margin-left : 20px;"">' 
// 						+ '<c:out value="'+${data.author}+'"/>'
// 						+ '</p>';
// 					tag += '</div>';
// 				$(".main_recommend").append(tag);
// 			}
// 	}
</script>
<script type="text/javascript">
// $(document).ready(function(){
// 	console.log("aa");
// 	main.initDataRecommend();
// });
</script>