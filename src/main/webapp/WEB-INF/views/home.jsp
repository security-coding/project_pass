<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<a
		href="/resources/upload/poster/PF_PF140315_171109_114524.gif">h</a>
	<img src="/resources/upload/poster/PF_PF138723_170724_115743.gif" />
		
<!-- 		<img src="http://localhost:8080/resources/upload/poster/PF_PF140315_171109_114524.gif" /> -->


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>

   <script type="text/javascript" 
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

	<div id="map" style="width: 100%; height: 350px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // ì§ëë¥¼ íìí  div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // ì§ëì ì¤ì¬ì¢í
			level : 3
		// ì§ëì íë ë ë²¨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // ì§ëë¥¼ ìì±í©ëë¤

		// ë§ì»¤ê° íìë  ìì¹ìëë¤ 
		var markerPosition = new daum.maps.LatLng(33.450701, 126.570667);

		// ë§ì»¤ë¥¼ ìì±í©ëë¤
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// ë§ì»¤ê° ì§ë ìì íìëëë¡ ì¤ì í©ëë¤
		marker.setMap(map);

		// ìë ì½ëë ì§ë ìì ë§ì»¤ë¥¼ ì ê±°íë ì½ëìëë¤
		// marker.setMap(null);
		
		
	
		
	</script>
</body>
</html>
