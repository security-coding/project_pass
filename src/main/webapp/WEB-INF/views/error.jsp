<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.min.css">
<title>Error Page</title>
<style>
body {
	margin: 0 auto;
	width: 75%;
}

.text-center {
	text-align: center;
}

.text-danger {
	color: #f33155
}

.error-body {
	padding-top: 5%
}

@media ( max-width : 767px) {
	.error-body h1 {
		font-size: 80px;
		line-height: 100px;
	}
}

.error-body h1 {
	font-size: 210px;
	font-weight: 900;
	line-height: 210px
}

.btn-rounded {
	border-radius: 60px
}
</style>
</head>
<body>
	<section id="wrapper" class="error-page">
		<div class="error-body text-center">
			<h1 class="text-danger">${errCode}</h1>
			<h3 class="text-uppercase">${msg}</h3>
			<p class="text-muted m-t-30 m-b-30">아래 버튼을 통해 다시 돌아가실 수 있습니다</p>
			<a href="/" class="btn btn-danger btn-rounded">Back to Main</a>
		</div>
	</section>


</body>
</html>