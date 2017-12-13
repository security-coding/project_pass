<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

		
<!-- <script src="//code.jquery.com/jquery-3.1.0.min.js"></script> -->
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>		
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>

<style>
ul{
   list-style:none;
   }
@media all and (min-width:768px) and (max-width:1300px) {
	#menu {
		border-style: solid;
		border-color: rgba(0, 0, 0, 0.5);
		position: fixed;
		border-radius: 10px;
		width: 150px;
		height: 165px;
	}
	#headerMenu {
		font-size: 16px;
		margin-left: 15px;
		color: rgba(122, 157, 255, 1);
		
	}
}

#menu {
	border-style: solid;
	border-color: rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	width: 150px;
	height: 165px;
}

#headerMenu {
	font-size: 16px;
	margin-left: 15px;
	color: rgba(122, 157, 255, 1);
	
}
</style>

</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
 <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
 <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<body>
	
	<article class="container-fluid" style="height:640px;">

	
	<div class="page-header">
	<div>
	<%@include file="../header.jsp"%>
	</div>
	</div>
	
	<div  class="col-sm-3 col-md-2 sidebar" style="margin-top: 1%;" >
		<ul id="menu" class="nav nav-sidebar">
			<li><p id="headerMenu">메뉴</p></li>
			<li class="active"><a href="/member/mypage">내정보<span class="sr-only">(current)</span></a></li>
			<li><a href="/member/myPassChange">회원정보 변경</a></li>
			<li><a href="/member/memberClearForm">회원탈퇴</a></li>
		</ul>
	</div>

	<div class="col-xs-8 col-sm-6">		
		<form id="loginForm" class="form-horizontal" role="form" action="/member/memberClear" onsubmit="return memberClear()" method="post"><!-- form -->
			
			<div class="form-group" style="margin-top: 2%">
				<label for="id" id="id" name="id">ID:${id}
				<div id="idcheck"></div>
			</div>
			
			<div class="form-group">
				<label for="currentPw">비밀번호</label> <input type="password"
					class="form-control" id="currentPw" name="currentPw" placeholder="현재비밀번호">
			</div>
			
			<div class="form-group text-center">
				<button id="passUpbtn" type="submit" class="btn btn-info">
					회원탈퇴<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="reset" class="btn btn-warning" onclick="javascript:history.back(-1)">
					되돌아기<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
			</div>
		</form>	
	</article>
</body>
	<%@include file="../footer.jsp" %>
<script>

let passCheck=false;


$(function() {
	$("#currentPw").on("change", function() {
		$.ajax({
			type : "POST",
			async : true,
			dataType : 'json',
			url : "/member/currentPwCheck",
			data : {
				currentPw : $("#currentPw").val()
			},
			success : function(data) {
				let html;
				console.log(data);
				if ($("#currentPw").val() != "") {
					if (data === 1) {
						passCheck = true;
						
					} else if(data==0) {
						html = "<b>현재 비밀번호 틀림<b>";
						console.log('현재 비밀번호 틀림');
						alert("현재 비밀번호가 틀렸습니다");
						passCheck = false;
						
					}
				} else if($("#currentPw").val() == "") {
					html = "<b>현재비밀번호를 입력해 주세요</b>"
				    alert("현재 비밀번호를 입력해주세요.");
					passCheck = false;
					console.log("비밀번호 입력");
				}
			},
			error : function(xhr) {
				// 				alert("error html=" + xhr.statusText);
			}
		});
	});
});

function memberClear(){	
		if(confirm("회원 탈퇴하시겠습니까?")==true && passCheck ==true){
			
		}else{
			return false;
		}
}
</script>

<!-- /container -->

<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</html>