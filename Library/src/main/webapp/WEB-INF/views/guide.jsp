<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/tag.jsp" %>     
<!DOCTYPE html>
<html>
<head>
   	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   	<meta name="description" content="GotYa Free Bootstrap Theme"/>
	<meta name="keywords" content="Template, Theme, web, html5, css3, Bootstrap" />
	<meta name="author" content="Łukasz Holeczek from creativeLabs"/>
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
                			<a href="#" class="dropdown-toggle"data-toggle="dropdown">이용안내 <b class="caret"></b></a>
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
				<div id="side" class="span4" style="background-color: pink; ">
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
							  <a href=""><img src="resources/img/icons/homeicon.PNG"   style="height: 20px" alt=""/></a>  >  
							  <a href="" onclick="">이용안내</a>  > 이용안내
						 </p>
					<div>

				
					
					<!-- start: 이용안내 -->
					<div id="about">
					    <br>
						<div><h3>이용안내</h3></div>
						<p>
							도서 대출 및 반납 기간
							
</p><p>
							● 자격 :  도서관 회원 
								<p>
							● 자료수  : 1인 3권이내
							</p><p>
							● 대출기간  :  대출일로부터  2주(1회 1주간 연장)
							</p>
							<p>
							● 반납일 : 자료의 반납예정일이 휴관일인 경우 휴관일 다음날까지로 함
									
							
							
							~~
						</p>
					</div>	
					<!-- end: About Us -->
				
					
				</div>	
				
			</div>
			<!--end: Row-->
		</div>
	
	</div>
	</div>
	
		<!--end: Container-->


	
	<!-- end: Wrapper  -->			



	

	<!-- start: Copyright -->
	<div id="copyright">
	
		<!-- start: Container -->
		<div class="container">
		
			<p>
				예뚱예뚱
			</p>
	
		</div>
		<!-- end: Container  -->
		
	</div>	
	<!-- end: Copyright -->

</body>
</html>