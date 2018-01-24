<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp"%>

<!-- start: 배너 -->
<div class="slider-wrapper">
	<div id="da-slider" class="da-slider">
		<div class="da-slide">
			<p>예뚱이 도서관</p>
			<a href="#" class="da-link"></a>
<!-- 			<div class="da-img"> -->
<!-- 				<img src="resources/img/banner/banner1.jpg"> -->
<!-- 			</div> -->
<!-- 			<div class="da-img"> -->
<!-- 				<img src="resources/img/banner/banner2.jpg"> -->
<!-- 			</div> -->
<!-- 			<div class="da-img"> -->
<!-- 				<img src="resources/img/banner/banner3.jpg"> -->
<!-- 			</div> -->
<!-- 			<div class="da-img"> -->
<!-- 				<img src="resources/img/banner/banner4.jpg"> -->
<!-- 			</div> -->
		</div>

		<nav class="da-arrows">
			<span class="da-arrows-prev"></span> <span class="da-arrows-next"></span>
		</nav>
	</div>
</div>
<!-- end: Slider -->
<br>
<br>
<!-- 검색기능  --> 
<!-- <form class="col-md-12"> -->
<!-- 	<div class="col-md-12 text-center"> -->
<!-- 		<select id="keyField" name="keyField" class="form-control" style=> -->
<!-- 			<option value="ALL">전체</option> -->
<!-- 			<option value="WRITER">이름</option> -->
<!-- 			<option value="TITLE">제목</option> -->
<!-- 		</select> <input id="keyWord" type="text" size="16" name="KeyWord" id="KeyWord" -->
<!-- 			class="form-control input-tag" placeholder="Search for..."> <input -->
<!-- 			id="search" type="submit" value="검색" style="display: inline-block;"> -->
<!-- 		<input type="hidden" name="page" value="0"> -->
<!-- 	</div> -->
<!-- </form> -->

<!-- start Clients List -->
<div class="col-md-12">
	<div class="text-center col-md-4">
		<a href="${path}/data/search.do"><img class="img-responsive"
			style="display: inline-block; max-width: 150px; height: auto;"
			src="resources/img/logos/search.jpg" alt="a" /></a>
	</div>
	<div class="text-center col-md-4">
		<a href="${path}/mylibrary/borrow.do"><img class="img-responsive" src="resources/img/logos/borrow.png"
			style="display: inline-block; max-width: 150%; height: auto;" alt="b" /></a>
	</div>
	<div class="text-center col-md-4">
		<a href="${path}/open/list.do"><img class="img-responsive" src="resources/img/logos/so.jpg"
			style="display: inline-block; max-width: 150%; height: auto;" alt="c" /></a>
	</div>
</div>


<!-- start: Row -->
<div class="row">
	<div class="col-md-4">
		<div class="icons-box">
				<img src ="${path}/resources/img/icons/question.jpg">
<%-- 				<a href="${path}/guide.do"> --%>
					<div class="title">
						<h3>이용안내</h3>
					</div>
					<h4>　도서 대출 및 반납 기간　　　</h4>
<!-- 					<br> -->
					<span>● 자격 : 도서관 회원　　　　　</span>
<!-- 					<br> -->
					<span>● 자료수 : 1인 3권이내　　　　</span>
<!-- 					<br> -->
					<span>● 대출기간 : 대출일로부터 2주(1회 1주간 연장)</span>
					<br>
					<p>● 반납일 : 자료의 반납예정일이 휴관일인 경우 휴관일 다음날까지로 함 </p>
<!-- 				</a> -->
			<div class="clear"></div>
		</div>
	</div>

	<div class="col-md-4">
		<div class="icons-box">
				<img src ="${path}/resources/img/icons/recommend.jpg">
				<div class="title">
					<h3>추천도서</h3>
				</div>

				<div>
					<ul>
						<li class="main_recommend">
							<div class="main_recommend_book">
								<a href="${path}/data/recommend.do"><img src="<c:out value="${data.image}"></c:out>' style="width: 75px; height: 113px;"></a>
							</div>
							<div class="main_recommend_title">
							<p>
								<c:out value="${data.title}"/>
							</p>
							</div>
							<div class="text_center_re">
								<div><c:out value="${data.author}"/></div>
							</div>
						</li>
					</ul>
				</div>
			<div class="clear"></div> 
		</div>
	</div>

	<div class="col-md-4">
		<div class="icons-box">
			<img src ="${path}/resources/img/icons/best.jpg">
			<a href="${path}/mylibrary/borrow.do">
				<div class="title">
					<h3>BEST대출</h3>
				</div>
				<div style="margin-top:51px;">
					<c:forEach items="${bestview}" var="best">
						<p sytle=""><c:out value="${best.title}"/></p>
					</c:forEach>
				</div>
			</a>
			<div class="clear"></div>
		</div>
	</div>

</div>
<!-- end: Row -->

<hr>