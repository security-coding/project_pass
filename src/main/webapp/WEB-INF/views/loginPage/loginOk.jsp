<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<style type="text/css">
	.user{
	float:left;
	padding-top:5px; 
	width: 145px;
	}
	.user_a{
		text-decoration: none;
		color: white;
	}
	.user_a:hover{
		color:gray;
		text-decoration: none;
	}
</style>
</head>

<body>
	
	<form class="navbar-form navbar-right" action="/member/logout" method="post">
		<p class="user"><a href="/member/mypage" class="user_a"><img alt="" src="${imageUrl}"></a>님...환영합니다</p><button class="btn btn-primary" id="logout">로그아웃</button> 
		<!-- 버튼태그가 form태그안에 선언되면 해당되는  form이 submit이 선언된다 -->
		
	</form>
	
</body>

</html>