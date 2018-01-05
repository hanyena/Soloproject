<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/tag.jsp" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="description" content="GotYa Free Bootstrap Theme" />
			<meta name="keywords" content="Template, Theme, web, html5, css3, Bootstrap" />
			<meta name="author" content="Łukasz Holeczek from creativeLabs" />
			<!--반응형 -->
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<%@ include file="/WEB-INF/cdn.jsp" %>

		</head>

		<body>
			<!-- 최근 본 목록 -->
			<div class="newview">

			</div>
			<!--start: 중심부 내용-->
			<!--start: Container -->
			<div class="container">
				<header>
					<!--start: Header -->
					<!--start: Logo -->
					<div class="logo span3">
						<a class="brand" href="${path}/index"><img src="resources/img/logo1.PNG" alt="Logo"></a>
					</div>
					<!--start: Navigation -->
					<div class="span9 span9-2">
						<div class="navbar navbar-inverse">
							<div class="navbar-inner">
								<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            		<span class="icon-bar"></span>
            		<span class="icon-bar"></span>
            		<span class="icon-bar"></span>
          		</a>
								<div class="nav-collapse collapse">
									<ul class="nav">
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">이용안내 <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="${path}/guide">이용안내</a></li>
											</ul>
										</li>

										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">자료마당 <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="${path}/newbook">신간안내</a></li>
												<li><a href="${path}/recommend">추천도서</a></li>
												<li><a href="${path}/search">도서검색</a></li>
											</ul>
										</li>

										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">열린마당 <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="${path}/board">공지사항</a></li>
												<li><a href="${path}/board">자유게시판</a></li>
												<li><a href="${path}/board">FAQ</a></li>
											</ul>
										</li>

										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">나만의 도서관 <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="${path}/borrow">도서대출</a></li>
											</ul>
										</li>
										<li><a href="#">로그인</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!--end: Logo -->
					<div>
						<ul>
						</ul>
					</div>

				</header>





				<!--start: Row -->
				<div class="row">
					<div id="side" class="span4" style="background-color: pink;">
						<!-- start: Sidebar -->
						<div id="sidebar">
							<!-- start: Skills -->
							<div class="title" style="text-align: center">
								<br>
								<h3>이용안내 </h3>
								<br>
								<span style="text-align: center;">knowledge In library</span>
							</div>


							<ul class="tester" style="text-align: center;">
								<li class="active aa">이용안내</li>
							</ul>
						</div>
						<!-- end: Sidebar -->

					</div>


					<div id="main" class="span8">
						<div class="location">
							<p class="main_p">
								<a href=""><img src="resources/img/icons/homeicon.PNG" style="height: 20px" alt=""/></a> >
								<a href="" onclick="">자료마당</a> > 추천도서
							</p>
							<!-- start: 추천관리자 -->
							<div>
								<ul class="newbook_ul">
									<li class="newbook_li">
										<div style="float:left">
											<a href="#"><img src="resources/img/뻐큐.jpg" style="width: 75px; height: 113px;"></a>

										</div>
										<div>
											<h3>
												<a href="">책 제목</a>
											</h3>
											<p class="author"> 저자 </p>
											<p class="location"> 서평 </p>
											<p> 이 책은 최근 큰 화제를 모은 OtvN 프리미엄 특강쇼 〈어쩌다 어른〉의 발달음악가 김성은 ‘삶은 리듬이다’ 편을 책으로 엮은 것이다. 음악, 그중에서도 ‘리듬’이 우리 삶에 미치는 영향을 심도 있게 연구하는 저자가 ‘ 내 삶을 바꾸는 리듬의 힘’에 대해 설명한다. 모든 사람은 저마다 고유한 리듬을 가지고 있다. 그 리듬을 가지고 일도 하고, 연애도 하고, 아이도 키우고, 수많은 사람을 사귀며 살아간다. 이 과정에서 관계를 이끌어가는 리듬은 따로 있다. 원활한 소통을 위해, 조직의 팀워크를 위해, 리더십을 발휘하기 위해 필요한 리듬 활용법은 각각 다를 수밖에 없다. 이에 따라 나는 어떤 리듬을 가지고 있으며, 나에게 맞는 리듬이 무엇인지 파악하는 것은 중요하다. 이 책을 통해 자신의 리듬을 파악하는 법부터 대인관계의 리듬법칙을 알고, 음악적 리듬을 일상생활에 활용할 수 있다면, 내 삶이 좀더 아름다워질 것이다.</p>
										</div>
									</li>
								</ul>
							</div>

							<!-- end: 추천관리자-->

						</div>
						<br>
						<br>

					</div>
					<!--end: Row-->
				</div>
			</div>
			<!--end: Container-->

			<!-- start: Copyright -->
			<div id="copyright">

				<p>
					예뚱예뚱
				</p>

			</div>
			<!-- end: Copyright -->

		</body>

		</html>
