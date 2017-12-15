<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>userloss.jsp * 아이디/비밀번호 찾기</title>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
		
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
<script>

let idCheck=false;
let emailCheck = false;

$(function() {
	$("#email1").on("change", function() {
		$.ajax({
			type : "POST",
			async : true,
			dataType : 'json',
			url : "/member/standlossid",
			data : {
				email1 : $("#email1").val()
			},
			success : function(data) {
				let html;
				if ($("#email1").val() != "") {
					if (data == 1) {
 						$("#emailCheck").css("display","none");
						 emailCheck=true;
						 
					} else{
 						$("#emailCheck").css("display","none");
						 emailCheck=false;
						 
					}
				} else if($("#email1").val() == ""){	
					html = "<b>이메일을입력해주세요</b>"
					$("#emailCheck").html(html).css("color", "red");
					 emailCheck=false; 
				}
			}
		});
	});
});

$(function() {
	$("#email2").on("blur", function() {
		$("#lookUpId").on("change",function(){
		$.ajax({
			type : "POST",
			async : true,
			dataType : 'json',
			url : "/member/reSetPassCheck",
			data : {
				email2 : $("#email2").val(),
				id:$("#lookUpId").val()
			},
			success : function(data) {
				let emailHtml;
				let idHtml;
				if ($("#email2").val() != "" && $("#lookUpId").val() !="") {
					if (data == 1) {
						 idCheck=true;
						 emailCheck=true;
						 
					} else{
						idCheck=false; 
						emailCheck=false;
						 
					}
				} else if($("#email2").val() == "" && $("#lookUpId").val() ==""){	
					idCheck=false; 
					emailCheck=false; 
				}
			}
			});//ajax
		});
	});
});



function idSearchSubmit(){
	if(emailCheck==true){
		return true;
	}else if(!emailCheck){
		alert("존재하지 않는 이메일입니다.\n다시 확인해주세요.");
		return false;
	}
}

function passSearchSubmit(){
	if(emailCheck==true && idCheck==true){
		return true;
	}else if(emailCheck==false||idCheck==false){
		alert("아이디 혹은 이메일이 일치하지 않습니다.");
		return false;
	}
}

</script>

</head>	

<body>
	<%@include file="../header.jsp"%>
	
	<div class="container">
	<h2 style="margin-top:90px;" class="text-center">아이디찾기</h2>
	<div class="col-md-6 col-md-offset-3">
		<form class="form-horizontal" role="form"
			action="/member/userlossid" method="post" onsubmit="return idSearchSubmit()">
			<!-- form -->
			<div class="form-group">
				<label for="email1">이메일</label> <input type="text"
					class="form-control" id="email1" name="email1"
					placeholder="회원가입할때 입력하신 이메일 입력">
				<div id="emailCheck"></div>
			</div>

			<div class="form-group text-center">
				<button type="submit" class="btn btn-info">
					아이디찾기<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>
	<div class="clearfix"></div>
	<h2 style="margin-top: 6%;" class="text-center">비밀번호 찾기</h2>
	<div class="col-md-6 col-md-offset-3">
		<form class="form-horizontal" role="form"
			action="/member/userlosspass" method="post" onsubmit="return passSearchSubmit()">
			<!-- form -->
			<div class="form-group">
				<label for="email2">이메일</label> <input type="text"
					class="form-control" id="email2" name="email2"
					placeholder="회원가입할때 입력하신 이메일 입력">
					<div id="emailCheck"></div>
			</div>

			<div class="form-group">
				<label for="lookUpId">아이디</label> <input type="text" class="form-control"
					id="lookUpId" name="lookUpId" placeholder="회원가입할때 입력하신 아이디 입력">
					<div id="emailCheck"></div>
			</div>

			<div class="form-group text-center">
				<button type="submit" class="btn btn-info">
					비밀번호찾기<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../footer.jsp"%>
</body>

</html>