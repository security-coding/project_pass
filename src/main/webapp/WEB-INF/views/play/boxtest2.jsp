<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Landing Page - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
	<!-- Custom CSS -->
	<link rel="stylesheet" href='<c:url value="/css/landing-page.css"/>'><!-- banner-bg,intro-bg의 경로는 여기서 변경 -->
	
    <!-- Custom Fonts -->
    <link rel="stylesheet" href='<c:url value="/css/font-awesome/css/font-awesome.min.css"/>'>
	<link rel="stylesheet" href='<c:url value="/css/boxoffice.css"/>'>
	
<script>
function blank(){
	if($('#keyword').val()==""){
		alert("검색어를 입력해주세요");
		return false;
	}else{
		return true;
	}
}
</script>

<script>
	function CertifyCheck(){
		let Certify = ${dbCertify};
		if (Certify == 0) {
			alert("회원가입 이메일 인증을 안하셨습니다.");
		}
		document.location.href = "./main";
	}
	
</script>

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
                <a class="navbar-brand topnav" href="/member/main">Project Pass</a>
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
									<a href="/member/userloss">아이디/비밀번호찾기
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
    


    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header" >
        <div class="container">

	<div class="row">
		<div class="col-lg-12">
			<div class="intro-message" >
				<h1>검색</h1>
				<h3>A Template by Start Bootstrap</h3>
				<!--                         <hr class="intro-divider"> -->
				<ul class="list-inline intro-social-buttons">
					<li>
						<div>
							<!-- Search Widget -->
							<form action="/play/search" onsubmit="return blank()">
								<div class="card my-4">
									<h5 class="card-header">Search</h5>
									<div class="card-body">
										<div class="input-group">
											<input id="keyword" name="keyword" type="text"
												class="form-control" placeholder="제목입력"> <span
												class="input-group-btn"> <input
												class="btn btn-secondary" type="submit" value="검색"/>
											</span>
										</div>
									</div>
								</div>
							</form><!--검색부분 -->
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

		</div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <!-- Page Content -->
    <div>
    	<div class="text-center" id="typeNav">
         	<h1>BOX OFFICE</h1>
		</div>
		
		
		        <ul class="typeNav" >
					<li><a class="butn" href = "#" onclick="change('YK');">연극</a></li>
					<li><a class="butn" href = "#" onclick="change('MU');">뮤지컬</a></li>
					<li><a class="butn" href = "#" onclick="change('CCO');">클래식/오페라</a></li>
	   				<li><a class="butn" href = "#" onclick="change('MMB');">무용/발래</a></li>
	    			<li><a class="butn" href = "#" onclick="change('KKB');">국악/복합</a></li>
				</ul>
	<div class="container">
	 <div class="row text-center">
		<div class="poster">
    
    	<div id="type" class="test row" data-index="전체"></div>
	   <c:forEach var="play" items="${boxList}">
		      <div class="col-lg-15 col-md-3 col-xs-3 boxContent" > 
		        <a href="/play/detail?mt20id=${play.mt20id}">
		           
		           <div class="imageUrl">
		             <img class="img-fluid img-thumbnail imageUrl" src="${play.imageurl}" alt="" />  
		              <div class="img-fluid img-thumbnail overlay">            
	                      <div class="text">
	                      <p>RANK ${play.rnum}</p><br>
	                      <p>${play.prfnm}</p><br>
	                      <p>${play.prfpd}</p><br>
	                      <p>${play.prfplcnm}</p><br>
	                      <p>${play.cate}</p>
	                      </div>
                    </div>
                 
		           </div>   
		         </a> 
			</div>
       </c:forEach>
       </div>
    </div>
    </div>
</div>
        </div>
        <!-- /.container -->

    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#about">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#services">Services</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#contact">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Your Company 2014. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <!-- Bootstrap Core JavaScript -->
    <script src='<c:url value="/js/bootstrap.min.js"/>'></script>
    <!-- 마우스 오버 요소 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/js/mdb.min.js"></script> -->
    
		
</body>


<script>
	$(document).ready(function() {
		var jbOffset = $( '.typeNav' ).offset();
		
		$(window).scroll(function() { 
			
			if ( $( document ).scrollTop() > jbOffset.top ) {
	            $( '.typeNav' ).addClass( 'jbFixed' );
	         }else {
	             $( '.typeNav' ).removeClass( 'jbFixed' );
	         }
		});
	});

	function change(value) {
		
		$.ajax({
			type:"POST",
			dataType:"JSON",
			url:"/play/listtest/change",
			data:({ "type" : value }),
			success: function(data) {
				let str ="";
				let typ ="";
				$(".poster").empty(); 
			    $.each(data,function(index, item){					  					 				 
			    	str ="<div class='col-lg-15 col-md-3 col-xs-3 boxContent' >"
							       +"<a href='/play/detail?mt20id="+ item.mt20id+"'>"
							         +"<div class='imageUrl'>"
							           +"<img class='img-fluid img-thumbnail imageUrl' src= '"+ item.imageurl+"' alt=''/>"
							              +"<div class='img-fluid img-thumbnail overlay'>"
							                 +"<div class='text'>"
							                    +"<p> RANK"+ item.rnum+"</p><br>"
							                    +"<p>"+item.prfnm+"</p><br>"
							                    +"<p>"+item.prfpd+"</p><br>"
							                    +"<p>"+item.prfplcnm+"</p><br>"
							                    +"<p>"+item.cate+"</p>"
							                    +"</div>"
							                +"</div>"
							                   +"</div>"
							                       +"</a></div>"      
							       
					  $(".poster").append(str);
// 					location.href="#typeNav";
			    	window.scroll(0, getOffsetTop(document.getElementById("typeNav")));
				  });
			          
			}					 						
		})	
	}
	
	
	function getOffsetTop(el) { 
		var top = 0; 
		if (el.offsetParent) { 
			do { top += el.offsetTop; } 
			while (el = el.offsetParent); return [top]; } 
		    } 
// 	window.scroll(0, getOffsetTop(document.getElementById("bookmark")));

	
	
	
</script>

</html>