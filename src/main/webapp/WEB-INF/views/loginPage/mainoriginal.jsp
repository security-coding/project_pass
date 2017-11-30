<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<script>
	$(document).ready(function() {
		let Certify = ${dbCertify};
		if (Certify == 0) {
			alert("회원가입 이메일 인증을 안하셨습니다.");
		}
		document.location.href = "./main";
	});
</script>

<style>
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!--네이게시션바-->
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project name</a> <a
					class="navbar-brand" href="#">공연정보</a> <a class="navbar-brand"
					href="#">시설정보</a>
			</div>

			<!--로그인 안할시 로그인버튼리아 회원가입버튼을 나타나게함-->
			<c:if test="${id==null}">
				<%@include file="login.jsp"%>
			</c:if>

			<c:if test="${id!=null}">
				<%@include file="loginOk.jsp"%>
			</c:if>
		</div>
		<!--/.navbar-collapse -->
		</div>
	</nav>
	<!-- 제일 상단에 있는 네이게션 바 검은색배경부분 -->

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
										<a href="/member/userloss">아이디/비밀번호찾기
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


	<!-- /container -->

	<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
	<!--부트스트랩-->
	<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</body>
</html>



