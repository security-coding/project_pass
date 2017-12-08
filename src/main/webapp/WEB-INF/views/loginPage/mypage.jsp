<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

		
<!-- <script src="//code.jquery.com/jquery-3.1.0.min.js"></script> -->
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>		
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>

<style>
ul{
   list-style:none;
   }
</style>

<script>
function setMyimage(imgsrc){
	let nowProfile=document.getElementById('myimage');
	let img = imgsrc.getAttribute('src');
	nowProfile.setAttribute('src',img);
	$.ajax({
		type:"POST",
		async : true,
		dataType : 'String',
		url:'/member/updateprofile',
		data : {
			srcinput :nowProfile.getAttribute('src') 
		},
		success:function(data){
			
			console.log(data);
		}
	});
}

/*지도 스크립트 */

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
//          document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('detailaddress').focus();
        }
    }).open();
}

function memberClear(){
	if(confirm("회원 탈퇴하시겠습니까?")==true){
		
	}else{
		return false;
	}
}

//추가부분

       var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);


$(document).ready(function(){
    $("#myimage").click(function(){
        if($("#hiddenList").is(":visible")){
            $("#hiddenList").slideUp();
        }else{
            $("#hiddenList").slideDown();
        }
    });
});



</script>

</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
 <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
 <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<body>
	
	<article class="container-fluid">

	
	<div class="page-header">
	<div>
	<%@include file="../header.jsp"%>
	</div>
	</div>
	
	<div class="col-sm-3 col-md-2 sidebar">
		<ul class="nav nav-sidebar">
			<li><p>메뉴</p></li>
			<li class="active"><a href="/member/mypage">내정보<span class="sr-only">(current)</span></a></li>
			<li><a href="/member/myPassChange">회원정보 변경</a></li>
			<li><a href="/member/memberClear" onclick="return memberClear();">회원탈퇴</a></li>
		</ul>
	</div>

	<div class="col-xs-8 col-sm-6">		
		<form id="loginForm" class="form-horizontal" role="form" action="/member/updateuser" method="post"><!-- form -->
			
			<div class="form-group">
				<label for="id" id="id" name="id">ID:${id}
				<div id="idcheck"></div>
			</div>
					
			<div class="form-group">

				<table>
					<tr>
						<label for="email">Email:
							<td><div>
									<input id="email" name="email" type="text" class="form-control"
										placeholder="Email" style="width: 200px"  value="${user.email}" disabled="true"></td>
						</label>
						</td>
					</tr>
				</table>
				
			<tr>
			<label>Address:
			<div>
				<input type="text" id="address" name="address" placeholder="주소" value="${user.address}" disabled="disabled"> - <input type="text" id="detailaddress" name="detailaddress" placeholder="상세주소" value="${user.detailAddress}" disabled="disabled">
			</div>
			</label>
			</tr>
			</div>


			<div>
			<img id="myimage" src="${imageUrl}" alt="..." class="img-thumbnail" onclick="">
			</div>
			<div class="btn-group">
<!-- 				<button id="spreadBtn" type="button"> -->
<%-- 					<img id="myimage" src="${imageUrl}"> <span class="caret"></span> --%>
<!-- 				</button> -->
				<ul id="hiddenList" style="display: none;">
					<li><img id="img1" class="img"
						src="/resources/images/profile/img1.png"
						onclick="setMyimage(this)">악마</li>
					<li><img id="img2" class="img"
						src="/resources/images/profile/img2.png"
						onclick="setMyimage(this)">판다</li>
					<li><img id="img3" class="img"
						src="/resources/images/profile/img3.png"
						onclick="setMyimage(this)">스파이더맨</li>
				</ul>
			</div>
		</form>
		<!-- bookmark content -->
		<div class="row">
			<c:forEach var="bookmark" items="${list}">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="${bookmark.imageUrl}" alt="...">
					<div class="caption">
						<h3>${bookmark.prfnm}</h3>
						<p>${bookmark.prfpdfrom}</p>
						<p>${bookmark.prfpdto}</p>
						<p>${bookmark.genrenm }</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

	
	</article>
	
<!-- 	<div id="map" style="width:500px;height:400px;"></div> -->
	<h3 class="text-center" >거주지 주변 공연현황 </h1>
	<div class="content">
	<div class="col-md-4">
		<div class="well">			
			<div id="resultTitles"></div>
		</div>
	</div>
	<div id="mapContainer" class="col-md-8">
		<div id="map" style="width:500px;height:400px;"></div>
	</div>
	</div>
	
<script>






var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(${la}, ${lo}), // 지도의 중심좌표
            level: 7, // 지도의 확대 레벨
            scrollwheel : false,
            disableDoubleClick : false,
            disableDoubleClickZoom : false
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);

	 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	 var zoomControl = new daum.maps.ZoomControl();
	 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	 
  
	 
	 var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		<c:forEach items="${places}" var="info">
	        
		var	place = {
				mt10id :  "${info.mt10id}",
				fcltynm : "${info.fcltynm}",
				relateurl : "${info.relateurl}",
				telno : "${info.telno}"
			};
		    
		
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
		    
		    
		    (function(marker, place) {
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        daum.maps.event.addListener(marker, 'click', function() {
		        		$("#resultTitles").empty();
		            getTitles(place);
		        });
		    })(marker,place);
		    
		</c:forEach>
	 
		 function getTitles(place) {
		  		var str = "<div><h4 class='text-center'><a href='"+place.relateurl+"' target='_blank'>"+place.fcltynm+"</a></h4>";
				$.ajax({
					url: '/place/titles',
					type: 'post',
					data: {
						mt10id : place.mt10id
					},
					success: function(data) {
						
						$.each(data, function(index, item) {
							
							str += "<div class='contentBox'><div class='imgBox'><a href='/play/detail?mt20id=" + item.mt20id + "'>";
							str += "<img class='img-responsive' src='<c:url value='"+item.imageUrl+"'/>'></a></div>";
							str += "<div class='titleInf'><p>"+item.prfnm+"</p>";
							str += "<p>"+item.prfpdfrom+"<span>~</span>"+item.prfpdto+"</p>";
							str += "<p>"+item.genrenm+"</p>";
							str += "</div></div>";
							str += "<div class='clearfix'></div>";
						});
						str +="</div>";
						str +="<a href='tel:"+place.telno+"'><p>문의 전화 : "+place.telno+"</p></a>";
						$("#resultTitles").append(str);
					},
					error: function(e) {
						alert(e.responseText);
					}
				});
			}

		 
</script>	
	
</body>

<!-- /container -->

<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</html>