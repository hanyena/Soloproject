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
  </header>
  <!--end: header -->
			
	
			
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
							  <a href=""><img src="resources/img/icons/homeicon.PNG" style="height: 20px" alt=""></a>    
							  <a href="" onclick="">나만의 도서관</a>  > 도서대출
						 </p>
						<!-- start: 도서대출-->
						<div>
							<img src="${path}/resources/img/도서대출.PNG" alt="" style="width:100vw">
							<button type="button" id="borrow_button" name="">대출내역조회</button>
						</div>
						<table border="1" id="borrow_tableline" class="table100 table" >
					    	<tr>
					 			<th>
					   				<label for = "">서명</label>
					  	   		</th>
					  
                            	<th>
					   	 			<label for = "">낱권정보</label>
					 			 </th>
					 			 
  								<th>
					    			<label for = "">대출일</label>
					 			</th>
					 			
								<th>
								    <label for = "">반납예정일</label>
								</th>
								
								<th>
					   				<label for = "">연체일수</label>
					  			</th>
					  			
								<th>
					  				<label for = "">상태</label>
					 			</th>
								<th>
					    			<label for = "">연기</label>
					  			</th>
   						 </tr>
   						 <tr>
                         <!-- colspan: 셀 확장 수 -->
   						 	<td colspan="7" id="borrow_td">등록된 자료가 없습니다.</td>
   						 </tr>
   					   </table>
   					   
   					   <button type="button" id="borrow_button" name="" style="margin-left: 5px">대출예약취소</button>
   					   <button type="button" id="borrow_button" name="">반납연기</button>
					</div>
												
			
					
					   <!-- end: 도서대출-->
				
				</div>
				<br>
				<br>
				
			</div>
			<!--end: Row-->
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