<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>현재 공연작</title>
<meta charset="UTF-8">

<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/boxoffice.css"/>'>
<!-- jQuery -->
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
</head>
<body style="background-color : #f8f8f8;">
<div>
    <%@include file="../header.jsp"%>
</div>

<h1 class="text-center" style="margin-top: 6%;'">현재 공연작</h1>
<div class="typeNav" > 
	<ul class="nav nav-tabs  nav-justified">
		<li  role="presentation"><a class="top" href="#" onclick="change('전체');">전체</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('연극');">연극</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('뮤지컬');">뮤지컬</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('클래식');">클래식</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('오페라');">오페라</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('무용');">무용</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('발래');">발래</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('국악');">국악</a></li>
	    <li  role="presentation"><a class="top" href="#" onclick="change('복합');">복합</a></li>
	</ul>
</div>
<br>	

<div class="container">
	<div class="row text-center">
		<input type="hidden" id="genre" value="전체">
		<div class="poster">
			
			
		</div>  
		
	
	 </div>
		
	  <br>
	  <br>
	<div class="row text-center"><%@include file="../paging.jsp"%></div>
</div>
<%@include file="../footer.jsp" %>           
<script>
  

	
$(document).ready(function () {
		
	    paging.ajax = ajaxList;
        ajaxList();
//         let genre = document.getElementById("genre").value;
//         alert(genre);
	    
		});
		
		
var ajaxList = function() {

    let genre = document.getElementById("genre").value;
	$.ajax({
		url:"/play/now/getNextPoster",
		type:"post",
		data: {
			genre : genre,
			index : paging.p.index,
			pageStartNum : paging.p.pageStartNum,
		},
		success: function(data) {
			$(".poster").empty();
			var str='';
			if(data.list.length===0){alert("현재공연작이 없습니다.");
			$(".poster").append("<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
			};
			$.each(data.list, function(index, item) {
			
					str = "<div class='col-lg-15 col-md-15 col-sm-3 col-xs-6' >"
                   + "<a href='/play/detail?mt20id=" + item.mt20id + "'>"
	               + "<div style='position: relative; z-index: 1;'>"
                   + "<img class='img-fluid img-thumbnail image-lg image-md image-sm image-xs' src= '" + item.imageUrl + "' alt=''/>"
                   + "<div class='overlay'>"
                   + "<div class='text'>" 							                    
                   + "<p>~"+item.sidonm+"~</p><br>"
                   + "<p>"+item.prfnm+"</p><br>"
		           + "<p>"+item.prfpdfrom+"~"+item.prfpdto+"</p><br>"
                   + "<p>"+item.fcltynm+"</p><br>"
                   + "<p>"+item.genrenm+"</p>"
                   + "</div>"
                   + "</div>"
                   + "</div>"
	               + "</a></div>"  
	               $(".poster").append(str);	       
		});
		
		
		paging.p = data.p;
		paging.create();
	}
	});
};
	
	
	function change(value) {
		paging.ajax = ajaxList; 
		document.getElementById("genre").value = value;
// 		alert(document.getElementById("genre").value);
		paging.p.index=0; 
		paging.p.pageStartNum=1; 
		ajaxList();
		
		
	}

</script>

</body>
</html>
