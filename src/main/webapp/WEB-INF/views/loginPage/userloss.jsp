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
			action="/pass/member/userlossid" method="post" onsubmit="availabilityEmail()">
			<!-- form -->
			<div class="form-group">
				<label for="email1">이메일</label> <input type="text"
					class="form-control" id="email1" name="email1"
					placeholder="회원가입할때 입력하신 이메일 입력" oninput="checkemail()">
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
			action="/pass/member/userlosspass" method="post">
			<!-- form -->
			<div class="form-group">
				<label for="email2">이메일</label> <input type="text"
					class="form-control" id="email2" name="email2"
					placeholder="회원가입할때 입력하신 이메일 입력">
			</div>

			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control"
					id="id" name="id" placeholder="회원가입할때 입력하신 아이디 입력">
			</div>

			<div class="form-group text-center">
				<button id="signupbtn" type="submit" class="btn btn-info">
					비밀번호찾기<i class="fa fa-check spaceLeft"></i>
				</button>
				<!-- 				<button type="reset" class="btn btn-warning" onclick="javascript:history.back(-1)"> -->
				<!-- 					수정취소<i class="fa fa-times spaceLeft"></i> -->
				<!-- 				</button> -->
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
		 $("#loginForm").on("submit", function(){
//	 		 event.preventDefault();

			 var pass=$("#pass").val(); 
			 var passcheck=$("#pass2").val();
			 

			 if(pass==""){
			 	alert("패스워스를 입력하세요");
			 	$("#pass").focus();
			 	return false;
			 }
			 if(pass!=passcheck){
				 alert("패스워드가 일치하지 않습니다")
			 	$("#pass2").focus();
				 return false;
			 }
			 
			 $("#loginForm").submit();
		 })
		 
//	 	 $("input[type=button]").on("click",function(){
//	 		 document.location.href='';
//	 	 })
	 });
 	
	 
		
	</script>
</html>