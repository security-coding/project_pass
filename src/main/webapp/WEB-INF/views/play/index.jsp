<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>index</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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


    <style>
	ul{width:1263px;height:70px;background:black;opacity:0.5;list-style:none;padding-top:15px;}
	 li{float:left; margin-right:50px }
	 .butn{font-size:20px;color:white;font-weight:bold;text-decoration:none}
	 a{font-size:15px;color:white;font-weight:bold;text-decoration:none}
	</style> 

</head>
<body>
		
	<ul>
		<li><a class="butn" href = "#" onclick="change(11);">전체</a></li>
		<li><a class="butn" href = "#" onclick="change(1);">연극</a></li>
		<li><a class="butn" href = "#" onclick="change(2);">뮤지컬</a></li>
		<li><a class="butn" href = "#" onclick="change(3);">클레식</a></li>
		<li><a class="butn" href = "#" onclick="change(4);">오페라</a></li>
	    <li><a class="butn" href = "#" onclick="change(5);">무용</a></li>
	    <li><a class="butn" href = "#" onclick="change(6);">발래</a></li>
	    <li><a class="butn" href = "#" onclick="change(7);">국악</a></li>
        <li><a class="butn" href = "#" onclick="change(8);">복합</a></li>
	</ul>
	
<!-- 	버튼방식 -->
<!-- 	<div align="center" vertical-align="middle">		 -->
<!-- 	<button  onclick="change('/pass/play/change',11);">전체</button> -->
<!-- 	</div> -->
<!-- 	<br> -->
<!-- 	<br>	 -->
	
<div class="container">	
  <div class="row text-center text-lg-left">
     <div class="poster">
    
	   <c:forEach var="play" items="${playList}">
	  
	     
		    
		      <div class="col-lg-3 col-md-4 col-xs-6" > 
		      		      
		        <a href="/resources/upload/poster/${play.filename}" class="d-block mb-4 h-100" >
		           <div class="view overlay hm-black-strong" style="width:250; height:370;">
		             <img class="img-fluid img-thumbnail"
				     src="/resources/upload/poster/${play.filename}" style="width:250; height:370;" alt="" />  
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
			url:"/play/change",
			data:({ "type" : value }),
			success: function(data) {
				let str ="";
				$(".poster").empty(); 
			    $.each(data,function(index, item){					  					 				 
			    	str ="<div class='col-lg-3 col-md-4 col-xs-6' ><a href='/resources/upload/poster/"+item.filename+"' class='d-block mb-4 h-100'><div class='view overlay hm-black-strong' style='width:250; height:370;'>"
							       +"<img class='img-fluid img-thumbnail' src='/resources/upload/poster/"+item.filename+"' style='width:250; height:370;' alt=''/><div class='mask flex-center'><p class='white-text'>"+item.prfnm+"<br>"+item.prfpdfrom+"~"+item.prfpdto+"<br>"+item.fcltynm+"<br>"+item.genrenm+"</p></div></div></a></div>" 
					  		       
					  $(".poster").append(str);
				  });			
			}					 						
		})	
	}
</script>

</body>
</html>
