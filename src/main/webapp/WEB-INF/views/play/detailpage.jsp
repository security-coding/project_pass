<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
=======
   pageEncoding="UTF-8"%>
>>>>>>> 9f188dada92f082683093830b08a07836a675393
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<<<<<<< HEAD
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
=======
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

<<<<<<< HEAD
<script>
<<<<<<< HEAD
let id='${id}';
let mt20id='${detailInf.mt20id}';
let heart='${fullHeart}';

$(document).ready(function(){
	if(heart==1){
		$("#empty-heart").attr("src" , "/images/likes/full-heart.png");		
	}else{
		$("#empty-heart").attr("src" , "/images/likes/empty-heart.png");
	}
});


// $(function (){
// 	let cnt=1;
// 	$("#empty-heart").on("click", function() {	
// 	if(heart==0){
// 		$.ajax({

// 			type: "POST",
// 			async : true,
// 			dataType : 'json',
// 			url : "/play/InsertLikes",
// 			data : {
// 			id : id,
// 			mt20id : mt20id
// 			},
// 			success : function(data){
				
// 			}
// 		});
// 		if(heart==0){
// 			$(".empty-heart").attr("src" , "/images/likes/full-heart.png");
// 		}
// 		cnt++;
// 	}else if(heart==1){
// 		$.ajax({

// 			type: "POST",
// 			async : true,
// 			dataType : 'json',
// 			url : "/play/DeleteLikes",
// 			data : {
// 			id : id,
// 			mt20id : mt20id
// 			},
// 			success : function(data){
				
// 			}
// 		});		
// 		if(heart==1){
// 			$(".empty-heart").attr("src" , "/images/likes/empty-heart.png");
// 		}
// 	}			
// 	});
// });

function changeImg(changeStat){
	let changeVal=$(changeStat).attr("value");
	console.log(changeVal);
		$.ajax({
			type: "POST",
			async : true,
			dataType : 'json',
			url : "/play/UpdateLikes",
			data : {
			id : id,
			mt20id : mt20id,
			changeVal : changeVal		
			},
			success : function(data){
				if(data==0){
					$(changeStat).attr("src","/images/likes/full-heart.png");
					$(changeStat).attr("value",1);
				}else{
					$(changeStat).attr("src","/images/likes/empty-heart.png");
					$(changeStat).attr("value",0);
				}
			},
			error: function(e) {
				alert(e.responseText);
			}
		});	
}
=======
	$.ajaxSetup({
		type : "POST",
		async : true,
		dataType : "json",
		error : function(xhr) {
			alert("error html = " + xhr.statusText);
			console.log($("#commentContent").val());
		}
	});
	
	$(document).ready(function() {
		$("#commentWrite").on("click", function() {
			$.ajax({
				url : "/comment/write",
				data : {
					commentContent : $("#commentContent").val(),
					//mt20id:"${play.mt20id}"    
					mt20id : "PF140536"
				},
				success : function(data) {
					if (data.result == 1) {
						alert("comment가 정성적으로 입력되었습니다");
						$("#commentContent").val("");
						showHtml(data.commentList, 1);
					}
				}
			});
		});
	});
	
	//	function getComment(commPageNum, event){
	////	 	event.preventDefault();
	//		$.ajax({			
	//			url:"/comment/read",	
	//			data:{
	//				mt20id:"${comment.mt20id}",     
	////	 			숫자와 문자연산에서 +를 제외하고는 숫자 우선
	//				commentRow:commPageNum * 10
	//			},
	//			success:function(data){
	//				showHtml(data,commPageNum,event);
	//			}				
	//		}); 	
	//	}
	
	function getComment(){
	// 	event.preventDefault();
		$.ajax({			
			url:"/comment/read",	
			data:{
				mt20id:"PF140536",     
	// 			숫자와 문자연산에서 +를 제외하고는 숫자 우선
			},
			success:function(data){
				console.log(data);
				console.log(data.commentContent);
				showHtml(data,commPageNum,event);
			}				
		}); 	
	}
	
	function showHtml(data,commPageNum){	
		var html="<table border='1' width='500' align='center'>";
		$.each(data, function(index,item){
			html +="<tr>";	
			html +="<td>"+item.id+"</td>";
			html +="<td>"+item.commentNum+"</td>";
			html +="<td>"+item.mt20id+"</td>";
			html +="<td>"+item.commentContent+"</td>";
			html +="<td>"+item.commentDate+"</td>";		
			html +="</tr>";					
		});		
		html +="</table>";
		commPageNum=parseInt(commPageNum);
		if("${play.commentCount}">commPageNum*10){			
			nextPageNum=commPageNum+1;				
			html +="<br /><input type='button' onclick='getComment(nextPageNum,event)' value='다음comment보기'><br>";
		}
		$("#showComment").html(html);	
		$("#commentContent").val("");
		$("#commentContent").focus();
	}

