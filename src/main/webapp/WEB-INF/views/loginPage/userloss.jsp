<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

		
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>

<script>

let idCheck=false;
let emailCheck = false;

$(function() {
	$("#email1").on("change blur", function() {
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
		$("#id").on("change",function(){
		$.ajax({
			type : "POST",
			async : true,
			dataType : 'json',
			url : "/member/reSetPassCheck",
			data : {
				email2 : $("#email2").val(),
				id:$("#id").val()
			},
			success : function(data) {
				let emailHtml;
				let idHtml;
				if ($("#email2").val() != "" && $("#id").val() !="") {
					if (data == 1) {
						 idCheck=true;
						 emailCheck=true;
						 
					} else{
						idCheck=false; 
						emailCheck=false;
						 
					}
				} else if($("#email2").val() == "" && $("#id").val() ==""){	
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
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<body>
	<div>
	<article class="container-fluid">
	<div class="page-header">
		<h1>아이디/비밀번호찾기</h1>
	</div>
	<h2>아이디찾기</h2>
	<div class="col-xs-8 col-sm-6">
		<form id="idForm" class="form-horizontal" role="form"
			action="/member/userlossid" method="post" onsubmit="return idSearchSubmit()">
			<!-- form -->
			<div class="form-group">
				<label for="email1">이메일</label> <input type="text"
					class="form-control" id="email1" name="email1"
					placeholder="회원가입할때 입력하신 이메일 입력">
				<div id="emailCheck"></div>
			</div>

			<div class="form-group text-center">
				<button id="signupbtn" type="submit" class="btn btn-info">
					아이디찾기<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>
	</article>
	</div>
	
	<div>
	<article class="container-fluid">
	<h2>비밀번호 찾기</h2>
	<div class="col-xs-8 col-sm-6">
		<form id="idForm" class="form-horizontal" role="form"
			action="/member/userlosspass" method="post" onsubmit="return passSearchSubmit()">
			<!-- form -->
			<div class="form-group">
				<label for="email2">이메일</label> <input type="text"
					class="form-control" id="email2" name="email2"
					placeholder="회원가입할때 입력하신 이메일 입력">
					<div id="emailCheck"></div>
			</div>

			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control"
					id="id" name="id" placeholder="회원가입할때 입력하신 아이디 입력">
					<div id="emailCheck"></div>
			</div>

			<div class="form-group text-center">
				<button id="signupbtn" type="submit" class="btn btn-info">
					비밀번호찾기<i class="fa fa-check spaceLeft"></i>
				</button>
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