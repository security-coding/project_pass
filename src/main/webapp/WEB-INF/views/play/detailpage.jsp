<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Concert Information</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href='<c:url value="/css/detailpage.css"/>'>

</head>

<body>



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

			<img src="${poster.imageUrl}" style="width: 200; height: 280;" alt="concert-image" />
		</div>
			<!-- Identity details -->
			<section class="profileHeader">

       		    <h1>${poster.prfnm}</h1>
				<h3>${poster.genrenm} , ${detailInf.prfpdfrom} ~ ${detailInf.prfpdto}</h3>
				
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
					<img src="/social.png" alt="sample">
				</div>
				<div class="socialNetworkNav">
					<!-- Add a Anchor tag with nested img tag here -->
					<img src="AboutPageAssets/images/social.png" alt="sample">
				</div>
				<div class="socialNetworkNav">
					<!-- Add a Anchor tag with nested img tag here -->
					<img src="AboutPageAssets/images/social.png" alt="sample">
				</div>
				<div class="socialNetworkNav">
					<!-- Add a Anchor tag with nested img tag here -->
					<img src="AboutPageAssets/images/social.png" alt="sample">
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
				<p>
					<span>공연 시작일 :</span> ${detailInf.prfpdfrom}</p>
				<p>
					<span>공연 종료일 :</span> ${detailInf.prfpdto}</p>
				<p>
					<span>Phone :</span> (123)456 - 789000
				</p>
				<p>
					<span>Address :</span> Anytown, Anycountry
				</p>
				
										<li>공연시작일 : ${detailInf.prfpdfrom} ~ 공연종료일 : ${detailInf.prfpdto}</li>
						<li>공연시설명(공연장명) : ${detailInf.fcltynm}</li>
						<li>공연출연진 : ${detailInf.prfcast}</li>
			<!-- 						prfcrew = 출연진, but 나타나지 않는 공연들도 있음. 어떻게 뿌릴건지 상의 -->						
						<li>공연제작진 : ${detailInf.prfcrew}</li>
			<!-- 						prfcrew = 제작진, but 나타나지 않는 공연들도 있음. 어떻게 뿌릴건지 상의 -->
						<li>공연 런타임 : ${detailInf.prfruntime}</li>
						<li>공연 관람 연령 : ${detailInf.prfage}</li>
						<li>제작사 : ${detailInf.entrpsnm}</li>
						<li>티켓 가격 : ${detailInf.pcseguidance}</li>
						<li>공연 시간 : ${detailInf.dtguidance}</li>
				
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
			</article>
			<!-- Replicate the above Div block to add more title and company details -->
		</section>
		<!-- Links to expore your past projects and download your CV -->
		<aside class="externalResourcesNav">
			<div class="externalResources">
				<a href="#" title="Download CV Link">DOWNLOAD CV</a>
			</div>
			<span class="stretch"></span>
			<div class="externalResources">
				<a href="#" title="Behance Link">BEHANCE</a>
			</div>
			<span class="stretch"></span>
			<div class="externalResources">
				<a href="#" title="Github Link">GITHUB</a>
			</div>
		</aside>
	</section>	
	<footer>
		<hr>
		<p class="footerDisclaimer">
			2014 Copyrights - <span>All Rights Reserved</span>
		</p>
		<p class="footerNote">
			John Doe - <span>Email me</span>
		</p>
	</footer>
		
	        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Search Widget -->
          <form action="/play/search">
          <div class="card my-4">
            <h5 class="card-header">Search</h5>
            <div class="card-body">
              <div class="input-group">
                <input id="keyword" name="keyword" type="text" class="form-control" placeholder="제목입력">
                <span class="input-group-btn">
                  <input class="btn btn-secondary" type="submit" value="검색"/>
                </span>
              </div>
            </div>
          </div>
		  </form>
		  
          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">Categories</h5>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Web Design</a>
                    </li>
                    <li>
                      <a href="#">HTML</a>
                    </li>
                    <li>
                      <a href="#">Freebies</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">JavaScript</a>
                    </li>
                    <li>
                      <a href="#">CSS</a>
                    </li>
                    <li>
                      <a href="#">Tutorials</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div>

        </div>
</body>
</html>
