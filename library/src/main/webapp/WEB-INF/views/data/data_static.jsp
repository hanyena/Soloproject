<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 변수 선언 부분	 -->
<script type="text/javascript">
var data = {
	// 추천 도서 화면
	createHtml : function(){
	    $(".newbook_ul .newbook_li").empty();
		for(var i = 0; i < 5; i++){
			var tag = "";
			tag += '<div style="float: left">';
			tag += '<a href="#"></a>';
		    tag += '</div>';
		    tag += '<div>';
	   	    tag += '<h3>';
			tag += '<a href="#">'+ data1[i].title +'</a>';
			tag += '</h3>';	
			tag += '<p class="author">'+ data1[i].author +'</p>';
			tag += '<p class="proInfo">'+ data1[i].publisher + '</p>';
			tag += '<p class="location">' + data1[i].price + '</p>';
			tag += '</div>';
			$(".newbook_ul .newbook_li").append(tag);
		};
	},
	// 추천 도서 데이터 불러오기
	initData : function(){
		$.ajax({
			url : "${path}/data/recommend.do",
			type : "POST",
			async : false
		}).done(function(data){
			console.log(data);
			data.createHtml();
		})
		
	}
}
</script>
<!-- 실행 부분 -->
<script type="text/javascript">
	$(document).ready(function() {
		// 데이터 담을 배열 변수 선언
		var data1 = []; 
		data.initData();
	});
</script>