>>>>>>> 76d036a2923ff083f1e0d3720efbb468bd21bb3b
</script>

=======
>>>>>>> parent of 6f03a53... 123
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
    
<<<<<<< HEAD
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
>>>>>>> 9f188dada92f082683093830b08a07836a675393
		</div>
			<!-- Identity details -->
			<section class="profileHeader">

<<<<<<< HEAD
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
=======
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
>>>>>>> 9f188dada92f082683093830b08a07836a675393
	<section class="mainContent">
		<!-- Contact details -->
		<section class="section1">
			<h2 class="sectionTitle">해당 공연의 기본 정보</h2>
<<<<<<< HEAD
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
=======

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
<<<<<<< HEAD
	<h3>본 공연의 지도 위치는 다음과 같습니다.</h3><p />
		<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>
=======
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
         <img src="${detailImages[0]}" style="width: 500; height: 100%; "alt="concert-image" />
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

   <h3>본 공연의 지도 위치는 다음과 같습니다.</h3><p />
      <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>
>>>>>>> 76d036a2923ff083f1e0d3720efbb468bd21bb3b

   <script type="text/javascript" 
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

<<<<<<< HEAD
	<div id="map" style="width: 100%; height: 350px;">
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo}), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
        var markerPosition = new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo});


		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});


		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
		
		
	    
		let geocoder = new daum.maps.services.Geocoder();
=======
   <div id="map" style="width: 100%; height: 350px;"></div>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo}), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

      // 마커가 표시될 위치입니다 
        var markerPosition = new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo});


      // 마커를 생성합니다
      var marker = new daum.maps.Marker({
         position : markerPosition
      });


      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
      // marker.setMap(null);
      
      
       
      let geocoder = new daum.maps.services.Geocoder();
>>>>>>> 76d036a2923ff083f1e0d3720efbb468bd21bb3b

        let callback = function(result, status) {
      if (status === daum.maps.services.Status.OK) {
       console.log(result);
       console.log(status);
       console.log(result.x);
          }
      };

       geocoder.addressSearch('부산광역시 남구 용당동 331', callback);
<<<<<<< HEAD
		
		
	</script>
	</div>
	
	          <!-- Comments Form -->
          <div class="card my-4">
          <p /><h3 class="card-header">본 공연에 대한 댓글 남기기 :</h3>
=======
      
       
       
      
   </script>
   
             <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">본 공연에 대한 댓글 남기기 :</h5>
>>>>>>> 76d036a2923ff083f1e0d3720efbb468bd21bb3b
            <div class="card-body">
              <form>
                <div class="form-group">
                  <textarea class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">작성</button>
              </form>
            </div>
          </div>
<<<<<<< HEAD
	
	          <!-- Single Comment -->
=======
   
             <!-- Single Comment -->
>>>>>>> 76d036a2923ff083f1e0d3720efbb468bd21bb3b
          <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
              <h5 class="mt-0">Commenter Name</h5>
              Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
            </div>
          </div>

          <!-- Comment with nested comments -->
          <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
              <h5 class="mt-0">Commenter Name</h5>
              Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

              <div class="media mt-4">
                <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                <div class="media-body">
                  <h5 class="mt-0">Commenter Name</h5>
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                </div>
              </div>

              <div class="media mt-4">
                <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                <div class="media-body">
                  <h5 class="mt-0">Commenter Name</h5>
                  Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                </div>
              </div>

>>>>>>> 9f188dada92f082683093830b08a07836a675393
            </div>
          </div>

        </div>
<<<<<<< HEAD
</body>
</html>
=======
<<<<<<< HEAD
	
=======
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
>>>>>>> parent of 6f03a53... 123
</div>
			<!-- Replicate the above Div block to add more title and company details -->
=======
   
</div>


         <!-- Replicate the above Div block to add more title and company details -->
>>>>>>> 76d036a2923ff083f1e0d3720efbb468bd21bb3b

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
<<<<<<< HEAD

<<<<<<< HEAD
=======
    <!-- Bootstrap core JavaScript -->
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <script src='<c:url value="/js/bootstrap.min.js"/>'></script>
>>>>>>> 76d036a2923ff083f1e0d3720efbb468bd21bb3b


=======
>>>>>>> parent of 6f03a53... 123
</body>
</html>
>>>>>>> 9f188dada92f082683093830b08a07836a675393
