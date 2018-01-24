<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>
<div class="location">
	<p class="main_p">
		<a href=""><img src="${path}/resources/img/icons/homeicon.PNG"
			style="height: 20px" alt="" /></a> <a href="" onclick="">자료마당</a> > 도서검색
	</p>
	<br>
	<div>
		<h3>도서검색</h3>
	</div>
	
	<!--form안에 select태그가 있으면 name값을 키 값으로 option선택한 값이 자동 선택됨  -->
	<form id="librarySearch" name="librarySearch">
		<!-- start: 조건검색테이블-->
		<div class="search_table">
			<table border="1" class="table100 table">
				<tr>
					<th><label for="arraycondition">검색조건</label></th>
					<td  colspan="4">
						<select id="arraycondition" name="arraycondition">
							<option value="bookname" selected="selected">도서명</option>
							<option value="author">저자</option>
							<option value="publisher">출판사</option>
						</select> 
						<select id="ordertype" name="ordertype">
							<option value="asc" selected="selected">오름차순</option>
							<option value="desc">내림차순</option>
						</select> 
					<br>
					</td>
				</tr>
				<tr>
					<th><label for="startyear">발행년도</label></th>
					<td><input id="startdate" type="text" name="startyear" size="5" title="발행년도 시작">부터 
					<input id="enddate" type="text" name="endyear" size="5" title="발행년도 끝">까지</td>
					<th><label for="booksize">쪽당출력건수</label></th>
					<td><select id="booksize" name="booksize" onchange="javascript:data.viewRow();">
							<option value="10" selected="selected">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
					</select></td>
				</tr>
			</table>


			<!-- start: 도서 검색 기능-->	
			<div class="col-md-12" id="search_search">
				<select id="s_keyField" name="keyField" class="form-control"
					style="">
					<option value="all">전체</option>
				</select> 
				<input id="keyWord" type="text" size="16" name="keyWord"
					class="form-control input-tag" placeholder="Search for...">
				<button id="search" type="button" style="display: inline-block"; 
				 onclick="javascript:data.initDataSearch();">검색</button>
<!-- <input type="hidden" name="page" value="0"> -->
			</div>
			
		</div>
		<!-- 조건검색테이블  -->
<%-- 			<input type="hidden" name="member_id" value="${UserSession.id}"/> --%>
<%-- 		<input type="hidden" name="searchperson" value="${UserSession.name}"/> --%>
		
	</form>
	<!-- end: 도서 검색 기능-->

<br>
<br> 
<!-- 	<form name ="dladml" id="dladml"> -->
		<div id="searchlist">
			<!-- 		<ul class="search_ul"> -->
			<%-- 			<%for (int i = 1; i < 11; ++i) {%> --%>
			<!-- 			<li class="search_li"> -->
			<!-- 				<div style="float: left"> -->
			<%-- 					<a href="#"><img src="${path}/resources/img/뻐큐.jpg" --%>
			<!-- 						style="width: 75px; height: 113px;"></a> -->
			<!-- 				</div> -->
			<!-- 				<div> -->
			<!-- 					<h3> -->
			<!-- 						<a href="">책 제목</a> -->
			<!-- 					</h3> -->
			<!-- 					<p class="author">저자</p> -->
			<!-- 					<p class="proInfo">출판사</p> -->
			<!-- 					<p class="location" style="display: inline-block;">책 코드</p> -->
			<!-- 					<button type="button" style="float: right" onclick="">대여</button> -->
			<!-- 				</div> -->
			<!-- 			</li> -->
			<%-- 			<%}%> --%>
			<!-- 		</ul> -->
		</div>
<%-- 		<input type="hidden" name="member_id" value="${UserSession.id}"/> --%>
<!-- 		<input type="hidden" name="library_no" value=""/> -->
<!-- </form> -->
</div>
