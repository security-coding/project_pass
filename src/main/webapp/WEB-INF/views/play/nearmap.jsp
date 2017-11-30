<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Daum 지도</title>
<meta charset="UTF-8">

<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<!-- 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>
</head>


<body>
<!-- 	<div id="map" style="width:500px;height:400px;"></div> -->
	<div id="map" style="width:700px;height:500px;"></div>

 

<script>
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = { 
// 			    center: new daum.maps.LatLng(35.12689494359695, 129.10962908762875), // 지도의 중심좌표 35.12689494359695, 129.10962908762875
			    center: new daum.maps.LatLng(${LA}, ${LO}), // 지도의 중심좌표 35.12689494359695, 129.10962908762875
			    level: 7 // 지도의 확대 레벨
			};
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		  		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		  		<c:forEach items="${maps}" var="info">
		  	        var imageSize = new daum.maps.Size(24, 35);
		  	        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		 			
		 		    // 마커 이미지의 이미지 크기 입니다
		 		    var imageSize = new daum.maps.Size(24, 35); 
				    
		 		    // 마커 이미지를 생성합니다    
		 		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    
		 		    // 마커를 생성합니다
		 		    var marker = new daum.maps.Marker({
		 		        map: map, // 마커를 표시할 지도
		 		        position : new daum.maps.LatLng(${info.la}, ${info.lo}), // 마커를 표시할 위치
		 		        title : "${info.fcltynm}", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		 		        image : markerImage // 마커 이미지 
		 		    }); 
		 		</c:forEach>
</script>
</body>
</html>
