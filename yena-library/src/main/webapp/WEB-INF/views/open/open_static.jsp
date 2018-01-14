<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		alert('board');
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {

		var data1 = []; // 데이터 담을 배열 변수 선언

		function createHtml() {
			$("#board_top  tbody").empty();
			for (var i = 0; i < data1.length; i++) {
				var tag = "";
				tag += '<tr>';

				tag += '<td>' + data1[i].title + '</td>';
				tag += '<td>' + data1[i].regname + '</td>';
				tag += '<td>' + data1[i].regdate + '</td>';
				tag += '<td>' + data1[i].boardcnt + '</td>';
				tag += '</tr>';
				$("#board_top > tbody").append(tag);

			}
			;
		}
		;

		function initData() {
			$.ajax({
				url : "${path}/open/board_data",
				type : "POST",
				data : {
				},
				async : false
			}).done(function(result) {
				console.log(result);
				data1 = result.board;
				createHtml();
			}).fail(function(d) {
				alert("fail");
			});
		};
		initData();
	});
</script>