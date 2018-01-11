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
    <script type="text/javascript">
    $(document).ready(function(){
    	
    	 var data1 = []; // 데이터 담을 배열 변수 선언
    	
    	function createHtml(){ 
    		$(".container .row .span8 tbody").empty(); 
    		 for (var i = 0; i < data1.length; i++) {
    			 var tag ="";
    			 tag += '<tr>';
    			
    			  tag += '<td>' + data1[i].title + '</td>';
    			  tag += '<td>' + data1[i].regname + '</td>'; 
    			  tag += '<td>' + data1[i].regdate + '</td>';
    			  tag += '<td>' + data1[i].boardcnt + '</td>'; 
    			  tag += '</tr>';
    		 $(".container .row .span8 tbody").append(tag);
    			 
             };
    	 };
    	
       function initData(){
    	$.ajax({
    		url:"board_data",
    		type:"post",
    		data:{"d":"d"}
    		}).done(function(result){
    			  d = JSON.parse(result);
    			  console.log(result);
    			  console.log(d);
    	          data1 = d.board;
    	          createHtml(); 
    		}).fail(function(d){
    			alert("fail");
    		});
    	};
    	initData();
    });
    </script>
   
</head>
<body>
<!-- 최근 본 목록 -->
<div class="newview">
	<div id="newview_div"></div>

</div>
	<!--start: 중심부 내용-->
		<!--start: Container -->
    	<div class="container">
			<!--start: Header -->
			<header>
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
							  <a href="" onclick="">열린마당</a>  > 자유게시판 
						 </p>
						 
					<!-- start: 신간안내-->
					<div>
					    <br>
						<div><h3>자유게시판</h3></div>
						<table  id="board_top" class="table100 table">
							 <thead>
							  <tr id="board_bottom">
							   <th >제목 </th>
							   <th>작성자</th>
							   <th>날짜 </th>
							   <th>조회수 </th>
							  </tr>
							  </thead>
							  <tbody>
<!-- 							    <tr> -->
<!-- 							     <td>책제목입니다</td> -->
<!-- 							     <td>예뚱이</td> -->
<!-- 							     <td>오늘</td>     -->
<!-- 							     <td>500</td> -->
<!-- 							    </tr> -->
<!-- 							     <tr> -->
<!-- 							     <td>책제목입니다</td> -->
<!-- 							     <td>예뚱이</td> -->
<!-- 							     <td>오늘</td>     -->
<!-- 							     <td>500</td> -->
<!-- 							    </tr> -->
<!-- 							     <tr> -->
<!-- 							     <td>책제목입니다</td> -->
<!-- 							     <td>예뚱이</td> -->
<!-- 							     <td>오늘</td>     -->
<!-- 							     <td>500</td> -->
<!-- 							    </tr> -->
							  </tbody>
						 </table>
					<!-- end: 자유게시판-->
					 <button type="button"  id="board_write" class="btn btn-default text-white bg-redred writbtn3 boardInput_button" onclick="">삭제</button>
					 <button type="button"  id="board_write" class="btn btn-default text-white bg-redred writbtn3 boardInput_button" onclick="">수정</button>
					 <button type="button"  id="board_write" class="btn btn-default text-white bg-redred writbtn3 boardInput_button" onclick="location.href='boardInput'">쓰기</button>
					</div>
				<br>
				<br>
							<!-- 검색기능  -->
				<form class="boardright">
			       <div>
			         <select id="board_keyField" name="keyField" class="form-control" style=>
			                   <option value="ALL">전체</option>
			                   <option value="WRITER">이름</option>
			                   <option value="TITLE">제목</option>
			         </select>
			         <input id="board_keyWord" type="text" size="16" name="KeyWord" id="KeyWord"  class="form-control" placeholder="Search for..."> 
			         <input id="board_search" type="submit" value="검색" style="display : inline-block;"> 
			         <input type="hidden"  name="page" value="0">
			       </div>
			     </form>
							
				
			
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