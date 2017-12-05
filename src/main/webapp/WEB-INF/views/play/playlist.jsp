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

<ul class="typeNav" >
					<li><a class="butn" href = "/play/now" >현재상영작</a></li>
					<li><a class="butn" href = "/play/come" >상영예정작</a></li>
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
      
           	
</div>

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
