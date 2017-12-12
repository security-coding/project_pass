<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href='<c:url value="/css/landing-page.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/font-awesome/css/font-awesome.min.css"/>'>
<style type="text/css">
/*    --------------------------------------------------
	:: Login Section
	-------------------------------------------------- */
#login .form-wrap {
    width: 40%;
}
#login h1 {
    color: #1fa67b;
    font-size: 18px;
    text-align: center;
    font-weight: bold;
    padding-bottom: 20px;
}
#login .form-group {
    margin-bottom: 25px;
}
#login .checkbox {
    margin-bottom: 20px;
    position: relative;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
}
#login .checkbox.show:before {
    content: '\e013';
    color: #1fa67b;
    font-size: 17px;
    margin: 1px 0 0 3px;
    position: absolute;
    pointer-events: none;
    font-family: 'Glyphicons Halflings';
}
#login .checkbox .character-checkbox {
    width: 25px;
    height: 25px;
    cursor: pointer;
    border-radius: 3px;
    border: 1px solid #ccc;
    vertical-align: middle;
    display: inline-block;
}
#login .checkbox .label {
    color: #6d6d6d;
    font-size: 13px;
    font-weight: normal;
}
#login .btn.btn-custom {
    font-size: 14px;
	margin-bottom: 20px;
}
#login .forget {
    font-size: 13px;
	text-align: center;
	display: block;
}
#logo .image {
	width: 130px;
	height: 25px;
	margin-top: 10px;
}

/*    --------------------------------------------------
	:: Inputs & Buttons
	-------------------------------------------------- */
#btn-login:hover{

}
.form-control {
    color: #212121;
}
.btn-custom {
    color: #fff;
    font-weight:bold;
 	background-color: rgba(133, 221, 119, 0.9);
}
.btn-custom:hover,
.btn-custom:focus {
    color: #fff;
}

/*    --------------------------------------------------
    :: Footer
	-------------------------------------------------- */
#footer {
    color: #6d6d6d;
    font-size: 12px;
		
}
#footer p {
    margin-bottom: 0;
}
#footer a {
    color: inherit;
}

.center {
	display: block;
	margin-left: 15px;
	margin-right: 15px;
}
</style>
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>

<script>

function blank(){
	if($('#keyword').val()==""){
		alert("검색어를 입력해주세요");
		return false;
	}else{
		return true;
	}
}

function showPassword() {
    
    var key_attr = $('#password').attr('type');
    
    if(key_attr != 'text') {
        
        $('.checkbox').addClass('show');
        $('#password').attr('type', 'text');
        
    } else {
        
        $('.checkbox').removeClass('show');
        $('#password').attr('type', 'password');
        
    }
    
}



</script>

<script>
$(function() {
		let Certify = ${dbCertify};
		if (Certify == 0) {
			alert("회원가입 이메일 인증을 안하셨습니다.");
		}
		document.location.href = "../";

	});
	

</script>

	<!-- Navigation -->
	<div>
		<nav class="navbar navbar-default navbar-fixed-top topnav"
			role="navigation">
		<div class="container topnav">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div id="logo">
				<a class="navbar-brand topnav" href="/"><img class="image" src="/resources/images/logo.png" /></a>
				</div>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-center" style="margin-left:150px;">
					<li><a href="/play/now" style="padding-top:15px;"><img src="/resources/images/m1.1.png" style="width: 140px; height: 40px;"
						onmouseover="this.src='/resources/images/m2.1.png'" onmouseout="this.src='/resources/images/m1.1.png'"></a></li>
					<li><a href="/play/come" style="padding-top:15px;"><img src="/resources/images/m1.2.png" style="width: 140px; height: 40px;"
					onmouseover="this.src='/resources/images/m2.2.png'" onmouseout="this.src='/resources/images/m1.2.png'"></a></li>
					<li><a href="/place" style="padding-top:15px;"><img src="/resources/images/m1.3.png" style="width: 140px; height: 40px;"
					onmouseover="this.src='/resources/images/m2.3.png'" onmouseout="this.src='/resources/images/m1.3.png'"></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right" style="padding-top:10px;">
					<li>
						<c:if test="${id==null}">
							<%@include file="./loginPage/login.jsp"%>
						</c:if> 
						<c:if test="${id!=null}">
							<%@include file="./loginPage/loginOk.jsp"%>
						</c:if>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container --> </nav>

	<div>
		<!-- Modal -->
		<form>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title text-center">로그인</h4>
						</div>
						<section id="login">
							<div class="row">
								<div class="col-md-12 col-xs-12">
									<div class="center">
										<h1>Log in with your email account</h1>
										<form role="form" action="javascript:;" method="post" id="login-form" autocomplete="off">
											<div class="form-group">
												<label for="id" class="sr-only">ID</label> <input
													type="text" name="id" id="id" class="form-control"
													placeholder="ID">
											</div>
											<div class="form-group">
												<label for="password" class="sr-only">Password</label> <input
													type="password" name="password" id="password" class="form-control"
													placeholder="Password">
											</div>
											<div class="checkbox">
												<span class="character-checkbox" onclick="showPassword()"></span>
												<span class="label" style="font-weight: bold;">Show password</span>
											</div>
											<input type="submit" id="btn-login"
												class="btn btn-custom btn-lg btn-block" value="Log in">
										</form>
										<p><a href="/member/userloss">아이디/비밀번호찾기</a></p>
										<hr>
									</div>
								</div>
								<!-- /.col-xs-12 -->
							</div>
							<!-- /.row -->
						<!-- /.container --> </section>

					</div>
					<!-- 				modal-content의 div끝 -->

				</div>
				<!-- modal-dialog의 div끝 -->

			</div>
		</form>
		<!--모달 내용 서브밋form -->
		</form>
		<!--모달 부르는 버튼 form -->
		<!--모달 끝 -->
	</div>
	</div>