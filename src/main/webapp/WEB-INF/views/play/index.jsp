<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>index</title>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	
	
	<button onclick="change('/pass/play/change',1);" >part1</button>
	<button onclick="change('/pass/play/change',2);" >part2</button>
	<br>
	<div class='posterList'></div>
	
	
<div id='aa'>	
	
 <c:forEach var="play" items="${playList}">
   <tr >
    <td>  
         
      <a href="${pageContext.request.contextPath}/resources/upload/poster/${play}">
        <img
		src="${pageContext.request.contextPath}/resources/upload/poster/${play}" />  
      </a> 
         
	</td>
  </tr>
  </c:forEach>

</div>

<script>
	function change(url,value) {
		$.ajax({
			type:"POST",
			url:url,
			data:({ type : value }),
			success: function(data) {
				let str ="";
				alert("2");
				alert(data);
				$("#aa").empty();
			    $.each(data,function(index, fileName){					  					 
						  str ="<tr><td><a href='${pageContext.request.contextPath}/resources/upload/poster/"+fileName+"'>"
							       +"<img src='${pageContext.request.contextPath}/resources/upload/poster/"+fileName+"'/></a></td></tr>" 
							         		  
					  $(".posterList").append(str);
				  });			
								 						
			},
			beforeSend : function(){
				alert("1");
			},
			complete: function(){ 
				alert("3");
			},
			error: function(e) {
				alert(e.responseText);
			}
		})	
	}
</script>

</body>
</html>
