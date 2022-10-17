<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>

	<div id="wrap" align="center">
		<h1>사원 리스트</h1>
		<table class="list">
			<tr>
				<td colspan=5 style="border:white; text-align:right">
					<div>
						<button id="regBtn" type="button" class="btn btn-xs pull-right">
						 사원정보등록
						</button>
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">아이디</th>
				<th style="text-align: center;">이름</th>
				<th style="text-align: center;">권한</th>
				<th style="text-align: center;">성별</th>
				<th style="text-align: center;">전화번호</th>
			</tr>
			<c:forEach var="employee" items="${list }">
				<tr class="record">
					<td>${employee.id}</td>
					<td>
						<a href='/employee/get?id=<c:out value="${employee.id}"/>' class="move">
						<c:out value="${employee.name }"/></a>
					</td>
					<td>
						<c:choose>
							<c:when test="${employee.lev=='A' }">
								운영자
							</c:when>
							<c:otherwise>
								일반사원
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${employee.gender=='1' }">
								남자
							</c:when>
							<c:otherwise>
								여자
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:out value="${employee.phone}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<form id="actionForm" action="/employee/get" method="get">
		<input type="hidden" name="id" value='<c:out value="${employee.id }"/>'>
	</form>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		
		$("#regBtn").on("click", function(){
			self.location = "/employee/register";
		});
		
		history.replaceState({}, null, null);
		
		function checkModal(result){
			if(result===''){
				return;
			}
			
			if(result==='exit'){
				$(".modal-body").html("이미 사용중인 아이디입니다.");
			}else if(result==='insert'){
				$(".modal-body").html("사원 정보가 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
	});
</script>
	
	
<%@ include file="../includes/footer.jsp" %>