<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>
<div class="location">
	<p class="main_p">
		<a href=""><img src="${path}/resources/img/icons/homeicon.PNG"
			style="height: 20px" alt="" /></a> &gt; <a href="" onclick="">열린마당</a>
		&gt; 자유게시판
	</p>
	<!-- start: 신간안내-->
	<div id="board">
		<br>
		<div>
			<h3>자유게시판</h3>
		</div>
		<table id="board" class="table100 table board">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div>
			<!-- end: 자유게시판-->
			<button type="button" id="board_write"
				class="btn btn-default text-white bg-redred writbtn3 boardInput_button"
				onclick="location.href='${path}/open/writeform.do'">쓰기</button>
		</div>
	</div>
	<br> <br>
	<!-- 검색기능  -->
	<form class="boardright">
		<div>
			<select id="board_keyField" name="keyField" class="form-control"
				style=>
				<option value="ALL">전체</option>
				<option value="WRITER">이름</option>
				<option value="TITLE">제목</option>
			</select> <input id="board_keyWord" type="text" size="16" name="KeyWord"
				id="KeyWord" class="form-control" placeholder="Search for...">
			<input id="board_search" type="submit" value="검색"
				style="display: inline-block;"> <input type="hidden"
				name="page" value="0">
		</div>
	</form>
</div>
