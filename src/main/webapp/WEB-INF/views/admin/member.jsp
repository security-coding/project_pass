<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Page(member)</title>

<script src='<c:url value="/js/paging.js"/>'></script>

<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/dashboard.css"/>'>

<style>
 .table th {
	color : white;
 	background-color: #428BCA;
 	text-align: center;
 }
 button {
 	width: 100%;
 }
</style>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Pass Admin Page</a>
			</div>
		</div>
	</nav>


	<div class="row">
		<div id="navbar" class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="/admin">공연 정보 업데이트</a></li>
				<li><a href="/admin/select/concert">공연 목록<span class="sr-only">(current)</span></a></li>
				<li><a href="/admin/select/place">공연 시설 목록</a></li>
				<li><a href="/admin/select/boxoffice">주간 박스오피스</a></li>
			</ul>

			<ul class="nav nav-sidebar">
				<li class="active"><a href="#">사용자 정보 관리</a></li>
				<li><a href="">코멘트 관리</a>
			</ul>
		</div>

		<div id="content" class="container-fluid">
			<!-- page Content 부분 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">사용자 정보 관리</h1>

				<div class="placeholders">
					<div>
						<div class="pull-left">
							<label class="radio-inline">
								<input type="radio" name="searchVal" value="" onclick="btn_type();"><span>전체</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="searchVal" value="1" onclick="btn_type();"><span>활성 회원</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="searchVal" value="0" onclick="btn_type();"><span>비활성 회원</span>
							</label>
						</div>
						<div class="pull-right">
							<span>유저 DB 갯수 <span class="badge">${paging.total}</span></span>
						</div>
						<div class="clearfix"></div>
						<div class="placeholder">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>E-Mail</th>
											<th>Addr1</th>
											<th>Addr2</th>
											<th>Certify</th>
											<th>Grade</th>
											<th>Comment</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="member" items="${memberList}">
											<tr>
												<td id="id">${member.id}</td>
												<td id="email">${member.email}</td>
												<td id="addr1">부산시 북구 효열로220번길</td>
												<td id="addr2">누구누구아파트</td>
												<c:choose>
													<c:when test="${member.certify eq 0}"> 
														<td>이메일 미인증</td>
													</c:when>
													<c:when test="${member.certify eq 1}">
														<td>이메일 인증</td>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${member.grade eq 0}">
														<td><button class="btn-sm btn-danger grade" value=0 onclick="changeGrade(this);">Block</button></td>
													</c:when>
													<c:when test="${member.grade eq 1}">
														<td><button class="btn-sm btn-primary grade" value=1 onclick="changeGrade(this);">Active</button></td>
													</c:when>
												</c:choose>
												<td><button class="btn-sm btn-default"><a href="/admin/user/comment?id=${member.id}">confirm</a></button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:if test="${paging.pageStartNum ne 1 }">
										<li><a
											onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>맨
												처음으로</a></li>
										<li><a
											onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'
											aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
									</c:if>

									<c:forEach var='i' begin="${paging.pageStartNum}"
										end="${paging.pageLastNum}" step="1">
										<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
									</c:forEach>

									<c:if test="${paging.lastChk}">
										<li><a
											onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>&raquo;</a></li>
										<li><a
											onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>맨
												마지막으로</a></li>
									</c:if>
								</ul>
							</nav>
							<form action="/admin/member" method="post" id="frmPaging">
								<input type="hidden" name="index" id="index" value="${paging.index}"> 
								<input type="hidden"name="pageStartNum" id="pageStartNum" value="${paging.pageStartNum}">
								<input type="hidden" name="listCnt" id="listCnt" value="${paging.listCnt}">
								<input type="hidden" name="searchFilter" id="searchFilter" value="grade"> 
								<input type="hidden" name="searchValue" id="searchValue" value="${paging.searchValue}">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
	<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
	
		<script>
			function changeGrade(obj) {
				var id = $(obj).parents().prevAll("#id").text();
				var grade = 1 - $(obj).val();
				if(confirm("회원 상태를 변경하시겠습니까?") == true) {
	 				$.ajax({
	 					type : "POST",
	 					url : "/admin/member/changeGrade",
	 					data : {
	 						id : id,
	 						grade : grade
	 					},
	 					success : function() {
	 						if(grade == 0){
	 							$(obj).html('Block');
	 							$(obj).removeClass("btn-primary").addClass("btn-danger");
	 							$(obj).attr('value',grade);
	 						}
	 						else{
	 							$(obj).html('Active');
	 							$(obj).removeClass("btn-danger").addClass("btn-primary");
	 							$(obj).attr('value',grade);
	 						}
	 						alert("회원 상태 변경이 완료되었습니다");
	 					},
	 					error : function(e) {
	 						alert(e.responseText);
	 					}
	 				});		
				console.log(id);
			}
		}
			
		function btn_type() {
			var active = $('input[type="radio"]:checked').val();
			document.getElementById("searchValue").value = active;
			frmPaging();
		}
	</script>
</body>
</html>