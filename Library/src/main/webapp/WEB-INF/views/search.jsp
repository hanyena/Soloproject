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
							  <a href=""><img src="resources/img/icons/homeicon.PNG" style="height: 20px" alt=""/></a>  
							  <a href="" onclick="">자료마당</a>  > 도서검색
						 </p>
						 
			
					  <br>
					<div><h3>도서검색</h3></div>
				<div class="search_table">
					<!-- start: 도서검색-->
					<table border="1"  class="table100 table">
					 <tr>
					  <th >
					    <label for = "">정렬조건</label>
					  </th>
					  <td>
					     <select id ="" name="">
					       <option value = "발행연도" selected="selected">발행연도<option>
					       <option value = "도서명">도서명<option>
					       <option value = "저자">저자<option>
                           <option value = "출판사">출판사<option>
					     </select> 
                          <select id ="" name="">
					       <option value = "오름차순" selected="selected">오름차순<option>
					       <option value = "내림차순">내림차순<option>
					     </select>
   					     <br>
   					  </td>
   					  <th>
					    <label for = "">도서구분</label>
					  </th>
					  <td>
					     <select id ="" name="">
					       <option value = "전체" selected="selected">전체<option>
					       <option value = "단행">단행<option>
					       <option value = "연속">연속<option>
                           <option value = "기사">기사<option>
   					  </td>
   					 </tr>
   					 <tr>
   					   <th>
   					     <label for = "">본문언어</label>
   					   </th>
   					   <td>
					     <select id ="" name="">
					       <option value = "전체" selected="selected">전체<option>
					       <option value = "한국어">한국어<option>
					       <option value = "영어">영어<option>
                           <option value = "중국어">중국어<option>
					     </select> 
					   </td>
					   <th>
					    <label for = "">요약문언어</label>
					   </th>
					  <td>
					     <select id ="" name="">
					       <option value = "전체" selected="selected">전체<option>
					       <option value = "한국어">한국어<option>
					       <option value = "영어">영어<option>
					     </select> 
   					  </td>
   					 </tr>
                   	<tr>
   					   <th>
   					     <label for = "">발행년도</label>
   					   </th>
   					   <td>
<!-- 달력 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
						<script type="text/javascript">
							$(function() {
								$('#startdate').datepicker({
								
								});
								$('#enddate').datepicker({
								
								});	
							})
						</script>
					     <input id="startdate" type="text" name="StartYear" size="5" title="발행년도 시작" >부터 
                                             <input id="enddate" type="text" name="EndYear" size="5" title="발행년도 끝">까지
					   </td>
					   <th>
					    <label for = "">쪽당출력건수</label>
					  </th>
					  <td>
					     <select id ="" name="">
					       <option value = "10" selected="selected">10<option>
					       <option value = "15">15<option>
					       <option value = "20">20<option>    
					     </select> 
   					  </td>
   					 </tr>
   					</table>
   					<!-- 검색기능  -->
	<form class="col-md-12">
       <div class="col-md-12" id="search_search">
         <select id="s_keyField" name="keyField" class="form-control" style="">
                   <option value="ALL">전체</option>
                   <option value="WRITER">이름</option>
                   <option value="TITLE">제목</option>
         </select>
         
         <input id="keyWord" type="text" size="16" name="KeyWord" id="KeyWord"  class="form-control input-tag" placeholder="Search for..."> 
         <input id="search" type="submit" value="검색" style="display : inline-block;"> 
         <input type="hidden"  name="page" value="0">
       </div>
     </form>
					
					<!-- end: 도서검색-->
				
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