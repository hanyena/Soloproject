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
<div class="container">
	<!--start: Header -->
	<header>
			<!--start: Row -->
			<div class="row">
				<!--start: Logo -->
				<div class="logo span3">
					<a class="brand" href="#"><img src="resources/img/logo1.PNG" alt="Logo"></a>
				</div>
				<!--end: Logo -->
				<div>
					<ul>
						<li class="li-inline"><a href="#">로그인</a></li>
<!-- 						<li class="li-inline"><a href="#">회원가입</a></li> -->
						<li class="li-inline"><a href="index.html" style="font-weight:1000;">Home</a></li>
					</ul>
				</div>
			</div>
			<!--end: Row -->	
	</header>
	<!--end: Header-->
	
	
		
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
			                			<a href="#" class="dropdown-toggle"
								data-toggle="dropdown">이용안내 <b class="caret"></b></a>
								<ul class="dropdown-menu">

			                  				<li><a href="${path}/guide">이용안내</a></li>
			                			</ul>
			              			</li>
			              			
			              			<li class="dropdown">
			                			<a href="#" class="dropdown-toggle" data-toggle="dropdown">자료마당 <b class="caret"></b></a>
			                			<ul class="dropdown-menu">
			                  				<li><a href="#">신간안내</a></li>
			                  				<li><a href="#">추천도서</a></li>
			                  				<li><a href="#">도서검색</a></li>
			                			</ul>
			              			</li>
			              			
			              			<li class="dropdown">
			                			<a href="#" class="dropdown-toggle" data-toggle="dropdown">열린마당 <b class="caret"></b></a>
			                			<ul class="dropdown-menu">
			                  				<li><a href="#">공지사항</a></li>
			                  				<li><a href="#">자유게시판</a></li>
			                  				<li><a href="#">FAQ</a></li>
			                			</ul>
			              			</li>
			              			
			              			<li class="dropdown">
			                			<a href="#" class="dropdown-toggle" data-toggle="dropdown">나만의 도서관 <b class="caret"></b></a>
			                			<ul class="dropdown-menu">
			                  				<li><a href="#">도서대출</a></li>
			                			</ul>
			              			</li>
			            		</ul>
			          		</div>
			        	</div>
			      	</div>
				</div>
			
    	<!-- start: Slider -->
	<div class="slider-wrapper">
		<div id="da-slider" class="da-slider">
			<div class="da-slide">
				
				<p>책은 마음의 양식....낄낄</p>
				<a href="#" class="da-link">Read more</a>
				<div class="da-img"><img src="resources/img/banner/배너1.jpg" alt="image01" /></div>
			</div>
			<div class="da-slide">
			
			
				<a href="#" class="da-link">Read more</a>
				<div class="da-img"><img src="resources/img/banner/배너2.jpg" alt="image02" /></div>
			</div>
			<div class="da-slide">
				
				<a href="#" class="da-link">Read more</a>
				<div class="da-img"><img src="resources/img/banner/배너3.jpg" alt="image03" /></div>
			</div>
			<div class="da-slide">
				
				<a href="#" class="da-link">Read more</a>
				<div class="da-img"><img src="resources/img/banner/배너4.jpg" alt="image04" /></div>
			</div>
			<nav class="da-arrows">
				<span class="da-arrows-prev"></span>
				<span class="da-arrows-next"></span>
			</nav>
		</div>
	</div>
	<!-- end: Slider -->

	<!-- 검색기능  -->
	<form class="col-md-12">
       <div class="col-md-12 text-center">
         <select id="keyField" name="keyField" class="form-control" style=>
                   <option value="ALL">전체</option>
                   <option value="WRITER">이름</option>
                   <option value="TITLE">제목</option>
         </select>
         
         <input id="keyWord" type="text" size="16" name="KeyWord" id="KeyWord"  class="form-control input-tag" placeholder="Search for..."> 
         <input id="search" type="submit" value="검색" style="display : inline-block;"> 
         <input type="hidden"  name="page" value="0">
       </div>
     </form>
	
	
	
  	<!-- start Clients List -->	
	<div class="col-md-12">
		<div class="text-center col-md-4">
			<img class="img-responsive" style="display:inline-block;max-width: 150px;height: auto;"  src="resources/img/logos/검색아이콘.jpg" alt="a"/>		
		</div>
		<div class="text-center col-md-4">
			<img class="img-responsive" src="resources/img/logos/2.png"  style="display:inline-block; max-width: 100%;height: auto;" alt="b"/>
		</div>
		<div class="text-center col-md-4">
			<img class="img-responsive" src="resources/img/logos/3.png" style="display:inline-block; max-width: 100%;height: auto;" alt="c"/>
		</div>
	</div>


    		<!-- start: Row -->
    		<div class="row">

      		<div class="col-md-4">
        			<div class="icons-box">
				<i class="ico-ok circle big"></i>
				<div class="title"><h3>공지사항</h3></div>
				<p>그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고
				</p>
				<div class="clear"></div>
			</div>
      		</div>

      		<div class="col-md-4">
        			<div class="icons-box">
				<i class="ico-ipad circle big"></i>
				<div class="title"><h3>추천도서</h3></div>
				<p>철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다
				</p>
				<div class="clear"></div>
			</div>
      		</div>

      		<div class="col-md-4">
        			<div class="icons-box">
				<i class="ico-heart circle big"></i>
				<div class="title"><h3>BEST대출</h3></div>
				<p>
					철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다
				</p>
				<div class="clear"></div>
			</div>
      		</div>

    		</div>
	<!-- end: Row -->
      		
	<hr>
		
		
		

	<!-- start: Copyright -->
	<div id="copyright">
	
		<!-- start: Container -->
		<div>
		
			<p>
				예뚱예뚱
			</p>
	
		</div>
		<!-- end: Container  -->
		
	</div>	
	<!-- end: Copyright -->


</div>

</body>
</html>