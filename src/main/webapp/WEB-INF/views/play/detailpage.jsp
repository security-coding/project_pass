<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>detailpage.jsp*Concert Information</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/detailpage.css"/>'>

    <!-- jQuery 모달 불러들이기 필수요소-->
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <!-- Bootstrap Core JavaScript -->
    <script src='<c:url value="/js/bootstrap.min.js"/>'></script>

    <script>
        let id = '${id}';
        let mt20id = '${detailInf.mt20id}';
        let heart = '${fullHeart}';
        function changeImg(changeStat) {
            let changeVal = $(changeStat).attr("value");
            console.log(changeVal);
            $.ajax({
                type: "POST",
                async: true,
                dataType: 'json',
                url: "/play/UpdateLikes",
                data: {
                    id: id,
                    mt20id: mt20id,
                    changeVal: changeVal
                },
                success: function (data) {
                    if (data.Stat == 0) {
                        $(inCount).attr("value",data.Count);
                        $(changeStat).attr("src", "/images/likes/full-heart.png");
                        $(changeStat).attr("value", 1);
                    } else if(data.Stat==1) {
                        $(inCount).attr("value",data.Count);
                        $(changeStat).attr("src", "/images/likes/empty-heart.png");
                        $(changeStat).attr("value", 0);
                    }
                },
                error: function (e) {
                    alert("해당 좋아요를 누르기 위해서는 로그인이 필요합니다.");
                }
            });
            
        }
        
        $(function() {
        	 $.ajax({
                 type: "POST",
                 async: true,
                 dataType: 'json',
                 url: "/play/nowLikes",
                 data: {
                     mt20id: mt20id
                 },
				success : function(data){
					$(inCount).attr("value",data);
				}
			});
       });
        
        $(document).ready(function () {
        		paging.ajax = ajaxList;
			ajaxList();
        	
            $("#commentWrite").on("click", function () {
                $.ajax({
                    url: "/comment/write",
                    data: {
                        commentContent: $("#commentContent").val(),
                        mt20id: "${detailInf.mt20id}"
                    },
                    success: function (data) {
                    		alert("!!!");
                    		$("#commentContent").val("");
                    		ajaxList();
                    }
                });
            });
        });
        
        var ajaxList = function() {
			var submitData = {};
			submitData.index = paging.p.index;
			submitData.pageStartNum = paging.p.pageStartNum;
			
			$.ajax({
				url:"/comment/read",
				type:"post",
				data: {
					mt20id : "${detailInf.mt20id}",
					index : paging.p.index,
					pageStartNum : paging.p.pageStartNum
				},
				success: function(obj) {
					$("#comment-group").empty();
					var str='';
					$.each(obj.list, function(index, comment) {
						console.log(comment);
						str += "<div class='media mb-4'>";
	                   	str += "<img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50' alt=''>";
	                    	str += "<div class='media-body'>";
	                    	str += "<h5 class='mt-0'>" + comment.id + "</h5>";
	                    	str += comment.commentContent;
	                    	str += "</div>";
	                    	str += "</div>";
				});
				$("#comment-group").append(str);
				
				paging.p = obj.p;
				paging.create();
			}
			});
		};
    </script>

<style>
@import url('http://fonts.googleapis.com/earlyaccess/jejugothic.css');

body, table, div, p, style, section, h {
	font-family: 'Jeju Gothic'
}
</style>


</head>

<body>
<%@include file="../header.jsp"%>

