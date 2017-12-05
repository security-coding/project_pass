<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>공연 예정작</title>
<meta charset="UTF-8">

<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>

<!-- 제이쿼리 -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script> -->

<link rel="stylesheet" href='<c:url value="/css/boxoffice.css"/>'>
   


  <!-- jQuery -->
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <!-- Bootstrap Core JavaScript -->
</head>
<header>


</header>
<body>
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


<br>
<br>
<br>



           <ul class="listNav" >
					<li><a class="butn" href = "/play/now" >현재공연작</a></li>
					<li><a class="butn" href = "/play/come" >공연예정작</a></li>
		    </ul>

<div class="text-center">
         	<h1>공연 예정작</h1>
	</div>

	<div class="typeNav" >
	<ul>
		<li><a class="butn" href = "#" onclick="change('전체');">전체</a></li>
		<li><a class="butn" href = "#" onclick="change('연극');">연극</a></li>
		<li><a class="butn" href = "#" onclick="change('뮤지컬');">뮤지컬</a></li>
		<li><a class="butn" href = "#" onclick="change('클래식');">클래식</a></li>
		<li><a class="butn" href = "#" onclick="change('오페라');">오페라</a></li>
	    <li><a class="butn" href = "#" onclick="change('무용');">무용</a></li>
	    <li><a class="butn" href = "#" onclick="change('발래');">발래</a></li>
	    <li><a class="butn" href = "#" onclick="change('국악');">국악</a></li>
        <li><a class="butn" href = "#" onclick="change('복합');">복합</a></li>
	</ul>
	</div>

<div class="container">
  <div class="row text-center">
     <div class="poster">  
        <div id="type" class="test row" data-index="전체"></div>
	       <c:forEach var="play" items="${playList}">	 
		      <div class="col-lg-15 col-md-3 col-xs-3 boxContent" > 
		        <a href="/play/detail?mt20id=${play.mt20id}">
		           <div class="imageUrl">
		        
		             <img class="img-fluid img-thumbnail imageUrl" src="${play.imageUrl}" alt="" />  
		           <div  class="img-fluid img-thumbnail overlay">
                      <div class="text">                      
                    <p>${play.genrenm}</p><br>
                    <p>${play.prfnm}</p><br>
                    <p>${play.prfpdfrom}~${play.prfpdto}</p><br>
                    <p>${play.fcltynm}</p>
                      </div>
                    </div>
		           </div>   
		         </a> 
		       </div>
            </c:forEach>
         </div>
      </div>
      <br>
<br>
<br>
<br>
<br>
<br>
           	
</div>
 <script src='<c:url value="/js/bootstrap.min.js"/>'></script>
<script>
	$(document).ready(function() {
		var jbOffset = $( '.typeNav' ).offset();
		
		$(window).scroll(function() { 
			
			if ( $( document ).scrollTop() > jbOffset.top ) {
	            $( '.typeNav' ).addClass( 'jbFixed' );
	         }else {
	             $( '.typeNav' ).removeClass( 'jbFixed' );
	         }
			
			if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
				let elem = document.getElementById("type");
				let index = elem.getAttribute("data-index");
				   
							$.ajax({
					type:"POST",
					dataType:"JSON",
					url:"/play/come/getNextPoster",
					data:({ "stNum" : stNum , "index" : index}),
					success: function(data) {
						let str =""; 
					    $.each(data,function(index, item){					  					 				 
					    	str ="<div class='col-lg-15 col-md-3 col-xs-3 boxContent' >"
							       +"<a href='/play/detail?mt20id="+ item.mt20id+"'>"
							         +"<div class='imageUrl'>"
							           +"<img class='img-fluid img-thumbnail imageUrl' src= '"+ item.imageUrl+"' alt=''/>"
							              +"<div class='img-fluid img-thumbnail overlay'>"
							                 +"<div class='text'>"
							                    +"<p>"+item.prfnm+"</p><br>"
							                    +"<p>"+item.prfpdfrom+"~"+item.prfpdto+"</p><br>"
							                    +"<p>"+item.fcltynm+"</p><br>"
							                    +"<p>"+item.genrenm+"</p>"
							                    +"</div>"
							                +"</div>"
							                   +"</div>"
							                       +"</a></div>" 
							  		       
							  $(".poster").append(str);
							  
						  });			
					}					 						
				})
				stNum++;	
		    }
		});
	});
			
	function change(value) {
		
		$.ajax({
			type:"POST",
			dataType:"JSON",
			url:"/play/come/change",
			data:({ "type" : value }),
			success: function(data) {
				let str ="";
				let typ ="";
				$(".poster").empty(); 
			    $.each(data,function(index, item){					  					 				 
			    	str ="<div class='col-lg-15 col-md-3 col-xs-3 boxContent' >"
					       +"<a href='/play/detail?mt20id="+ item.mt20id+"'>"
					         +"<div class='imageUrl'>"
					           +"<img class='img-fluid img-thumbnail imageUrl' src= '"+ item.imageUrl+"' alt=''/>"
					              +"<div class='img-fluid img-thumbnail overlay'>"
					                 +"<div class='text'>"
					                    +"<p>"+item.prfnm+"</p><br>"
					                    +"<p>"+item.prfpdfrom+"~"+item.prfpdto+"</p><br>"
					                    +"<p>"+item.fcltynm+"</p><br>"
					                    +"<p>"+item.genrenm+"</p>"
					                    +"</div>"
					                +"</div>"
					                   +"</div>"
					                       +"</a></div>" 
					 
							       
					  $(".poster").append(str);
				  });
			        
			    
			   typ="<div id='type' class='test row' data-index='"+data[0].pType+"'></div>"       
			    $(".poster").append(typ);
			   stNum = 1;
			   let elem = document.getElementById("type");
			   let index = elem.getAttribute("data-index");
			}					 						
		})	
	}
	
	
	let stNum = 1;
	
	

	
</script>
</body>
</html>
