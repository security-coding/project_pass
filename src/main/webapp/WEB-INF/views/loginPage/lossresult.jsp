<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

		
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
	.fail{
		color: #c91a6e;
		
	}
</style>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<body>
	<div>
	<article class="container-fluid">
	<div class="page-header">
		<h1>아이디찾기 결과</h1>
	</div>
	<div class="col-xs-8 col-sm-6">
		<form id="idForm" class="form-horizontal" role="form" method="post">
			<!-- form -->
			<div class="form-group text-center">
				<p class="user">당신의아이디는:${resultid} 입니다.</p>
				<p class="fail">존재하지 않을 시 아이디가 띄워지지 않습니다.</p>
			<input type="button" value="비밀번호찾기" class="btn btn-info" onclick="document.location.href='./userloss'">
			</div>
		</form>
	</div>
	</article>
	</div>

</body>

<!-- /container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!--부트스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> -->

</html>