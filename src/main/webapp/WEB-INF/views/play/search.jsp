<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result page (search.jsp)</title>
 
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>

<style>
@import url('http://fonts.googleapis.com/earlyaccess/jejugothic.css');

body, table, div, p, h {
	font-family: 'Jeju Gothic'
}
</style>
</head>
  <body>
  <div>
    <%@include file="../header.jsp"%>
</div>

<!-- Page Content -->
<div class="container" style="margin-top: 100px">


<!-- Page Heading -->
	<div>
		<!-- Search Widget -->
		<form action="/play/search" onsubmit="return blank()">
			<div class="card my-4">
				<h2 class="wrapper"><p>검색</p></h2>
					<div class="input-group">
						<input id="keyword" name="keyword" type="text"
							class="form-control" placeholder="공연 제목 입력"> <span
							class="input-group-btn"> <input class="btn btn-secondary"
							type="submit" value="검색" />
						</span>
					</div>


						<!-- Search Result Value -->
						<c:forEach var="keyword" items="${keyword}">
							<!--뿌리는값 -->
							<div class="col-md-12">
								<hr>
								</div>
							<div class="row">
								<div class="col-md-7" style="width: 30%; height: 50%;">
									<a href="/play/detail?mt20id=${keyword.mt20id}"> <img
										class="img-fluid rounded mb-3 mb-md-0"
										src="${keyword.imageUrl}" width="250" height="370"
										alt="poster's imageurl" />
									</a>
								</div>

								<div class="col-md-5" align="left">
									<h3>${keyword.prfnm}</h3>
									<hr>
									
				<p>
					<li><span>공연 시작일 :</span> ${keyword.prfpdfrom}</li><p></p>
					<li><span>공연 종료일 :</span> ${keyword.prfpdto}</li><p></p>
					<li><span>공연 총시간 :</span> ${keyword.dtguidance}</li><p></p>
					<li><span>공연 시설명 :</span> ${keyword.fcltynm}</li><p></p>
				</p>
									<hr />
								</div>
								<div class="col-md-11">
								<hr>
								</div>
							</div>
						</c:forEach>
						<c:if test="${empty keyword}">
						
							<section id="wrapper" style="margin-top: 20%; margin-bottom: 15%;">
								<div class="error-body text-center">							
									<h1><p class="text-muted m-t-30 m-b-30" style="margin-bottom: 3%">해당 검색 결과가 없습니다.</p></h1>
									<h4><p class="text-muted m-t-30 m-b-30" style="margin-bottom: 2%">다시 한번 검색하기 바랍니다.</p></h4>
									
									<a href="/" class="btn btn-danger btn-rounded">메인으로 돌아가기</a>
								</div>
							</section>
					</c:if>
						
						<!-- Footer -->
						<footer>
						<div>
						<%@include file="../footer.jsp" %>
						</div>
						</footer>

    <!-- Bootstrap core JavaScript -->
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</body>
</html>