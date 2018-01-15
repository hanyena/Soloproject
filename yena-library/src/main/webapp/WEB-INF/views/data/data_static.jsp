<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 변수 선언 부분	 -->
<script type="text/javascript">
var data = {
		// 추천 목록 화면
		recommend : function(){
			$.ajax({
				url:"${path}/data/recommend.do",
				type:"GET",
			}).done(function(data){
				alert(data);
			})
		},
		// 추천 목록 데이터 불러오기
		initData : function(){
			$.ajax({
				url : "${path}/data/recommend.do",
				type : "POST",
				async : false,
			}).done(function(data){
				data.recommend();
			})
		}
}
</script>
<!-- 실행 부분 -->
<script type="text/javascript">
	$(document).ready(function() {
		data.initData();
		
	});
</script>
