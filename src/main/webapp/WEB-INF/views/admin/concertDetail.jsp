<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Page(Concert)</title>
    
	<script src='<c:url value="/js/paging.js"/>'></script>

    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/dashboard.css"/>'>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Pass Admin Page</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
        <ul class="nav nav-sidebar">
            <li><p>공연 관련 정보 관리</p></li>
            <li><a href="/admin">정보 업데이트</a></li>
            <li class="active"><a href="#">공연 목록<span class="sr-only">(current)</span></a></li>
            <li><a href="#">공연 시설 목록</a></li>
            <li><a href="#">주간 박스오피스</a></li>
        </ul>

        <ul class="nav nav-sidebar">
            <li><p>사용자 정보 관리</p></li>
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
        </ul>

        <ul class="nav nav-sidebar">
            <li><p>코멘트 & 기타 관리</p></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
        </ul>
    </div>

    <div id="content" class="container-fluid">
        <!-- page Content 부분 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">공연 상세 정보</h1>
            
            <div class="placeholder">
            		<h3>${concert.mt20id }</h3>
            </div>
        </div>
    </div>
</div>

<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
</body>
</html>