<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp"  %>

	<div id="wrap" align="center">
		<h1>사원정보 등록</h1>
		<form name="frm" id="frm" method="post" action="/employee/register">
			<table style="width: 600px">
				<tr>
					<th>아이디</th>
					<td><input type="text" size="60" name="id" class="form-control"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" size="60" name="pass" class="form-control"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" size="60" name="name" class="form-control"></td>
				</tr>
				<tr>
					<th>권한</th>
					<td>
						<select name="lev">
							<option value="A">운영자</option>
							<option value="B">일반사원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender">
							<option value="1">남자</option>
							<option value="2">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone">
					</td>
				</tr>
			</table>
			<br>
			<button type="submit" class="btn btn-default" data-oper='register'>확인</button>
			<button type="reset" class="btn btn-default">취소</button>
			<button type="submit" class="btn btn-default" data-oper='list'>목록</button>
		</form>
	</div>
<<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("#frm");
	
	$("button[data-oper='register']").on("click", function(e){
		if(!formObj.find("input[name='id']").val()){
			alert("아이디를 입력하세요.");
			return false;
		}
	
		if(!formObj.find("input[name='pass']").val()){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(!formObj.find("input[name='name']").val()){
			alert("사원이름을 입력하세요.");
			return false;
		}
		
		e.preventDefault();
		formObj.submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		formObj.attr("action", "/employee/list").attr("method", "get");
		formObj.submit();
	});
});
</script>	
	
<%@ include file="../includes/footer.jsp"  %>



