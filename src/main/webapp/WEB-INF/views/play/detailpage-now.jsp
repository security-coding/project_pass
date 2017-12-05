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
<div class="-" style="height: 100px;"></div>


	<!-- Header content -->
	<header>
		<div class="profileLogo">
			<!-- Profile logo. Add a img tag in place of <span>. -->
			<p class="logoPlaceholder">
				<!-- <img src="logoImage.png" alt="sample logo"> -->
				<span>처음 페이지</span>
			</p>
		</div>
		<div class="profilePhoto">
			<!-- Profile photo -->
			<img src="${detailImages[0]}" style="width: 200; height: 259;" alt="concert-image" />
		</div>
			<!-- Identity details -->
			<section class="profileHeader">

       		    <h1>${detailInf.prfnm}</h1>
				<h3>${detailInf.genrenm} . ${detailInf.prfpdfrom} ~ ${detailInf.prfpdto}</h3>
				<hr>

				<p>
					<li><span>공연 시작일 :</span> ${detailInf.prfpdfrom}</li><p></p>
					<li><span>공연 종료일 :</span> ${detailInf.prfpdto}</li><p></p>
					<li><span>공연 시　간 :</span> ${detailInf.dtguidance}</li><p></p>
					<li><span>공연 시설명 :</span> ${detailInf.fcltynm}</li><p></p>
				</p>

			</section>
			<!-- Links to Social network accounts -->
			<aside class="socialNetworkNavBar">
				<div class="socialNetworkNav">
					<!-- Add a Anchor tag with nested img tag here -->
					<img src="webapp/resources/images/social.png" alt="">
				</div>
				<div class="socialNetworkNav">
					<!-- Add a Anchor tag with nested img tag here -->
					<img src="AboutPageAssets/images/social.png" alt="">
				</div>
				<div class="socialNetworkNav">
					<!-- Add a Anchor tag with nested img tag here -->
					<img src="AboutPageAssets/images/social.png" alt="">
				</div>
				<div class="socialNetworkNav">
					<!-- Add a Anchor tag with nested img tag here -->
					<img src="AboutPageAssets/images/social.png" alt="">
				</div>
			</aside>
	</header>
	<!-- content -->
	<section class="mainContent">
		<!-- Contact details -->
		<section class="section1">
			<h2 class="sectionTitle">해당 공연의 기본 정보</h2>
			<hr class="sectionTitleRule">
			<hr class="sectionTitleRule2">
			<div class="section1Content">
				<p><span>공연 시작일 :</span> ${detailInf.prfpdfrom}</p>
				<p><span>공연 종료일 :</span> ${detailInf.prfpdto}</p>
				<p><span>공연시설명(공연장명) :</span> ${detailInf.fcltynm}</p>
				<p><span>공연출연진 :</span> ${detailInf.prfcast}</p>
				<p><span>공연제작진 :</span> ${detailInf.prfcrew}</p>			
				<p><span>공연 런타임 :</span> ${detailInf.prfruntime}</p>
				<p><span>공연 관람 연령 :</span> ${detailInf.prfage}</p>
				<p><span>제작사 :</span> ${detailInf.entrpsnm}</p>
				<p><span>티켓 가격 :</span> ${detailInf.pcseguidance}</p>
				<p><span>공연 시간 :</span> ${detailInf.dtguidance}</p>				
			</div>
		</section>
		<!-- Previous experience details -->
		<section class="section2">
			<h2 class="sectionTitle">해당 공연의 소개</h2>
			<hr class="sectionTitleRule">
			<hr class="sectionTitleRule2">
			<!-- First Title & company details  -->
			      <div>
		<c:forEach var="detailImage" items="${detailImages}" begin="1">
			<img class="img-fluid img-thumbnail" src="${detailImage}" />
		</c:forEach>
	</div>
			<!-- Replicate the above Div block to add more title and company details -->
			
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