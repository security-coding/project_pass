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

</div>	

	
 


<script>
  
       document.getElementById('form').onsubmit = function(){
       
        let search = document.getElementById('address').value;
       
       
       
       let geocoder = new daum.maps.services.Geocoder();

       let callback = function(result, status) {
         if (status === daum.maps.services.Status.OK) {
          alert(result);
          alert(status);
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

         alert("위도경도");
         
         }
         };
       
         geocoder.addressSearch(search, callback);
         
       
       return false;
       };
       
</script>

</body>
</html>
