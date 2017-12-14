<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Page(Concert)</title>

<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/dashboard.css"/>'>

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
				<li class="active"><a href="#">공연 목록<span class="sr-only">(current)</span></a></li>
				<li><a href="/admin/select/place">공연 시설 목록</a></li>
				<li><a href="/admin/select/boxoffice">주간 박스오피스</a></li>
			</ul>

			<ul class="nav nav-sidebar">
				<li><a href="/admin/member">사용자 정보 관리</a></li>
				<li><a href="/admin/comment">코멘트 관리</a>
			</ul>
		</div>

		<div id="content" class="container-fluid">
			<!-- page Content 부분 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">공연 목록</h1>

				<div class="placeholders">
					<div>
						<div class="btn-group">
      		 				<button class="btn btn-primary active" value="0">전	체</button>
       						<button class="btn btn-primary" value="1">공연 완료</button>
       						<button class="btn btn-primary" value="2">공연 중</button>
       						<button class="btn btn-primary" value="3">공연 예정</button>	
						</div>
						
						<div class="col-md-4 col-md-offset-4">
							<select class="form-control" id="filter">
								<option value="ALL">전		체</option>
								<option value="PRFNM">공연명</option>
								<option value="GENRENM">공연 장르</option>
							</select>

							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search..."
									id="value"> <span class="input-group-btn">
									<button class="btn btn-primary" type="button"
										onclick="ajaxList();">
										<i>search</i>
									</button>
								</span>
							</div>
						</div>
						<br> <br>
						<div class="pull-right">
							<br> <span>공연 DB 갯수 <span class="badge"></span></span>
						</div>
						<div class="clearfix"></div>
						<div class="placeholder">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>공연 ID</th>
											<th>공연명</th>
											<th>공연시작일</th>
											<th>공연종료일</th>
											<th>공연시설명</th>
											<th>공연 장르</th>
											<th>공연 런타임</th>
										</tr>
									</thead>
									<tbody id="table-body">
									</tbody>
								</table>
								<%@include file="../paging.jsp"%>
							</div>
						</div>
					</div>
					<div>
						<button class="btn btn-sm btn-info" onclick="location.href='/admin/applyConcert'">공연 정보 등록</button>
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
			
			$('.btn-group button').on('click',function(){
				$(this).addClass('active').siblings().removeClass('active');
			});
		});
		
		var ajaxList = function() {
			var submitData = {};
			submitData.index = paging.p.index;
			submitData.pageStartNum = paging.p.pageStartNum;
			submitData.filter = $('#filter').val();
			submitData.value = $('#value').val();
			submitData.type = $(".btn-group .btn.btn-primary.active").attr('value');
			console.log(submitData);
			    $.ajax({
			        url: '/admin/select/concert',
			        type: 'post',
			        data: submitData,
			        success : function(obj){
			        		$("#table-body").empty();    
			        	
			            var str = '';
			            $.each(obj.list, function(index, concert) {
			            		str += "<tr>";
							str += "<td>"+concert.mt20id+"</td>";
							str += "<td>"+concert.prfnm+"</td>";
							str += "<td>"+concert.prfpdfrom+"</td>";
							str += "<td>"+concert.prfpdto+"</td>";
							str += "<td>"+concert.fcltynm+"</td>";
							str += "<td>"+concert.genrenm+"</td>";
							str += "<td>"+concert.prfruntime+"</td>";
							str += "</tr>";
						});
			            
			            $("#table-body").append(str);
			            $(".badge").html(obj.p.total);
			            
			            paging.p = obj.p;
			            paging.create();
			        }
			    });   
		};
	</script>
</body>
</html>