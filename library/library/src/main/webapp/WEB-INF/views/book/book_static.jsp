<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp" %>
<!-- 변수 선언 부분	 -->
<script type="text/javascript">
var book = {
		// 데이터를 담을 배열 선언
		dataSource : [],
		createBookLibraryList : function(){
			if(location.hash == ""){
				start = 0;
			}
			end = book.dataSource.length > (start + 10) ? (start + 10) : book.dataSource.length;
// 			console.log(start);
// 			console.log(end);
			if(book.dataSource.length < 0 ) {
				tag += "<tr>";
				tag += "<td colspan='4' id='borrow_td'>등록된 자료가 없습니다.</td>";
				tag += "</tr>";
				$("#borrow_tableline").append(tag);
			} else {
				for(var i = start; i < end; i++){
					var tag = "";
					tag += '<tr>';
					tag += '<td id="borrow_id">' + book.dataSource[i].title + '</td>';
					tag += '<td id="borrow_id">' + book.dataSource[i].startdate1 + '</td>';
					tag += '<td id="borrow_id">' + book.dataSource[i].enddate1 + '</td>';
					tag += '</tr>';
					console.log(tag);
					$("#borrow_tableline").append(tag);
				};
			}
		},
		initBookLibraryList : function(){
			$.ajax({
				url : "${path}/mylibrary/json/borrow.do",
				type : "POST",
				async : false
			}).done(function(resultData){
				console.log(resultData);
				// rentlibrary테이블 값들 테이블에 담기
				book.dataSource = resultData.rent;
				totCnt = book.dataSource.length;
				util.createHtmlPaging();
				book.createBookLibraryList();
			}).fail(function(d){
				alert("fail");
			})
		}
}
</script>

<!-- 실행 부분 -->
<script type="text/javascript">
$(document).ready(function() {
	book.initBookLibraryList();
});
</script>
