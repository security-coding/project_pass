<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Page(Place)</title>
    
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
            <li><a href="/admin/select/concert">공연 목록</a></li>
            <li class="active"><a href="#">공연 시설 목록<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/select/boxoffice">주간 박스오피스</a></li>
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
            <h1 class="page-header">공연 시설 목록</h1>

            <div class="placeholders">
                <div class="pull-right">
                    <span>공연 시설 DB 갯수 <span class="badge">${paging.total}</span></span>
                </div>
                <div class="clearfix"></div>
                <div class="placeholder">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>공연시설 ID</th>
                                <th>공연시설 명</th>
                                <th>공연시작일</th>
                                <th>공연종료일</th>
                                <th>공연시설명</th>
                                <th>공연 장르</th>
                                <th>공연 런타임</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="concert" items="${concertList}">
                            <tr>
                              	<td><a href="/admin/select/concert/${concert.mt20id}">${concert.mt20id }</a></td>
                              	<td>${concert.prfnm }</td>
                              	<td>${concert.prfpdfrom }</td>
                              	<td>${concert.prfpdto }</td>
                              	<td>${concert.fcltynm }</td>
                              	<td>${concert.genrenm }</td>
                              	<td>${concert.prfruntime }</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            
                        </table>
                    </div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                        		<c:if test="${paging.pageStartNum ne 1 }">
                            		<li><a onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>맨 처음으로</a></li>
                            		<li><a onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});' aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                            </c:if>
                            
                            <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">
                            		<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
                            </c:forEach>
                            
                            <c:if test="${paging.lastChk}">
                            		<li><a onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>&raquo;</a></li>
                            		<li><a onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>맨 마지막으로</a></li>
                            </c:if>
                        </ul>
                    </nav>
                    <form action="/admin/select/concert" method="post" id="frmPaging">
                    		<input type="hidden" name="index" id="index" value="${paging.index}">
                    		<input type="hidden" name="pageStartNum" id="pageStartNum" value="${paging.pageStartNum}">
                    		<input type="hidden" name="listCnt" id="listCnt" value="${paging.listCnt}">
                    </form>
                    
                    <div class="pull-right">
                    		<button>공연 정보 추가</button>
                    		<button>선택 정보 삭제</button>
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