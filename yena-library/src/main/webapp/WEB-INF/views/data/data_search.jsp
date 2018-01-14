<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="main" class="span8">
	<div class="location">
		<p class="main_p">
			<a href=""><img src="${path}/resources/img/icons/homeicon.PNG"
				style="height: 20px" alt="" /></a> <a href="" onclick="">자료마당</a> >
			도서검색
		</p>

		<br>
		<div>
			<h3>도서검색</h3>
		</div>
		<div class="search_table">
			<!-- start: 도서검색-->
			<table border="1" class="table100 table">
				<tr>
					<th><label for="">정렬조건</label></th>
					<td><select id="" name="">
							<option value="발행연도" selected="selected">발행연도</option>
							<option value="도서명">도서명</option>
							<option value="저자">저자</option>
							<option value="출판사">출판사</option>
					</select> <select id="" name="">
							<option value="오름차순" selected="selected">오름차순</option>
							<option value="내림차순">내림차순</option>
					</select> <br></td>
					<th><label for="">도서구분</label></th>
					<td><select id="" name="">
							<option value="전체" selected="selected">전체</option>
							<option value="단행">단행</option>
							<option value="연속">연속</option>
							<option value="기사">기사</option></td>
				</tr>
				<tr>
					<th><label for="">본문언어</label></th>
					<td><select id="" name="">
							<option value="전체" selected="selected">전체</option>
							<option value="한국어">한국어</option>
							<option value="영어">영어</option>
							<option value="중국어">중국어</option>
					</select></td>
					<th><label for="">요약문언어</label></th>
					<td><select id="" name="">
							<option value="전체" selected="selected">전체</option>
							<option value="한국어">한국어</option>
							<option value="영어">영어</option>
					</select></td>
				</tr>
				<tr>
					<th><label for="">발행년도</label></th>
					<td><input id="startdate" type="text" name="StartYear"
						size="5" title="발행년도 시작">부터 <input id="enddate"
						type="text" name="EndYear" size="5" title="발행년도 끝">까지</td>
					<th><label for="">쪽당출력건수</label></th>
					<td><select id="" name="">
							<option value="10" selected="selected">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
					</select></td>
				</tr>
			</table>
			<!-- 검색기능  -->

			<form class="col-md-12">
				<div class="col-md-12" id="search_search">
					<select id="s_keyField" name="keyField" class="form-control"
						style="">
						<option value="ALL">전체</option>
						<option value="WRITER">이름</option>
						<option value="TITLE">제목</option>
					</select> <input id="keyWord" type="text" size="16" name="keyWord"
						class="form-control input-tag" placeholder="Search for...">
					<input id="search" type="submit" value="검색"
						style="display: inline-block;"> <input type="hidden"
						name="page" value="0">
				</div>

			</form>
			<!-- end: 도서검색-->

		</div>
		<br> <br>
		<div>
			<ul class="newbook_ul">
				<%
					for (int i = 1; i < 11; ++i) {
				%>
				<li class="newbook_li">
					<div style="float: left">
						<a href="#"><img src="resources/img/뻐큐.jpg"
							style="width: 75px; height: 113px;"></a>


					</div>
					<div>
						<h3>
							<a href="">책 제목</a>
						</h3>
						<p class="author">저자</p>
						<p class="proInfo">출판사</p>
						<p class="location">책 코드</p>
					</div>

				</li>
				<%
					}
				%>

			</ul>
		</div>
	</div>
</div>