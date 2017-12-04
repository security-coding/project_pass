<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Custom CSS -->
<link rel="stylesheet" href='<c:url value="/css/landing-page.css"/>'>
<!-- Custom Fonts -->
<link rel="stylesheet"
	href='<c:url value="/css/font-awesome/css/font-awesome.min.css"/>'>
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation -->
	<div>
		<nav class="navbar navbar-default navbar-fixed-top topnav"
			role="navigation">
		<div class="container topnav">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand topnav" href="/member/main">Project Pass</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#about">공연 정보</a></li>
					<li><a href="#services">주변 공연 찾기</a></li>
					<li><c:if test="${id==null}">
							<%@include file="../loginPage/login.jsp"%>
						</c:if> <c:if test="${id!=null}">
							<%@include file="../loginPage/loginOk.jsp"%>
						</c:if></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container --> </nav>

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
								<h4 class="modal-title" id="myModalLabel">Log in with your ID</h4>
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
									<p>
										<a href="/member/userloss">아이디/비밀번호찾기</a>
									</p>

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
	</div>
</body>
</html>