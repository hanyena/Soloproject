<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp" %>
	<div class="location">
		<p class="main_p">
			<a href=""><img src="${path}/resources/img/icons/homeicon.PNG"
				style="height: 20px" alt=""></a> <a href="" onclick="">나만의 도서관</a>
			&gt; 도서대출
		</p>
		<!-- start: 도서대출-->
		<div>
			<img src="${path}/resources/img/yenayena.PNG" alt="" style="width: 100vw">
<!-- 			<button type="button" id="borrow_button" name="">대출내역조회</button> -->
		</div>
		<br>
		<br>
		<table border="2" id="borrow_tableline" class="table100 table">
			<tr>
				<th><label for="">책 제목</label></th>
				<th><label for="">대출일</label></th>
				<th style="border-right: 2px solid;"><label for="">반납예정일</label></th>
			</tr>

		</table>
	</div>
	<!-- end: 도서대출-->
