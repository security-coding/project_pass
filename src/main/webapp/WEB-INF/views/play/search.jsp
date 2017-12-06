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

body, table, div, p {
	font-family: 'Jeju Gothic'
}
</style>

</head>
  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="/">Project Pass</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/play/now">현재 공연작</a>
                    </li>
                    <li>
                        <a href="/play/come">공연 예정작</a>
                    </li>
                    <li>
                        <a href="/place">주변 공연 찾기</a>
                    </li>
                    <li>
                     <c:if test="${id==null}">
						<%@include file="../loginPage/login.jsp"%>
					</c:if> 
					<c:if test="${id!=null}">
						<%@include file="../loginPage/loginOk.jsp"%>
					</c:if>
					</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
   	<div>
	<!-- Modal -->
	<form>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">로그인</h4>
					</div>
					<form class="signform" name="signupform">
						<div name="inputform" class="modal-body container-fluid">
							<label for="id">ID:<input type="text" id="id" name="id"
								class="form-control" placeholder="id"></label><br> <label
								for="pass">password:<input type="password"
								id="password" name="password" class="form-control"
								placeholder="password"></label><br>
						</div>

						<div class="modal-footer">
							<button id="reset" type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button id="login" type="submit" class="btn btn-primary">로그인</button>
							<td><p>
									<a href="../member/userloss">아이디/비밀번호찾기></a>
								</p>
							<td>
						</div>
					</form>

				</div>
				<!-- modal-content의 div끝 -->

			</div>
			<!-- modal-dialog의 div끝 -->

		</div>
	</form>
	<!--모달 내용 서브밋form-->
	</form>
	<!--모달 부르는 버튼 form-->
	<!--모달 끝-->
</div>
<div class="-" style="height: 100px;"></div>
					<!-- Page Content -->
					<div class="container">

<!-- Page Heading -->
	<div>
		<!-- Search Widget -->
		<form action="/play/search" onsubmit="return blank()">
			<div class="card my-4">
				<h5 class="card-header">Search</h5>
				<div class="card-body">
					<div class="input-group">
						<input id="keyword" name="keyword" type="text"
							class="form-control" placeholder="공연 제목 입력"> <span
							class="input-group-btn"> <input class="btn btn-secondary"
							type="submit" value="검색" />
						</span>
					</div>
<div class="" style="height: 100px;"></div>

						<!-- Search Result Value -->
						<c:forEach var="keyword" items="${keyword}">
							<!--뿌리는값 -->
							<div class="col-md-11">
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
						<!-- Footer -->
						<footer class="py-5 bg-dark">
						<div class="container">
						<hr>
						</div>
						<!-- /.container --> </footer>

    <!-- Bootstrap core JavaScript -->
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</body>
</html>