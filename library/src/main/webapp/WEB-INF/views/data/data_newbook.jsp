<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/tag.jsp" %>
<div class="location">
	<p class="main_p">
		<a href=""><img src="${path}/resources/img/icons/homeicon.PNG"
	style="height: 20px" alt="" /></a> > <a href="" onclick="">이용안내</a> > 이용안내
	</p>
	<!-- start: 신간안내-->
	<div>
		<br>
		<div>
			<h3>신간안내</h3>
		</div>

		<!--테이블 크기  -->
		<table border="1" class="table100">
			<tr>
				<th class="margin"><label>월별검색</label></th>
				<td>
					<select id="search_dy" name="a_dy">
						<option value="2018" selected="selected">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
					</select> 년 
					<br>
					<% for (int i = 1; i < 7; i++) {%> 
						<input id="a_dm<%=i%>" name="a_dm" type="radio" value="<%=i%>">
						<lable for="a_m<%=i%>"> <%=i%>월</label>
					<%}%> 
					<br>
					<% for (int i = 7; i < 13; i++) {%> 
						<input id="a_dm<%=i%>" name="a_dm" type="radio" value="<%=i%>">
						<lable for="a_m<%=i%>"> <%=i%>월</label>
					<%}%>
				</td>
			</tr>
			<tr>
				<th class="margin"><label>출력건수</label></th>
				<td>
					<select id="search_dy" name="a_vp">
						<option value="10" selected="selected">10</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select> 년 
					<button id="newbook_search" name="newbook_search" onclick="javascript:data.initDataNewbook();">검색</button>
				</td>
			</tr>
		</table>
	</div>
	<!-- end: 신간안내-->
</div>
<br>
<br>

<!-- 조건 검색 시 나타나는 리스트 -->
<div id="newbooklist">
<!-- 			<ul class="newbook_ul"> -->
<%-- 				<%for (int i = 1; i < 11; ++i) {%> --%>
<!-- 					<li class="newbook_li"> -->
<!-- 						<div style="float: left"> -->
<%-- 							<a href="#"><img src="${path}/resources/img/뻐큐.jpg" style="width: 75px; height: 113px;"></a> --%>
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<h3> -->
<!-- 								<a href="">책 제목</a> -->
<!-- 							</h3> -->
<!-- 							<p class="author">저자</p> -->
<!-- 							<p class="proInfo">출판사</p> -->
<!-- 							<p class="location">책 코드</p> -->
<!-- 						</div> -->
<!-- 					</li> -->
<%-- 				<%}%> --%>
<!-- 			</ul> -->
</div>
