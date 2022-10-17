<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

	<div id="wrap" align="center">
		<h1>사원정보 보기</h1>
			<table style="width: 600px">
				<tr>
					<th>아이디</th>
					<td>${employee.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${employee.pass }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${employee.name }</td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<c:choose>
							<c:when test='${employee.lev=="A" }'>운영자</c:when>
							<c:otherwise>일반사원</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<c:choose>
							<c:when test='${employee.gender=="1" }'>남자</c:when>
							<c:otherwise>여자</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						${employee.phone }
					</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>
						${employee.enter }
					</td>
				</tr>
			</table>
			<br>
			<button data-oper='modify' class="btn btn-default">수정</button>
			<button data-oper='remove' class="btn btn-default">삭제</button>
			<button data-oper='list' class="btn btn-default">목록</button>
			<button data-oper='register' class="btn btn-default">등록</button>
		
		<form id="frm" method="get" action="/employee/modify">
			<input type="hidden" id="id" name="id" value='<c:out value="${employee.id }"/>'>
		</form>
	</div>
<script>
	$(document).ready(function(){
		var formObj = $("#frm");
		
		$("button[data-oper='modify']").on("click", function(e){
			formObj.attr("action", "/employee/modify").submit();
		});
		
		$("button[data-oper='remove'").on("click", function(e){
			formObj.attr("action", "/employee/delete").attr("method", "post");
			formObj.submit();
		});
		
		$("button[data-oper='list'").on("click", function(e){
			formObj.find('#id').remove();
			formObj.attr("action", "/employee/list").submit();
		});
		
		$("button[data-oper='register'").on("click", function(e){
			formObj.find('#id').remove();
			formObj.attr("action", "/employee/register").submit();
		});
		
	});
</script>	

<%@ include file="../includes/footer.jsp" %>









	