<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>dropOutMember.jsp * 회원 탈퇴</title>
		
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>		
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>

<style>
ul{
   list-style:none;
   
   }



#profileLine{
	margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}
@media all and (min-width:228px) and (max-width:414px) {
	#menu {
		border-style: solid;
		border-color: rgba(0, 0, 0, 0.5);
		position: fixed;
		border-radius: 10px;
		width: 150px;
		height: 165px;
		display: none;
	}
	#headerMenu {
		font-size: 16px;
		margin-left: 15px;
		color: rgba(122, 157, 255, 1);
	}
	#map{
		width: 100%;
		height: 450px;
	}
	
	#mobileBar{
	margin-top:0px;
	margin-left:-33px;

	}
	#mobileImg{
	margin-top: 114%; 
	margin-left: -30px; 
	position: fixed ; 
	z-index:1 ;
	}
	
	#mainForm{
		margin-left: 33px;
	}
	
}

/*패드는 기존 메뉴를 살린다*/
@media all and (min-width:768px) {
#mobileBar{
	display: none;
	}
}

#map{
	width: 100%;
	height: 400px;
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


/* 모바일 사이드 바 */
		#drawer {
			width: 280px;
			height: 100%;
			position: fixed;
			top: 0;
			left: -280px;
			background: #EEEEEE;
			z-index: 1050;
			-webkit-transition: .3s;
			      transition: .3s;
			overflow: hidden;
			margin-top:51px; 
			width:246px; 
			border-radius:10px;
		}
		/* left속성이 -(width)px 라서 화면 밖에 있고 left를 0으로 바꿔서 화면에 나타난다.  */
		#drawer.opened {
			left: 0;
			box-shadow: 5px 5px 15px 1.5px rgba(0, 0, 0, 0.2);
			display: block;
		}
		/* drawer open 시 배경 어둡게 하기 */
		#blocker {
			display: none;
			background: rgba(0, 0, 0, 0.2);
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			z-index: 999;
		}
		#blocker.opened {
			display: block;
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
				<button type="reset" class="btn btn-warning" onclick="document.location.href = '../'"/>
					되돌아기<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
			</div>
		</form>
		
			<!--모바일 메뉴바-->
		<div id="mobileBar" class="drawer-toggle pull-right" onclick="setOpened()">
		<i class="ic-menu"><img id="mobileImg" src="/images/mobileBar.png" alt="" style="" ></i>
		</div>
		<nav id="drawer">
		 <ul>
			<li><p>메뉴</p></li>
			<li><a href="/member/mypage">내정보</a></li>
			<hr>
			<li><a href="/member/myPassChange">회원정보 변경</a></li>
			<hr>
			<li><a href="/member/memberClearForm">회원탈퇴</a></li>
		</ul>
		   </nav>
		   <div id="blocker" onclick="removeOpened()"></div>
	<!--모바일 메뉴바-->	
	
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


	function memberClear() {
		if (confirm("회원 탈퇴하시겠습니까?") == true && passCheck == true) {

		} else {
			return false;
		}
	}
	
	 // 모바일 메뉴바 열고 닫기 스크립트
	 // open/close 상태로 변경하는 메서드
	function setOpened() {
		var html = document.getElementById("html");
		var drawer = document.getElementById("drawer");
		var blocker = document.getElementById("blocker");
		html.classList.add("opened");
		drawer.classList.add("opened");
		blocker.classList.add("opened");
		
	}
	function removeOpened() {
		if(location.hash != "#drawer"){
			var html = document.getElementById("html");
			var drawer = document.getElementById("drawer");
			var blocker = document.getElementById("blocker");
			html.classList.remove("opened");
			drawer.classList.remove("opened");
			blocker.classList.remove("opened");
		}
	}
	
</script>

<!-- /container -->

<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</html>