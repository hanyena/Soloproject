<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/tag.jsp"%>
<!--start: Header -->
<header>
	<!--start: Logo -->
	<div class="logo span3">
		<a class="brand" href="${path}/index.do">
		<img src="${path}/resources/img/logo1.PNG" alt="Logo"></a>
	</div>

	<!--start: Navigation -->
	<div class="span9 span9-2">
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">이용안내 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${path}/guide.do">이용안내</a></li>
							</ul></li>


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">자료마당 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${path}/data/newbook.do">신간안내</a></li>
								<li><a href="${path}/data/recommend.do">추천도서</a></li>
								<li><a href="${path}/data/search.do">도서검색</a></li>
							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">열린마당 <b class="caret"></b></a>
							<ul class="dropdown-menu">
<%-- 								<li><a href="${path}/open/list.do">공지사항</a></li> --%>
								<li><a href="${path}/open/list.do">자유게시판</a></li>
<%-- 								<li><a href="${path}/open/list.do">FAQ</a></li> --%>
							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">나만의 도서관 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="${path}/mylibrary/borrow.do">도서대출</a></li>
							</ul>
						</li>
						<c:if test="${empty UserSession}">
							<li><a href="javascript:naver.openLogin();">로그인</a></li>
						</c:if>
						<c:if test="${!empty UserSession}">
							<li><a href="javascript:naver.openLogout();">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--end: Logo -->
</header>
<!--end: Header-->