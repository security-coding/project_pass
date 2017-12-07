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
				<a class="navbar-brand" href="#">Pass Admin Page</a>
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
						<div class="clearfix"></div>
						<div class="placeholder">
							<div class="col-lg-6 col-md-6">
							<table class="table table-bordered table-hover">
								<thead>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
		<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
</body>
</html>