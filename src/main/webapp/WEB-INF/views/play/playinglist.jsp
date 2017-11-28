<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>index</title>
<meta charset="UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
 
<!-- Optional theme -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- 마우스 오버 요소 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css">

<!-- 마우스 오버 요소 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/js/mdb.min.js"></script>

<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>

<script type="text/javascript" 
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>



    <style>
	ul{width:1263px;height:70px;background:black;opacity:0.5;list-style:none;padding-top:15px;}
	 li{float:left; margin-right:50px }
	 .butn{font-size:20px;color:white;font-weight:bold;text-decoration:none}
	 a{font-size:15px;color:white;font-weight:bold;text-decoration:none}
	</style> 

</head>
<header>

</header>
<body>
	
	<h1>현재 공연작</h1>
	
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
	

	
<div class="container">	
  <div class="row text-center text-lg-left">
     <div class="poster">
    
    <div id="type" class="test" data-index="전체"></div>
	   <c:forEach var="play" items="${playList}">
	  
	     
		    
		      <div class="col-lg-3 col-md-4 col-xs-6" > 

		        <a href="/play/detail?mt20id=${play.mt20id}" class="d-block mb-4 h-100" >
		           <div class="view overlay hm-black-strong" style="width:250; height:370;">
		             <img class="img-fluid img-thumbnail"
				     src="${play.imageUrl}" style="width:250; height:370;" alt="" />  
		            <div class="mask flex-center">
                      <p class="white-text">                      
                      ${play.prfnm}<br>
                      ${play.prfpdfrom}~${play.prfpdto}<br>
                      ${play.fcltynm}<br>
                      ${play.genrenm}
                      </p>
                    </div>
		           </div>   
		         </a> 
		          
		                
			</div>
	  
       </c:forEach>
        
           
    
    </div>
  </div>
        	
</div>

<script>
			
	function change(value) {
		
		$.ajax({
			type:"POST",
			dataType:"JSON",
			url:"/play/now/change",
			data:({ "type" : value }),
			success: function(data) {
				let str ="";
				let typ ="";
				$(".poster").empty(); 
			    $.each(data,function(index, item){					  					 				 
			    	str ="<div class='col-lg-3 col-md-4 col-xs-6' ><a href='/play/detail?mt20id="+ item.mt20id+"' class='d-block mb-4 h-100'><div class='view overlay hm-black-strong' style='width:250; height:370;'>"
							       +"<img class='img-fluid img-thumbnail' src= '"+ item.imageUrl+"'  style='width:250; height:370;' alt=''/><div class='mask flex-center'><p class='white-text'>"+item.prfnm+"<br>"+item.prfpdfrom+"~"+item.prfpdto+"<br>"+item.fcltynm+"<br>"+item.genrenm+"</p></div></div></a></div>" 
					  $(".poster").append(str);
				  });
			    
			    
// 			   typ="<div id='type' class='test' data-index='"+data[0].pType+"'></div>"       
			   typ="<div id='type' class='test' data-index='"+data[0].pType+"'></div>"       
			    $(".poster").append(typ);
			   stNum = 1;
			   let elem = document.getElementById("type");
			   let index = elem.getAttribute("data-index");
				//alert(index);
			}					 						
		})	
	}
	
	
	
	

	let stNum = 1;
	$(window).scroll(function() { 
		
		
		
		if ( $(window).scrollTop() == $(document).height() - $(window).height()) { 
			let elem = document.getElementById("type");
			let index = elem.getAttribute("data-index");
			//alert(index);   
			
			//console.log("스크롤 인식");
						$.ajax({
				type:"POST",
				dataType:"JSON",
				url:"/play/now/getNextPoster",
				data:({ "stNum" : stNum , "index" : index}),
				success: function(data) {
					let str =""; 
				    $.each(data,function(index, item){					  					 				 
				    	str ="<div class='col-lg-3 col-md-4 col-xs-6' ><a href='/play/detail?mt20id="+ item.mt20id+"' class='d-block mb-4 h-100'><div class='view overlay hm-black-strong' style='width:250; height:370;'>"
								       +"<img class='img-fluid img-thumbnail' src= '"+ item.imageUrl+"'  style='width:250; height:370;' alt=''/><div class='mask flex-center'><p class='white-text'>"+item.prfnm+"<br>"+item.prfpdfrom+"~"+item.prfpdto+"<br>"+item.fcltynm+"<br>"+item.genrenm+"</p></div></div></a></div>" 
						  		       
						  $(".poster").append(str);
						  
					  });			
				}					 						
			})
			stNum++;	
	    }
	});

	
	let geocoder = new daum.maps.services.Geocoder();

    let callback = function(result, status) {
      if (status === daum.maps.services.Status.OK) {
       console.log(result);
       console.log(status);
          }
      };

       geocoder.addressSearch('부산광역시 남구 용당동 331', callback);
	
	
	
</script>

</body>
</html>
