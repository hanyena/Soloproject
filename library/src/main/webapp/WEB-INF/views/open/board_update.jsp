<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/tag.jsp" %>
<div class="location">
	<p class="main_p">
		<a href=""><img src="${path}/resources/img/icons/homeicon.PNG"
			style="height: 20px" alt="" /></a> > <a href="" onclick="">열린마당</a> >
		자유게시판
	</p>
	<br> <br>
	<!-- start: 글쓰기 형식-->
	<div id="board_line">
		<br>
		<div>
			<h3>글쓰기</h3>
		</div>

		<form id="updateform" name="updateform">
			<input type="hidden" id="no" name="no"
				value="<c:out value="${data.no}"/>"> <input type="hidden"
				id="id" name="id" value="<c:out value="${data.id}"/>">

			<div class="form-group">
				<label for="subject" class="col-xs-6 control-label">제목</label>
				<div class="col-xs-6">
					<input type="text" class="form-control inputformne" id="title"
						name="title" value="<c:out value="${data.title}"/>">
				</div>
			</div>

			<div class="form-group">
				<label for="cont" class="col-xs-6 control-label">내용</label>
				<div class="col-xs-6">
					<textarea id="cont" name="content" class=" form-control col-xs-12"
						rows="300" cols="100"><c:out value="${data.content}"/></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-3">
					<button type="button"
						class="btn text-white bg-redred writbtn3 boardInput_button"
						onclick="location.href='javascript:history.go(-1)'">목록</button>
					<button type="button"
						class="btn btn-default text-white bg-redred writbtn3 boardInput_button"
						id="write" onclick="javascript:board.update()">수정</button>
				</div>
			</div>
		</form>

		<!-- end: 글쓰기-->
	</div>
	<br> <br>
</div>
<!--end: Row-->



