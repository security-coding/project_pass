<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<div id="navbar" class="navbar-collapse collapse"> -->
		<form class="navbar-form navbar-right" role="form" method="post" action="/member/login" onsubmit="CertifyCheck()">
			<div class="form-group">
				<!-- modal 구동 버튼 (trigger) -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">로그인</button>
				<button type="button" class="btn btn-primary"
					onclick="document.location.href='joinForm'">회원가입</button>
			</div>
</body>
</html>