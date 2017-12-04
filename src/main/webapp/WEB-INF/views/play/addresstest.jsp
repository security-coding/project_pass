<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>index</title>
<meta charset="UTF-8">

<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<!-- 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>


</head>
<header>

</header>
<body>
<h1>지도연습</h1>
<div class = "main">
<form action="#" id="form">
<input type="text" id="address" name="word">
<input type="submit" value="검색">
</form>
<form action="/play/result" method="post">
<input type="hidden" name="la" value="">                 
<input type="hidden" name="lo" value="">
<input type="submit" value="보내기">
</form>


<div id="map" style="width:100%;height:350px;"></div>
<p><em>마커를 클릭해주세요!</em></p> 

	
 
 
 
 


<script>
  
       document.getElementById('form').onsubmit = function(){
       
        let search = document.getElementById('address').value;
       
       
       
       let geocoder = new daum.maps.services.Geocoder();

       let callback = function(result, status) {
         if (status === daum.maps.services.Status.OK) {
        //  alert(result);
       //   alert(status);
          let la=""
          let lo=""
          la=result[0].y;
          lo=result[0].x;
          console.log(la);
          console.log(lo);
          
//           let typ="";
//           typ="<form action='/play/result' method='post' id='laloForm'><input type='hidden' id='la' value='"+la+"'><input type='hidden' id='lo' value='"+lo+"'><input type='submit' value='보내기'></form>"       
// 		    $("div").append(typ);
         
             $("input[name=la]").val(la);
             $("input[name=lo]").val(lo);

//              alert($("input[name=la]").value);
//              alert($("input[name=lo]").value);
             
         //alert("위도경도");
         
         }
         };
       
         geocoder.addressSearch(search, callback);
         
      
         
       return false;
       };
       
       
       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = { 
           center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };

   var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     
   // 마커를 표시할 위치입니다 
   var position =  new daum.maps.LatLng(33.450701, 126.570667);

   // 마커를 생성합니다
   var marker = new daum.maps.Marker({
     position: position,
     clickable: true, // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
     mt10id:1234
   });

   // 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
   // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
   // marker.setClickable(true);

   // 마커를 지도에 표시합니다.
   marker.setMap(map);

   // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
   var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
       iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

   // 인포윈도우를 생성합니다
   var infowindow = new daum.maps.InfoWindow({
       content : iwContent,
       removable : iwRemoveable
   });

   // 마커에 클릭이벤트를 등록합니다
   daum.maps.event.addListener(marker, 'click', function() {
         // 마커 위에 인포윈도우를 표시합니다
         infowindow.open(map, marker);  
   });
       
       
       
       
</script>

</body>
</html>
