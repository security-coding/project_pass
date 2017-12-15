<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Page(comment)</title>

<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/dashboard.css"/>'>

<style>
	.table th {
		text-align: center;
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
                <a class="navbar-brand" href="/">Main Page로 이동</a>
			</div>
		</div>
	</nav>

	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="/admin">공연 정보 업데이트</a></li>
				<li><a href="/admin/select/concert">공연 목록</a></li>
				<li><a href="/admin/select/place">공연 시설 목록</a></li>
				<li><a href="/admin/select/boxoffice">주간 박스오피스</a></li>
			</ul>

			<ul class="nav nav-sidebar">
				<li><a href="/admin/member">사용자 정보 관리</a></li>
				<li class="active"><a href="#">코멘트 관리<span class="sr-only">(current)</span></a>
			</ul>
		</div>
	
		<div id="content" class="container-fluid">
			<!-- page Content 부분 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">코멘트 관리</h1>

				<div class="placeholders">
					<div>
						<div class="col-md-4 col-md-offset-4">
							<select class="form-control" id="filter">
								<option value="ALL">전 체</option>
								<option value="COMMENTCONTENT">게시글 내용</option>
								<option value="ID">유저 아이디</option>
							</select>

							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="검색어를 입력해주세요."
									   id="value"> <span class="input-group-btn">
									<button class="btn btn-primary" type="button"
											onclick="searchComment();">
										<i>search</i>
									</button>
								</span>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="placeholder">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>작성자</th>
											<th>작성 내용</th>
											<th>작성 일자</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="table-body">
									</tbody>
								</table>
							</div>
							<%@include file="../paging.jsp" %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
	<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
	
		<script>
		$(function() {
			paging.ajax = ajaxList;
			ajaxList();
		});
			
		var ajaxList = function() {
			var submitData = {};
			submitData.index = paging.p.index;
			submitData.pageStartNum = paging.p.pageStartNum;
            submitData.filter = $('#filter').val();
            submitData.value = $('#value').val();
			
			    $.ajax({
			        url: '/admin/comment',
			        type: 'post',
			        data: submitData,
			        success : function(obj){
			        		$("#table-body").empty();    
			        	
			            var str = '';
			            $.each(obj.list, function(index, comment) {
			            		str += "<tr>";
			            		str += "<td class='col-md-1'>"+comment.commentNum+"</td>";
			            		str += "<td class='col-md-2'>"+comment.id+"</td>";
			            		str += "<td class='col-md-6'>"+comment.commentContent+"</td>";
			            		str += "<td>"+comment.commentDate+"</td>";
			            		str += "<td class='col-md-1'><button class='btn-sm btn-danger'"
			            				+" style='width:100%;' onclick='deleteComment("+comment.commentNum+")'>삭		제</button></td>";
							str += "</tr>";
						});
			            
			            $("#table-body").append(str);
			            $(".badge").html(obj.p.total);
			            
			            paging.p = obj.p;
			            paging.create();
			        }
			    });   
		};
		
		function deleteComment(num) {
			var submitData = {};
			submitData.commentNum = num;
			$.ajax({
				url : "/admin/comment/delete",
				data : submitData,
				type: "POST",
				success: function() {
					alert("삭제가 완료 되었습니다.");
					ajaxList();
				},
				error:function(){
		            alert("삭제에 실패 하였습니다.");
		        }
			});
		}

        function searchComment() {
            paging.p.index = 0;
            paging.p.pageStartNum = 1;
            ajaxList();
        }
	</script>
</body>
</html>