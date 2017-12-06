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

    <style>
        @import url('http://fonts.googleapis.com/earlyaccess/jejugothic.css');

        body,
        table,
        div,
        p,
        header,
        hr,
        footer {
            font-family: 'Jeju Gothic'
        }
    </style>

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
                    if (data == 0) {
                        $(changeStat).attr("src", "/images/likes/full-heart.png");
                        $(changeStat).attr("value", 1);
                    } else {
                        $(changeStat).attr("src", "/images/likes/empty-heart.png");
                        $(changeStat).attr("value", 0);
                    }
                },
                error: function (e) {
                    alert(e.responseText);
                }
            });
        }

        $.ajaxSetup({
            type: "POST",
            async: true,
            dataType: "json",
            error: function (xhr) {
                alert("error html = " + xhr.statusText);
                console.log($("#commentContent").val());
            }
        });

        $(document).ready(function () {
            $("#commentWrite").on("click", function () {
                $.ajax({
                    url: "/comment/write",
                    data: {
                        commentContent: $("#commentContent").val(),
                        //mt20id:"${play.mt20id}   mt20id는 play/dto/DetailDto 안에 있는 공연번호()
                        mt20id: "${detailInf.mt20id}"
                    },
                    success: function (data) {

                        alert("comment가 정성적으로 입력되었습니다");
                        $("#commentContent").val("");

                        let str = "";
                        $.each(data, function (index, item) {

                            str = "<div class='media mb-4'>"
                                + "<img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50' alt=''>"
                                + "<div class='media-body'>"
                                + "<h5 class='mt-0'>" + item.id + "</h5>"
                                + item.commentContent
                                + "</div>"
                                + "</div>"

                            $("#appendWrite").append(str);
                        });
                    }
                });
            });
        });

        function getComment() {
            // 	event.preventDefault();
            $.ajax({
                url: "/comment/read",
                data: {
                    mt20id: "${mt20id}",
                    // 			숫자와 문자연산에서 +를 제외하고는 숫자 우선
                },
                success: function (data) {
                    console.log(data);
                    console.log(data.commentContent);
                    showHtml(data, event);
                }
            });
        }


        function showHtml(data) {


        }
    </script>

</head>

<body>
<%@include file="../loginPage/header.jsp"%>
<div style="height: 100px;"></div>
<div class="row">
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
                <c:choose>
                    <c:when test="${fullHeart eq 0}">
                        <img id="empty-heart" src="/images/likes/empty-heart.png" value=0
                             style="width:20px;, height:20px;" onclick="changeImg(this)">
                    </c:when>
                    <c:when test="${fullHeart eq 1}">
                        <img id="full-heart" src="/images/likes/full-heart.png" value=1
                             style="width:20px;, height:20px;" onclick="changeImg(this)">
                    </c:when>
                </c:choose>


                <h1>${detailInf.prfnm}</h1>
                <h3>${detailInf.genrenm} . ${detailInf.prfpdfrom} ~ ${detailInf.prfpdto}</h3>
                <hr>


                <p/> 공연 시작일 : ${detailInf.prfpdfrom}
                <p/> 공연 종료일 : ${detailInf.prfpdto}
                <p/> 공연 시　간 : ${detailInf.dtguidance}
                <p/> 공연 시설명 : ${detailInf.fcltynm}
                <p/> 공연 출연진 : ${detailInf.prfcast}
                <p/> 공연 제작진 : ${detailInf.prfcrew}
                <p/> 공연 런타임 : ${detailInf.prfruntime}
                <p/> 공연 관람 연령 : ${detailInf.prfage}
                <p/> 공연 제작사 : ${detailInf.entrpsnm}
                <p/> 티켓 가격 : ${detailInf.pcseguidance}
                <p/>
                <p/>
                <p/>
            </section>
        </header>
        <hr/>
        <!-- content -->
        <section class="mainContent">
            <!-- Contact details -->
            <section class="section1">
                <h2 class="sectionTitle">해당 공연의 기본 정보</h2>

                <hr class="sectionTitleRule2">
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
        <h3>본 공연의 지도 위치는 다음과 같습니다.</h3>
        <p/>
        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2"></script>

        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

        <div id="map" style="width: 100%; height: 350px;">
            <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo}), // 지도의 중심좌표
                        level: 5 // 지도의 확대 레벨
                    };

                var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

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

        <!-- Comments Form -->
        <div class="card my-4">
            <p/>
            <h3 class="card-header">본 공연에 대한 댓글 남기기 :</h3>
            <div class="card-body">
                    <div class="form-group">
                        <textarea class="form-control" rows="3"></textarea>
                    </div>
                    <button id="commentwrite" class="btn btn-primary">작성</button>
                    
            </div>
        </div>

        <!-- Single Comment -->
        <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
                <h5 class="mt-0">Commenter Name</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus
                odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate
                fringilla. Donec lacinia congue felis in faucibus.
            </div>
        </div>

            </div>
        </div>

    </div>

</div>


<!-- Replicate the above Div block to add more title and company details -->

</div>
<div>
    <footer>
        <hr>
        <p class="footerDisclaimer">
            2014 Copyrights - <span>All Rights Reserved</span>
        </p>
        <p class="footerNote">
            John Doe - <span>Email me</span>
        </p>
    </footer>
</div>


</body>
</html>