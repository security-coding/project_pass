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
		
		<img src="http://localhost:8080/resources/upload/poster/PF_PF140315_171109_114524.gif" />


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>

	<div id="map" style="width: 100%; height: 350px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(33.450701, 126.570667);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>
</body>
</html>
