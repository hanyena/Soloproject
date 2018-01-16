<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/tag.jsp" %>
<div class="location">
	<p class="main_p">
		<a href=""><img src="${path}/resources/img/icons/homeicon.PNG"
			style="height: 20px" alt="" /></a> > <a href="" onclick="">자료마당</a> >
		추천도서
	</p>
	<!-- start: 신간안내-->
	<div>
		<br>
		<div>
			<h3>추천도서</h3>
		</div>
		<div>
			${data}
			<ul class="recommend_ul">
<!-- 				<li class="recommend_li" -->
<%-- 					onclick="location.href='${path}/data/recommendview.do'"> --%>
<!-- 					<div style="float: left"> -->
<%-- 						<a href="#"><img src="${path}/resources/img/뻐큐.jpg" --%>
<!-- 							style="width: 75px; height: 113px;"></a> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<h3> -->
<!-- 							<a href="#">책 제목</a> -->
<!-- 						</h3> -->
<!-- 						<p class="author">저자</p> -->
<!-- 						<p class="proInfo">출판사</p> -->
<!-- 						<p class="location">책 코드</p> -->
<!-- 					</div> -->
<!-- 				</li> -->

			</ul>
		</div>
		<!-- end: 도서검색-->
	</div>
	<br> <br>
</div>