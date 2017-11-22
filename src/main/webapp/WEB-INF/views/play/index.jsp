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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css">
 

<!-- Latest compiled and minified JavaScript -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/js/mdb.min.js"></script>


</head>
<body>
		
	
	<div align="center" vertical-align="middle">		
	<button  onclick="change('/pass/play/change',11);">전체</button>
	<button  onclick="change('/pass/play/change',1);" >연극</button>
	<button  onclick="change('/pass/play/change',2);" >뮤지컬</button>
	<button  onclick="change('/pass/play/change',3);" >클레식</button>
	<button  onclick="change('/pass/play/change',4);" >오페라</button>
	<button  onclick="change('/pass/play/change',5);" >무용</button>
	<button  onclick="change('/pass/play/change',6);" >발래</button>
	<button  onclick="change('/pass/play/change',7);" >국악</button>
	<button  onclick="change('/pass/play/change',8);" >복합</button>
	</div>
	<br>
	<br>	
	
<div class="container">	
  <div class="row text-center text-lg-left">
     <div class="poster">
    
	   <c:forEach var="play" items="${playList}">
	  
	     
		    
		      <div class="col-lg-3 col-md-4 col-xs-6" > 
		      		      
		        <a href="${pageContext.request.contextPath}/resources/upload/poster/${play}" class="d-block mb-4 h-100" >
		           <div class="view overlay hm-black-strong" style="width:250; height:370;">
		             <img class="img-fluid img-thumbnail"
				     src="${pageContext.request.contextPath}/resources/upload/poster/${play}" style="width:250; height:370;" alt="" />  
		            <div class="mask flex-center">
                      <p class="white-text">${play}</p>
                    </div>
		           </div>   
		         </a> 
		          
		                
			</div>
	  
       </c:forEach>
     
     </div>
  </div>	       	
</div>

<script>
			
	function change(url,value) {
		$.ajax({
			type:"POST",
			dataType:"JSON",
			url:url,
			data:({ "type" : value }),
			success: function(data) {
				let str ="";
// 				alert("2");
// 				alert(data);
				$(".poster").empty(); 
			    $.each(data,function(index, fileName){					  					 				 
			    	str ="<div class='col-lg-3 col-md-4 col-xs-6' ><a href='${pageContext.request.contextPath}/resources/upload/poster/"+fileName+"' class='d-block mb-4 h-100'><div class='view overlay hm-black-strong' style='width:250; height:370;'>"
							       +"<img class='img-fluid img-thumbnail' src='${pageContext.request.contextPath}/resources/upload/poster/"+fileName+"' style='width:250; height:370;' alt=''/><div class='mask flex-center'><p class='white-text'>"+fileName+"</p></div></div></a></div>" 
					  		       
					  $(".poster").append(str);
				  });			
			}					 						
// 			},
// 			beforeSend : function(){
// 				alert("1");
// 			},
// 			complete: function(){ 
// 				alert("3");
// 			},
// 			error: function(xhr) {
// 				alert(xhr.status);
// 			}
		})	
	}
</script>

</body>
</html>
