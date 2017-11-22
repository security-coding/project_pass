﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		
<script>
	let idcheck = false;
	let emailcheck = false;
	function checkId() {
		$("#id").on("blur", function() {
			$.ajax({
				type : "POST",
				async : true,
				dataType : 'json',
				url : "/pass/member/joinIdCheck",
				data : {
					inputId : $("#id").val()
				},
				success : function(data) {
					let html;
					if ($("#id").val() != "") {
						if (data == "1") {
							html = "<b>사용 가능한 아이디입니다.</b>"
							$("#idcheck").html(html).css("color", "blue");
							idcheck=true;
							
						} else {
							html = "<b>중복된 아이디입니다.<b>";
							$("#idcheck").html(html).css("color", "red");
							idcheck=false;
							
						}
					} else {
						html = "<b>아이디를 입력해 주세요</b>"
						$("#idcheck").html(html).css("color", "red");
						idcheck=false;
						
					}
				},
				error : function(xhr) {
					alert("error html=" + xhr.statusText);
				}
			});
		});
	}
	
	$(function() {
		$("#email").on("blur", function() {
			$.ajax({
				type : "POST",
				async : true,
				dataType : 'json',
				url : "/pass/member/joinemailCheck",
				data : {
					inputemail : $("#email").val(),
					str_email:$("#str_email").val()
				},
				success : function(data) {
					let html;
					if ($("#email").val() != ""&&$("#str_email").val()!="") {
						if (data == "1") {
							html = "<b>사용 가능한 이메일입니다.</b>"
							$("#emailcheck").html(html).css("color", "blue");
							 emailcheck=true;
							 
						} else {
							html = "<b>중복된 이메일입니다.<b>";
							$("#emailcheck").html(html).css("color", "red");
							 emailcheck=false;
							 
						}
					} else if($("#email").val() != ""||$("#str_email").val()!=""){	
						html = "<b>이메일을입력해주세요</b>"
						$("#emailcheck").html(html).css("color", "red");
						 emailcheck=false;
						 
					}
				}
			});
		});
	});
	
	
	function availability(){
		if(idcheck==true&&emailcheck==true){
			alert("메일인증을 보냈습니다\n잠시만기다려주세요");
			return true;
		}else if(!idcheck || !emailcheck){
			alert("확인해주세요");
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
	
	<article class="container-fluid">
	<div class="page-header">
		<h1>
			회원가입 
		</h1>
	</div>
	
	<div class="col-xs-8 col-sm-6">
		<form id="joinForm" name="" class="form-horizontal" role="form" action="/pass/member/insertuser" method="post" onsubmit="return availability()"><!-- form -->
			
			<div class="form-group">
				<label for="id">ID:</label> <input type="text"
					class="form-control" id="id" name="id" placeholder="ID" oninput="checkId()">
				<div id="idcheck"></div>
			</div>
			
			<div class="form-group">
				<label for="pass">비밀번호</label> <input type="password"
					class="form-control" id="pass" name="pass" placeholder="비밀번호">
					<div id="passcheck"></div>
			</div>
			
			<div class="form-group">
				<label>비밀번호 확인</label> <input type="password"
					class="form-control" id="pass2" placeholder="비밀번호 확인" >
<!-- 				<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p> -->
					<div id="passcheck2"></div>
			</div>
			
			<div class="form-group">

				<table>
					<tr>
						<label for="email">Email:
							<td><div>
									<input id="email" name="email" type="text" class="form-control"
										placeholder="Email" style="width: 200px"></td>
							<td>@</td>
							<td><input type="text" name="str_email" id="str_email" class="form-control"
								style="width: 100px" disabled value="naver.com">
								</div></td>
						<td><select style="width: 120px" name="str_email"
								id="selectEmail" class="form-control">
									<option value="1">직접입력</option>
									<option value="naver.com" selected>naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
							</select><td><div id="emailcheck"></div></td>
						</label>
						</td>
					</tr>
				</table>

			</div>			
	
			<div class="form-group text-center">
				<button id="signupbtn" type="submit" class="btn btn-info">
					회원가입<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="reset" class="btn btn-warning" onclick="javascript:history.back(-1)">
					가입취소<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>

	
	</article>
</body>
	
<!-- /container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!--부트스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> -->

<script type="text/javascript">
	//이메일 입력방식 선택
	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {

			if ($(this).val() == '1') { //직접입력일 경우
				$("#str_email").val(''); //값 초기화
				$("#str_email").attr("disabled", false); //활성화
			} else { //직접입력이 아닐경우
				$("#str_email").val($(this).text()); //선택값 입력
				$("#str_email").attr("disabled", true); //비활성화
			}
		});
	});
	
	 $(function(){
//	 	 폼이벤트 처리할때는 event.preventDefault();가 안먹는 이유...알아내기
		 $("#joinForm").on("submit", function(){
//	 		 event.preventDefault();
			 var id=$("#id").val();
			 var pass=$("#pass").val(); 
			 var passcheck=$("#pass2").val();
			 var email=$("#email").val();
			 var str_email=$("#str_email").val();
			 
			 if(id==""){
			 	alert("아이디를 입력하세요");
			 	$("#id").focus();
			 	return false;
			 }
			 if(pass==""){
			 	alert("패스워드를 입력하세요");
			 	$("#pass").focus();
			 	return false;
			 }
			 if(email==""){
				 alert("이메일을 입력하세요");
				 $("#email").focus();
				 return false;
			 }
			 if(str_email==""){
				 alert("주소를 입력해주세요");
				 $("#str_email").focus();
				 return false;
			 }
			 if(pass!=passcheck){
				 alert("패스워드가 일치하지 않습니다")
			 	$("#pass2").focus();
				 return false;
			 }
			 $("#joinForm").submit();
		 })
	 });
 	
	 
		$("#pass").blur(function(){
			let html;
			if($("#pass").val()==""){
				html="<b>암호를 입력해주세요</b>"
				$("#passcheck").html(html).css("color","red");
			}else{
				html=""
				$("#passcheck").html(html).css("color","white");
			}
		});
		 
	 	$("#pass2").blur(function(){
	 		let html;
	 		if($("#pass").val()!=$("#pass2").val()){
				html="<b>암호가 일치하지 않습니다.</b>"
				$("#passcheck2").html(html).css("color","red");
	 		}else if($("#pass").val()==$("#pass2").val()&&$("#pass").val()!=""&&$("#pass2").val()!=""){
				html="<b>암호가 일치합니다.</b>"
				$("#passcheck2").html(html).css("color","blue");
	 		}
	 	});

		
	</script>
</html>