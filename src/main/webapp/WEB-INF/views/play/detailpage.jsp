<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detailpage.jsp*Concert Information</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/detailpage.css"/>'>


<style>
@import url('http://fonts.googleapis.com/earlyaccess/jejugothic.css');

body, table, div, p, header, hr, footer {
	font-family: 'Jeju Gothic'
}
</style>

</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="#">Project Pass</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#about">About</a>
                    </li>
                    <li>
                        <a href="#services">Services</a>
                    </li>
                    <li>
                        <a href="#contact">Contact</a>
                    </li>
                    <li>
                     <c:if test="${id==null}">
						<%@include file="../loginPage/login.jsp"%>
					</c:if> 
					<c:if test="${id!=null}">
						<%@include file="../loginPage/loginOk.jsp"%>
					</c:if>
					</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
   	<div>
	<!-- Modal -->
	<form>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">로그인</h4>
					</div>
					<form class="signform" name="signupform">
						<div name="inputform" class="modal-body container-fluid">
							<label for="id">ID:<input type="text" id="id" name="id"
								class="form-control" placeholder="id"></label><br> <label
								for="pass">password:<input type="password"
								id="password" name="password" class="form-control"
								placeholder="password"></label><br>
						</div>

						<div class="modal-footer">
							<button id="reset" type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button id="login" type="submit" class="btn btn-primary">로그인</button>
							<td><p>
									<a href="/member/userloss">아이디/비밀번호찾기></a>
								</p>
							<td>
						</div>
					</form>

				</div>
				<!-- modal-content의 div끝 -->

			</div>
			<!-- modal-dialog의 div끝 -->

		</div>
	</form>
	<!--모달 내용 서브밋form-->
	</form>
	<!--모달 부르는 버튼 form-->
	<!--모달 끝-->
</div>
<div style="height: 100px;"></div>
	<div class="row">
	<div class="col-md-7 col-md-offset-1">
	<!-- Header content -->
	<header>
		<div class="profilePhoto">
			<!-- Profile photo -->
			<img src="${detailImages[0]}" style="width: 500; height: 580; "alt="concert-image" />
		</div>
			<!-- Identity details -->
			<section class="profileHeader">

       		    <h1>${detailInf.prfnm}</h1>
				<h3>${detailInf.genrenm} . ${detailInf.prfpdfrom} ~ ${detailInf.prfpdto}</h3>
				<hr>

				
				<p />
				공연 시작일 : ${detailInf.prfpdfrom}<p />
				공연 종료일 : ${detailInf.prfpdto}<p />	
				공연 시　간 : ${detailInf.dtguidance}<p />
				공연 시설명 : ${detailInf.fcltynm}<p />
				공연 출연진 : ${detailInf.prfcast}<p />
				공연 제작진 : ${detailInf.prfcrew}<p />			
				공연 런타임 : ${detailInf.prfruntime}<p />
				공연 관람 연령 : ${detailInf.prfage}<p />
				공연 제작사 : ${detailInf.entrpsnm}<p />
				티켓 가격 : ${detailInf.pcseguidance}<p />
				<p />
			</section>
	</header>
	<hr />
	<!-- content -->	
	<section class="mainContent">
		<!-- Contact details -->
		<section class="section1">
			<h2 class="sectionTitle">해당 공연의 기본 정보</h2>

			<hr class="sectionTitleRule2">
			<div class="section1Content">
						      <div>
					<c:forEach var="detailImage" items="${detailImages}" begin="1">
						<img class="img-fluid img-thumbnail" src="${detailImage}" />
					</c:forEach>
				</div>
			</div>
		</section>
	</section>
</div>
<div class="col-md-4">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Test</th>
				<th>Test</th>
				<th>Test</th>
				<th>Test</th>
			</tr>
		</thead>
	</table>
</div>
			<!-- Replicate the above Div block to add more title and company details -->

        </div>
        <div>
	<footer>
		<hr>
		<p class="footerDisclaimer">
			2014 Copyrights - <span>All Rights Reserved</span>
		</p>
		<p class="footerNote">
			John Doe - <span>Email me</span>
		</p>
	</footer>
</div>
</body>
</html>