<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
@media all and (min-width:768px) and (max-width:1300px){	
	.user{
	float:left;
	padding-top:1px; 
	width: 120px;
	}
}
	.user_a{
		text-decoration: none;
		color: black;
	}
	.user_a:hover{
		color:gray;
		text-decoration: none;
	}
</style>

	
	<form class="navbar-form navbar-right" action="/member/logout" method="post">
		<a href="/member/mypage" class="user_a"><p class="user"><img alt="" style="width:30px; height:30px;" src="${imageUrl}">&nbsp&nbsp${id}</p></a>
		&nbsp&nbsp&nbsp&nbsp<button class="btn btn-primary" id="logout">로그아웃</button> 
		<!-- 버튼태그가 form태그안에 선언되면 해당되는  form이 submit이 선언된다 -->
		
	</form>
