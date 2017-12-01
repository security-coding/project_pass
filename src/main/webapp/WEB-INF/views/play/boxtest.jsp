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




<!-- 1263px -->
    <style>
	ul{width:92.5%;height:70px;background:black;opacity:0.8;list-style:none;padding-top:20px; margin: 10px 5px 0px 57px;}
	 li{float:left; margin-right:50px }
	 .butn{font-size:20px;color:white;font-weight:bold;text-decoration:none}
	 a{font-size:15px;color:white;font-weight:bold;text-decoration:none}
	 
.col-xs-15,
.col-sm-15,
.col-md-15,
.col-lg-15 {
    position: relative;
    min-height: 1px;
    padding-right: 10px;
    padding-left: 10px;
}

.col-xs-15 {
    width: 20%;
    float: left;
}
@media (min-width: 768px) {
.col-sm-15 {
        width: 20%;
        float: left;
    }
}
@media (min-width: 992px) {
    .col-md-15 {
        width: 20%;
        float: left;
    }
}
@media (min-width: 1200px) {
    .col-lg-15 {
        width: 20%;
        float: left;
    }
}




.boxoffice {
  width: 16%;
  height: 5%;
  margin: 40px auto;
  
/*   background: red; */
}
  
	</style> 

</head>
<header>

</header>
<body>
<div class="boxoffice">
	<h1>BOX OFFICE</h1>
</div>

	<ul>
		<li><a class="butn" href = "#" onclick="change('YK');">연극</a></li>
		<li><a class="butn" href = "#" onclick="change('MU');">뮤지컬</a></li>
		<li><a class="butn" href = "#" onclick="change('CCO');">클래식/오페라</a></li>
	    <li><a class="butn" href = "#" onclick="change('MMB');">무용/발래</a></li>
	    <li><a class="butn" href = "#" onclick="change('KKB');">국악/복합</a></li>
	</ul>
	
	
	
<div class="container">	
  <div class="row text-center text-lg-left">
    <div class="poster">
    
    <div id="type" class="test row" data-index="전체"></div>
    	
	   <c:forEach var="play" items="${boxList}">
		      <div class="col-lg-15 col-md-3 col-xs-3 boxContent" > 
		        <a href="/play/detail?mt20id=${play.mt20id}" class="d-block mb-4 h-100" >
		           <div class="view overlay hm-black-strong" style="width:233; height:373;">
		             <img class="img-fluid img-thumbnail"
				     src="${play.imageurl}" style="width:250; height:370;" alt="" />  
		            <div class="mask flex-center">
                      <p class="white-text">                      
                      RANK ${play.rnum}<br>
                      ${play.prfnm}<br>
                      ${play.prfpd}<br>
                      ${play.prfplcnm}<br>
                      ${play.cate}
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
			url:"/play/listtest/change",
			data:({ "type" : value }),
			success: function(data) {
				let str ="";
				let typ ="";
				$(".poster").empty(); 
			    $.each(data,function(index, item){					  					 				 
			    	str ="<div class='col-lg-15 col-md-3 col-xs-3' ><a href='/play/detail?mt20id="+ item.mt20id+"' class='d-block mb-4 h-100'><div class='view overlay hm-black-strong' style='width:233; height:373;'>"
							       +"<img class='img-fluid img-thumbnail' src= '"+ item.imageurl+"' style='width:250; height:370;' alt=''/><div class='mask flex-center'><p class='white-text'> RANK"+ item.rnum+"<br>"+item.prfnm+"<br>"+item.prfpd+"<br>"+item.prfplcnm+"<br>"+item.cate+"</p></div></div></a></div>" 
					  		       
					  $(".poster").append(str);
				  });
			          
			}					 						
		})	
	}


	

	
	
	
</script>

</body>
</html>