<div class="row" style="margin-top: 100px">
    <div class="col-md-7 col-md-offset-1">
        <!-- Header content -->
        <header>
            <div class="profilePhoto">
                <!-- Profile photo -->
                <img src="${detailImages[0]}" style="width: 400; height: 100%; " alt="concert-image"/>
            </div>
            <!-- Identity details -->
            <section class="profileHeader">
                <!-- 제목은 h1 tag in, 밑줄에 종류, 그리고 공연 시작기간 ~ 공연 종료기간 부분은 h3 tag in -->
                <!-- 제목 h1 앞에 ajax 통신을 통하여 좋아요 기능 구현 -->

                <!-- <img id="empty-heart" class='empty-heart' src="/images/likes/empty-heart.png" style="width:20px;, height:20px;">
    <img id="full-heart" src="/images/likes/full-heart.png" style="width:20px;, height:20px;" hidden="true">
     -->
     			<table>
     			<tr>
     			<td>
                <c:choose>
                    <c:when test="${fullHeart eq 0}">
                        <img id="empty-heart" src="/images/likes/empty-heart.png" value=0
                             style="width:20px;, height:20px;" onclick="changeImg(this)">
                         <input id=inCount name=inCount type="text" readonly="readonly"
                         style="border:0;">    
                    </c:when>
                    <c:when test="${fullHeart eq 1}">
                        <img id="full-heart" src="/images/likes/full-heart.png" value=1
                             style="width:20px;, height:20px;" onclick="changeImg(this)">
                         <input id=inCount name=inCount type="text" readonly="readonly"
                         style="border:0;">    
                    </c:when>
                </c:choose>
				</td>
				</tr>
     			</table>

                <h1>${detailInf.prfnm}</h1>
                <h3>${detailInf.genrenm} . ${detailInf.prfpdfrom} ~ ${detailInf.prfpdto}</h3>
                <hr />

				<table>
				<tr>
				<td>
				<p>공연 시작일 : ${detailInf.prfpdfrom}</p>
				<p>공연 종료일 : ${detailInf.prfpdto}</p>
				<p>공연 일정 : ${detailInf.dtguidance}</p>
				<p>공연 시설명 : ${detailInf.fcltynm}</p>
				<p>공연 출연진 : ${detailInf.prfcast}</p>
				<p>공연 제작진 : ${detailInf.prfcrew}</p>
				<p>공연 런타임 : ${detailInf.prfruntime}</p>
				<p>공연 관람 연령 : ${detailInf.prfage}</p>
				<p>공연 제작사 : ${detailInf.entrpsnm}</p>
				<p>티켓 가격 : ${detailInf.pcseguidance}</p>
				</td>
				</tr>
				</table>
            </section>
        </header>
        	        <hr />
        <!-- content -->
        <section class="mainContent">
            <!-- Contact details -->
            
            <section class="section1">
            	<table>
    		    <tr>
       			<td>
                <h3 class="profileHeader">해당 공연 정보</h3>
                </td>
		        </tr>
		        </table>
		        <hr class="sectionTitleRule1 context-text" />
                <div class="context-text">
                    <div>
                        <c:forEach var="detailImage" items="${detailImages}" begin="1">
                            <img class="img-fluid img-thumbnail" src="${detailImage}"/>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </section>

        
    </div>
    <div class="col-md-4">
        <h3>공연 지도 위치</h3>
        <p />
        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>

        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

        <div id="map" style="width: 100%; height: 350px;">
            <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo}), // 지도의 중심좌표
                        level: 5, // 지도의 확대 레벨
                        scrollwheel : false,
                        disableDoubleClick : false,
                        disableDoubleClickZoom : false
                    };

                var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                 
                var zoomControl = new daum.maps.ZoomControl();
           	 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

                // 마커가 표시될 위치입니다 
                var markerPosition = new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo});


                // 마커를 생성합니다
                var marker = new daum.maps.Marker({
                    position: markerPosition
                });


                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);

                // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
                // marker.setMap(null);


                let geocoder = new daum.maps.services.Geocoder();

                let callback = function (result, status) {
                    if (status === daum.maps.services.Status.OK) {
                        console.log(result);
                        console.log(status);
                        console.log(result.x);
                    }
                };

                geocoder.addressSearch('부산광역시 남구 용당동 331', callback);
            </script>
        </div>

       <hr class="sectionTitleRule1 context-text" />

        <!-- Comments Form -->
        <div class="card my-4">
            <p/>
            <h3 class="card-header">댓글 남기기 : </h3>
            <div class="card-body">
                    <div class="form-group">
                        <textarea id="commentContent" class="form-control" rows="3"></textarea>
                    </div>
                    <button id="commentWrite" class="btn btn-primary">작성</button>
            </div>
        </div>
       	<div id="comment-group">
       	</div>
       	<%@include file="../paging.jsp" %>
            </div>
        </div>
        
<!-- Replicate the above Div block to add more title and company details -->
<div>
<%@include file="../footer.jsp" %>
</div>

</body>
</html>