<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	h2 {
		padding-bottom: 50px;
	}
	.content {
		margin: 100px 30px 0 30px;
	}
	
	.label {
		margin-bottom: 96px;
		background-color : gary;
	}
	.label * {display: inline-block;vertical-align: top;}
	.label .center { 
		color : gray;
	}
	
	.imgBox {
		width : 30%;
		height: auto;
	}
	
	.contentBox {
		margin-bottom: 15px;
		display: inline-flex;
	}
	
	.titleInf {
		margin-left: 15px;
	}
</style>
<title>주변 공연 위치</title>
</head>
<body>
	<div>
		<%@include file="../loginPage/header.jsp"%>
	</div>
	<div class="container-fluid content">
	<h2 class="text-center">주변 공연 위치 찾기</h2>
	<div class="col-md-4">
		<div class="well">
			<h4>주소 검색창</h4>
			<p>
			<input class="form-control" type="text" id="address" onclick="execDaumPostcode()" placeholder="클릭하여 주소 검색">
			</p>
			<div id="resultTitles"></div>
		</div>
	</div>
	<div id="mapContainer" class="col-md-8">
		<div id="map" style="width:100%;height:500px;"></div>
	</div>
	</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

<!-- 주소 검색 & 지도 표시 -->
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 7, // 지도의 확대 레벨
            scrollwheel : false,
            disableDoubleClick : false,
            disableDoubleClickZoom : false
        };

    //지도를 미리 생
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();

	 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	 var zoomControl = new daum.maps.ZoomControl();
	 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	 
    var content = '<div class="label"><h3 class="center">주소 입력창에 주소를 검색하면 지도에 공연 정보가 나타납니다. </h3><span class="right"></span></div>';

    var customOverlay = new daum.maps.CustomOverlay({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        content: content      
    })
    
    customOverlay.setMap(map);
    
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
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

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = fullAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
						$(".label").css("display","none");
                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        var data = $.ajax({
                        		type: 'POST',	
							url : '/place/select',
							data: {
                        		la : result.y,
                        		lo : result.x
                        		},
							success : function(data) {
								var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
								$.each(data, function(index, item) {
									var	place = {
										mt10id :	 item.mt10id,
										fcltynm : item.fcltynm,
										relateurl : item.relateurl,
										telno : item.telno
									};
									
									var imageSize = new daum.maps.Size(24, 35);
						  	        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
						  	        
						  	      // 마커 이미지의 이미지 크기 입니다
						 		    var imageSize = new daum.maps.Size(24, 35); 
								    
						 		    // 마커 이미지를 생성합니다    
						 		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
								    
						 		    // 마커를 생성합니다
						 		    marker = new daum.maps.Marker({
						 		        map: map, // 마커를 표시할 지도
						 		        position : new daum.maps.LatLng(item.la, item.lo), // 마커를 표시할 위치
						 		        title : item.fcltynm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						 		        image : markerImage,	 // 마커 이미지
									});
						 		    
						 		   
						 		   (function(marker, place) {
						 		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
						 		        daum.maps.event.addListener(marker, 'click', function() {
						 		        		$("#resultTitles").empty();
						 		            getTitles(place);
						 		        });
						 		    })(marker,place);

								});
							},
							error : function(e) {
								alert(e.responseText);
							}
						});
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                    }
                });
            }
        }).open();
    }
 
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

</html>