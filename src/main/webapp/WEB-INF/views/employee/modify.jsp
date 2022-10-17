<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

	<div id="wrap" align="center">
		<h1>사원정보 수정</h1>
		<form role="form" name="frm" method="post" action="/employee/modify">
			
			<table style="width: 600px">
				<tr>
					<th style="width: 60px">아이디</th>
					<td><input type="text" size="60" name="id" value="${employee.id }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" size="60" name="pass"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" size="60" name="name" value="${employee.name }"></td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<select name="lev">
							<c:choose>
								<c:when test='${employee.lev=="A" }'>
									<option value="A" selected="selected">운영자</option>
									<option value="B">일반사원</option>
								</c:when>
								<c:otherwise>
									<option value="A">운영자</option>
									<option value="B" selected="selected">일반사원</option>
								</c:otherwise>
							</c:choose>	
						</select>						
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender">
							<c:choose>
								<c:when test='${employee.gender==1 }'>
									<option value="1" selected="selected">남자</option>
									<option value="2">여자</option>
								</c:when>
								<c:otherwise>
									<option value="1">남자</option>
									<option value="2" selected="selected">여자</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" value="${employee.phone }">
					</td>
				</tr>
			</table>
			<br>
			<button type="submit" class="btn btn-default" data-oper='modify'>확인</button>
			<button type="reset" class="btn btn-default">취소</button>
			<button type="submit" class="btn btn-default" data-oper='list'>목록</button>
		</form>
	</div>
<script>
$(document).ready(function(){
	var formObj = $('form');
	
	$('button').on("click", function(e){
		e.preventDefault();
		var operation = $(this).data("oper");
		
		if(operation === 'modify'){
			formObj.attr("action", "/employee/modify");
		}else if(operation === 'list'){
			formObj.attr("action", "/employee/list").attr("method", "get");
			formObj.empty();
		}
		
		formObj.submit();
	});
	
});
</script>

<%@ include file="../includes/footer.jsp" %>


