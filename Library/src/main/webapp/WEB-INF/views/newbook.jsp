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
							  <a href=""><img src="resources/img/icons/homeicon.PNG"   style="height: 20px" alt=""/></a>  >  
							  <a href="" onclick="">이용안내</a>  > 이용안내
						 </p>
				

				
					
					<!-- start: 신간안내-->
					<div >
					    <br>
						<div><h3>신간안내</h3></div>
							
<!--테이블 크기  -->
					<table border="1" class="table100">
					 <tr>
					  <th class="margin">
					   <label>월별검색</label>
					   </th>
					  <td>
					    <select id ="search_dy" name="a_dy">
					      <option value = "2018" selected="selected">2018<option>
					      <option value = "2017">2017<option>
					      <option value = "2016">2016<option>
					    </select> 년
   					 <br>
   					 <% for(int i = 1; i < 7; i++){ %>
   					     <input id ="a_dm<%=i%>" name="a_dm" type="radio" value="<%=i%>"> 
   					     <lable for = "a_m<%=i%>"> <%=i%>월</label>
   					 <% } %>
   					 <br>
   					 <% for(int i = 7; i < 13; i++){ %>
   					     <input id ="a_dm<%=i%>" name="a_dm" type="radio" value="<%=i%>"> 
   					     <lable for = "a_m<%=i%>"> <%=i%>월</label>
   					 <% } %>
   					 </td>
   					 </tr>
   					 
   					 
   					 <tr>
   					   <th class="margin">
   					     <label>출력건수</label>
   					   </th>
   					   <td>
					     <select id ="search_dy" name="a_vp">
					       <option value = "10" selected="selected">10<option>
					       <option value = "30">30<option>
					       <option value = "50">50<option>
					     </select> 년
					     <input type="submit" value="검색">
					   </td>
   					 </tr>
   					</table>
					</div>	
					<!-- end: 신간안내-->
				
				</div>
				<br>
				<br>
				
				
				<div>
				 <ul class="newbook_ul">
				  <%for (int i = 1; i<11; ++i){%>              
                    <li class="newbook_li">
					  <div style="float:left">
						   <a href="#"><img src="resources/img/뻐큐.jpg" style="width: 75px; height: 113px;"></a> 
						  
						  
					  </div>
					  <div >
						   <h3>
						    <a href="">책 제목</a>
						   </h3>
						   <p class="author"> 저자 </p>
						   <p class="proInfo"> 출판사 </p>
						   <p class="location"> 책 코드 </p>
						  </div>
					  
					 </li>
                  <% }%>
					
				 </ul>
				</div>	
			</div>
			<!--end: Row-->
		</div>
	
	</div>
	
	
		<!--end: Container-->


	
	<!-- end: Wrapper  -->			



	

	<!-- start: Copyright -->
	<div id="copyright">
	
	
		
			<p>
				예뚱예뚱
			</p>
	
	
		
	</div>	
	<!-- end: Copyright -->

</body>
</html>